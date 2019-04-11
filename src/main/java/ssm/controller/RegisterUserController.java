package ssm.controller;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import ssm.entity.User;
import ssm.service.UserService;
/**
 * @ClassName:RegisterUserController.java
 * @Description:新用户注册
 * @author:Aranlzh
 * @date:2018年7月31日
 *
 */

@Controller
@RequestMapping("/user")
public class RegisterUserController {
	
	@Autowired
	private UserService userServiceImpl;
	
	/**
	 * 用户注册功能
	 */
	@RequestMapping("/register")
	public String register(HttpServletRequest request,HttpServletResponse response) throws Exception {
		String name = request.getParameter("name");
		String phone = request.getParameter("phone");
		String plateNum = request.getParameter("plate_num");
		String password = request.getParameter("password");
		Date createdate = new Date();
		User user = new User();
		user.setName(name);
		user.setPhone(phone);
		user.setPlateNum(plateNum);
		user.setStauts(0);
		user.setPassword(password);
		user.setCreatedate(createdate);
		user.setPoint(0);
		userServiceImpl.addNewUser(user);
		return "user_save";
	}
}
