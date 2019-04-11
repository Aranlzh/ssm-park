package ssm.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.Reader;
import java.net.URL;
import java.nio.charset.Charset;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.json.JSONException;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import ssm.entity.Orders;
import ssm.entity.Park;
import ssm.service.OrdersService;
import ssm.service.ParkService;

@Controller
@RequestMapping("/park")
public class ParkController {

	@Autowired
	private ParkService parkService;
	@Autowired
	private OrdersService ordersService;

	// 跳转到用户车位列表界面
	@RequestMapping("/toCheckPark")
	public String toCheckPark() {
		return "car";
	}
	
	// 跳转到车位筛选结果页面
	@RequestMapping("/tofindStatusPark")
	public ModelAndView tofindStatusPark(Integer status) throws Exception {
		ModelAndView mv = new ModelAndView();
//		List<Park> parkList = parkService.findByStatus(status);
//		if (parkList != null) {
//			mv.addObject("parkList", parkList);
//			mv.setViewName("car_select");
//		}
		mv.addObject("statusKey", status);
		mv.setViewName("car_select");
		return mv;
	}
	
	// 查询所有 1
	@RequestMapping("/findAllParks")
	public @ResponseBody List<Park> findAll() throws Exception {
		List<Park> list = parkService.findAllPark();
		return list;
	}
	
	// 条件查询 1
	@RequestMapping("/findParkByStatus")
	public @ResponseBody List<Park> findParkByStatus(int status) throws Exception {
		List<Park> list = parkService.findByStatus(status);
		return list;
	}
	
	// 查看车位详情
	@RequestMapping("/findParkById")
	public ModelAndView findParkById(Integer id) throws Exception{
		ModelAndView mv = new ModelAndView();
		Park park = parkService.findParkById(id);
		if (park != null) {
			mv.addObject("parkDetails", park);
			mv.setViewName("car_details");
		}
		return mv;
	}
	
	// 预约车位,预约成功返回订单列表 2
	@RequestMapping("/orderPark")
	public String orderPark(@RequestParam("user_id")Integer userId,@RequestParam("park_id")Integer parkId) throws Exception {
		System.out.println(userId);
		System.out.println(parkId);
		Park park = new Park();
		park.setId(parkId);
		park.setStatus(1);
		parkService.updateParkStatus(park);
		Orders orders = new Orders();
		String code = UUID.randomUUID().toString();
		System.out.println(code);
		DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		String createdate = df.format(new Date());
		System.out.println(createdate);
		Double total = 0.00;
		orders.setCode(code);
		orders.setUserId(userId);
		orders.setParkId(parkId);
		orders.setCreatedate(createdate);
		orders.setStatus(0);
		orders.setTotal(total);
		ordersService.addNewOrder(orders);
		return "showOrder";
	}

	// 按照车位编号模糊查找车位
		@RequestMapping("/findParkLikeName")
		public String findParkLikeName(Model model,@RequestParam("name") String name) throws Exception {
			List<Park> list = parkService.findParkLikeName(name);
			model.addAttribute("parkList", list);
			model.addAttribute("count", list.size());
			model.addAttribute("name",name);
			
			return "chewei-list";
		}

	// 添加车位
		@RequestMapping("/addNewPark")
		@ResponseBody
		public Map<String,String> addNewPark(Park park) throws Exception {
			String address = park.getAddress();
			String[] c = address.split(",");
			StringBuffer sb = new StringBuffer();
			for(String s:c){
				sb.append(s);
			}
			park.setAddress(sb.toString());
			JSONObject json = readJsonFromUrl("http://api.map.baidu.com/geocoder/v2/?address=" + address
					+ "&output=json&ak=4aZAihtj4gsZUg6oPLtxG3ou8hskwMCa");
			// 从车位的位置获得其经纬度
			// 经度
			Double lng = (Double) ((JSONObject)((JSONObject) json.get("result")).get("location")).get("lng");
			// 纬度
			Double lat = (Double) ((JSONObject)((JSONObject) json.get("result")).get("location")).get("lat");
			park.setLng(lng);
			park.setLat(lat);
			Map<String,String> map = new HashMap<>();
			if(parkService.addNewPark(park)){
				map.put("res", "1");
			}else{
				map.put("res", "0");
			}
			return map;
		}

	// 编辑车位
	// 跳转到编辑车位界面
		@RequestMapping("/park-edit")
		public String editPark(Model model,@RequestParam("id")Integer id) throws Exception {
			Park park = parkService.getPark(id);
			model.addAttribute("number", park.getName());
			model.addAttribute("price", park.getPrice());
			model.addAttribute("remarks",park.getRemark());
			String addr = park.getAddress();
			//此处由于车位位置必须是详细地址，所以认为省市区都有值
			String p1 = addr.substring(0, 3);
			String p2 = addr.substring(3, 6);
			String p3 = addr.substring(6, 9);
			String p4 = addr.substring(9);
			model.addAttribute("p1", p1);
			model.addAttribute("p2", p2);
			model.addAttribute("p3", p3);
			model.addAttribute("p4", p4);
			return "chewei-edit";
		}
		@RequestMapping("/deletePark")
		@ResponseBody
		public Map<String,String> deletePark(Park park) throws Exception {
			Map<String,String> map = new HashMap<>();
			if(parkService.deletePark(park)){
				map.put("res", "1");
			}else{
				map.put("res", "0");
			}
			return map;
		}
		
	
	
	// 读取全部的BufferedReader
	private static String readAll(Reader rd) throws IOException {
		StringBuilder sb = new StringBuilder();
		int cp;
		while ((cp = rd.read()) != -1) {
			sb.append((char) cp);
		}
		return sb.toString();
	}

	// 通过API读取JSON数据
	private static JSONObject readJsonFromUrl(String url) throws IOException, JSONException {
		InputStream is = new URL(url).openStream();
		try {
			BufferedReader rd = new BufferedReader(new InputStreamReader(is, Charset.forName("UTF-8")));
			String jsonText = readAll(rd);
			JSONObject json = new JSONObject(jsonText);
			return json;
		} finally {
			is.close();
		}
	}

	//跳转到添加车位界面
		@RequestMapping("/toAddPark")
		public String toAddPark(){
			return "chewei-add";
		}
		
		@RequestMapping("/editPark")
		@ResponseBody
		public Map<String,String> editPark(Park park){
			Map<String,String> map = new HashMap<>();
			map.put("res", "0");
			if(parkService.updatePark(park)){
				map.put("res", "1");
			}
			return map;
		}	
}