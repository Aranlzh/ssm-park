package ssm.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import ssm.entity.Admin;
import ssm.service.AdminService;

/**
 * 
* @ClassName: LoginAdminController
* @Description: 处理管理员登录
* @author lixujia
* @date 2018年7月23日 下午9:35:30
*
 */
@Controller
@RequestMapping("/admin")
public class LoginAdminController {

	@Autowired
	private AdminService adminService;
	
	@RequestMapping("/login")
	public String toAdminLogin() {
		return "admin-login";
	}
	
	@RequestMapping("/dologin")
	public String login(Model model,HttpServletRequest request,HttpSession session) {
		String adminName = request.getParameter("name");
		String password = request.getParameter("password");
		List<Admin> adminList = adminService.findAdminByName(adminName);
		Admin loginAdmin = null;
		if (adminList.size()>0) loginAdmin = adminList.get(0);
		
		if (loginAdmin==null) {
			model.addAttribute("msg", "没有该用户");
			return "admin-login";
		}else if (!loginAdmin.getPassword().equals(password)) {
			model.addAttribute("msg", "密码错误");
			return "admin-login";
		}else {
//			System.out.println("in");
			session.setAttribute("loginAdmin", loginAdmin);
			model.addAttribute("loginAdmin", loginAdmin);
			return "_blank";
		}
//		return null;
	}
	
	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "admin-login";
	}
}
