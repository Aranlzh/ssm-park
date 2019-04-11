package ssm.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import ssm.entity.Admin;
import ssm.service.AdminService;

/**
 * 
* @ClassName: AdminController
* @Description: 处理用户相关的异步请求
* @author lixujia
* @date 2018年7月23日 下午10:35:58
*
 */
@Controller
@RequestMapping("/admin")
public class AdminController {

	@Autowired
	private AdminService adminService;
	
	//查找所有管理员
	@RequestMapping("/findAll")
	public @ResponseBody List<Admin> findAll(){
		
		return adminService.findAll();
	}
	
	//根据管理员名称模糊查找管理员
	@RequestMapping("/findAdmins")
	public String findAdminsLikeName(@RequestParam("searchAdmin")String name,Model model) {
		List<Admin> adminList = adminService.findAdminsLikeName(name);
		model.addAttribute("adminList", adminList);
		model.addAttribute("count", adminList.size());
		model.addAttribute("searchAdmin", name);
		return "admin-list";
	}
	
	//根据ID删除管理员
	@ResponseBody
	@RequestMapping("/delAdminById")
	public Map<String, String> delAdminById(@RequestParam("id")Integer id){
		Map<String, String> map = new HashMap<String, String>();
		map.put("res", "1");
		if (adminService.deleteAdminById(id)) {
			map.put("res", "0");
		}
		return map;
		
	}
	
	//添加管理员
	@ResponseBody
	@RequestMapping("/insertAdmin")
	public Map<String , String> insertAdmin(Admin admin) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("res", "1");
		if(adminService.insertAdmin(admin)) {
			map.put("res", "0");
		}
		return map;
	}
	
}
