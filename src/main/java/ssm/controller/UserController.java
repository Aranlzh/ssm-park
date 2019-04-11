package ssm.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import ssm.entity.User;
import ssm.service.UserService;
/**
 * 
* @ClassName: UserController
* @Description: 处理用户相关的异步请求
* @author lixujia
* @date 2018年7月23日 下午11:38:59
*
 */
@Controller
@RequestMapping("/user")
public class UserController {

	@Autowired
	private UserService userService;
	
	// 跳转到个人中心页面
	@RequestMapping("/toUserPersonalInfo")
	public String toUserPersonalInfo() {
		return "personalInfo";
	}
	
	// 跳转到修改密码
	@RequestMapping("/toPassword")
	public String toPassword() {
		return "password";
	}
	
	
	// 查找所有用户
	@RequestMapping(value="/findAll") 
	@ResponseBody
	public List<User> findAll() throws Exception {
		List<User> userList = userService.findAll();
		return userList;
	}
	
	// 根据用户名模糊查找用户 - 用户列表
	@RequestMapping("/findUsers")
	public String findUsersLikeName(@RequestParam("searchName")String name,Model model) throws Exception{
		List<User> userList = userService.findUsersLikeName(name);
		model.addAttribute("userList", userList);
		model.addAttribute("count", userList.size());
		model.addAttribute("searchName", name);
		return "user-list";
	}
	
	// 根据用户名模糊查找用户 - 查找积分
	@RequestMapping("/findScores")
	public String findScoreLikeName(@RequestParam("searchName")String name, Model model) throws Exception{
		List<User> userList = userService.findUsersLikeName(name);
		model.addAttribute("userList", userList);
		model.addAttribute("count", userList.size());
		model.addAttribute("searchName", name);
		return "jifen-list";
	}
	
	// 根据用户ID查找用户
	@RequestMapping("/findUserById")
	@ResponseBody
	public User findUserById(Integer id){
		return userService.findUserById(id);
	}
	
	// 修改手机号码&车牌
	@RequestMapping("/editPhone&PlateNum")
	public String editPhone_PlateNum(@RequestParam("uid")Integer id,@RequestParam("phone")String phone,@RequestParam("plate_num")String plateNum){
		User user = new User();
		user.setId(id);
		user.setPhone(phone);
		user.setPlateNum(plateNum);
		userService.editPhone_PlateNum(user);
		return "personalInfo";
	}
	// 修改密码  
	@RequestMapping(value="/editPassword")
	public String editPassword(@RequestParam("uid")Integer id,@RequestParam("oldpassword")String oldPsw,@RequestParam("newpassword")String newPsw){
		User u = userService.findUserById(id);
		if(u.getPassword().equals(oldPsw)) {
			User user = new User();
			user.setId(id);
			user.setPassword(oldPsw);
			user.setPassword(newPsw);
			userService.editPassword(user);
			return "user-join";
		}
		return "password";
	}
	
		//停用用户
	@ResponseBody
	@RequestMapping("/stopUser")
	public Map<String, String> stopUser(@RequestParam("id")Integer id) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("res", "1");
		if (userService.updateStatusById(id, 1)) {
			map.put("res", "0");
		}
		return map;
	}
	//启用用户
	@ResponseBody
	@RequestMapping("/startUser")
	public Map<String, String> startUser(@RequestParam("id")Integer id) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("res", "1");
		if (userService.updateStatusById(id, 0)) {
			map.put("res", "0");
		}
		return map;
	}
}
