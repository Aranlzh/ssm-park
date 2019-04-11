package ssm.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import ssm.entity.Orders;
import ssm.entity.Park;
import ssm.entity.User;
import ssm.entity.UserQueryVo;
import ssm.service.OrdersService;
import ssm.service.ParkService;
import ssm.service.UserService;
@Controller
@RequestMapping("/orders")
public class OrdersController {
	
	@Autowired
	private ParkService parkService;
	@Autowired
	private OrdersService ordersService;
	@Autowired
	private UserService userService;
	
	/**
	 * @return 我的订单页面
	 */
	@RequestMapping("/toShowOrders")
	public String toShowOrders() {
		return "showOrder";
	}
	
	//查询订单列表 1
		@RequestMapping(value="/selectOrdersByUserId") 	
		@ResponseBody
		public List<Orders> selectOrdersByUserId(Integer id){
			User u=new User();
			u.setId(id);
			UserQueryVo vo = new UserQueryVo();
			vo.setUser(u);
			List<Orders> list = ordersService.selectOrdersByUserId(vo);
//			for (Orders orders : list) {
//				System.out.println(orders.toString());
//			}
			return list;
		}
	
	//订单结算 2
	@RequestMapping("/settlementOrderById")
	public String updateOrdersByOId(@RequestParam("id")Integer id,@RequestParam("userId")Integer userId,@RequestParam("parkId")Integer parkId,@RequestParam("total")Double total) throws Exception{
		// 改变订单状态
		Orders os = new Orders();
		os.setStatus(1);
		os.setTotal(total);
		os.setId(id);
		ordersService.updateOrdersByOId(os);
		// 改变车位状态
		Park park = new Park();
		park.setId(parkId);
		park.setStatus(0);
		parkService.updateParkStatus(park);
		// 改变用户积分
		User user = userService.findUserById(userId);
		Integer point = user.getPoint();
		point = (int) (point + total);
		user.setPoint(point);
		userService.editPoint(user);
		return "showOrder";
	}
	
	//订单删除 1
		@RequestMapping("/userDeleteOrderById")
		public String userDelectOrdersByOId(Integer id){
			ordersService.delectOrdersByOId(id);
			return "showOrder";
	}
	
	//订单删除 2
	@RequestMapping("/deleteOrderById")
	@ResponseBody
	public Map<String,String> delectOrdersByOId(Integer id){
		Map<String,String> map = new HashMap<>(); 
		if(ordersService.delectOrdersByOId(id)){
			map.put("res", "1");
		}else{
			map.put("res", "0");
		}
		return map;
	}
	
	//根据姓名或车牌号模糊查询订单
	@RequestMapping("/findOrdersLike")
	public String findOrdersLike(Model model,@RequestParam("searchorders") String str){
		String name=str;
		String plateNum=str;
		List<Orders> list = ordersService.findOrdersLike(name,plateNum);
		model.addAttribute("count", list.size());
		model.addAttribute("searchorders", str);
		model.addAttribute("ordersList", list);
		return "dingdan-list";
	}
}
