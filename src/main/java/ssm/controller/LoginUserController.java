package ssm.controller;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import ssm.entity.User;
import ssm.service.UserService;

/**
 * 
* @ClassName: LoginUserController
* @Description: 处理用户登录
* @author lixujia,Aranlzh
* @date 2018年7月23日 下午8:43:29
*
 */
@Controller
@RequestMapping("/user")
public class LoginUserController {
	
	@Autowired
	private UserService userServiceImpl;
	
	/**
	 * @return 跳转到登录界面
	 */
	@RequestMapping("/toUserLogin")
	public String toUserLogin() {
		return "user-join";
	}
	
	/**
	 * 登录功能
	 */
	@RequestMapping("/login")
	public ModelAndView login(HttpServletRequest request,HttpServletResponse response,HttpSession session) throws Exception {
		String name = request.getParameter("username");
		String password = request.getParameter("password");
//		System.out.println("name:"+name+" password:"+password);
		User loginUser = userServiceImpl.findUserByName(name);
		ModelAndView mv = new ModelAndView();
		if(loginUser == null) {
			mv.addObject("msg", "没有该用户");
			//设置视图跳转页面
			mv.setViewName("user-join");
		}else if (!loginUser.getPassword().equals(password)) {
			mv.addObject("msg", "密码错误");
			//设置视图跳转页面
			mv.setViewName("user-join");
		}else if(loginUser.getStauts()==1){
			mv.addObject("msg", "你已被停用，请联系管理员！");
			//设置视图跳转页面
			mv.setViewName("user-join");
		}else {
			//将登录用户保存至会话中
			session.setAttribute("loginUser", loginUser);
			//添加登录用户至ModelAttribute
			mv.addObject("loginUser",loginUser);
			mv.setViewName("index");
		} 
		return mv;
	}
	
	/**
	 * 注销登录
	 */
	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		//清除会话
		session.invalidate();
		return "index";
	}
}
