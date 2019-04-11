package ssm.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;



import ssm.entity.Notice;
import ssm.entity.Orders;
import ssm.entity.Park;
import ssm.entity.User;
import ssm.service.NoticeService;
import ssm.service.OrdersService;
import ssm.service.ParkService;
import ssm.service.AdminService;
import ssm.service.MessageService;
import ssm.entity.Admin;
import ssm.entity.Message;
import ssm.service.UserService;

@Controller
@RequestMapping("/admin")
public class Admin2ViewsController {

	@Autowired
	private MessageService messageService;
	@Autowired
	private NoticeService noticeService;
	@Autowired
	private UserService userService;
	@Autowired
	private ParkService parkService;
	@Autowired
	private AdminService adminService;
	@Autowired
	private OrdersService ordersService;
	
	@RequestMapping("/userList")
	public ModelAndView toUserList() {
		ModelAndView mv = new ModelAndView();
		List<User> userList = userService.findAll();
		int count = userList.size();
		mv.addObject("userList", userList);
		mv.addObject("count",count);
		mv.setViewName("user-list");
		return mv;
	}
	
	@RequestMapping("/adminList")
	public String toAdminList(Model model) {
		List<Admin> adminList = adminService.findAll();
		int count = adminList.size();
		model.addAttribute("adminList", adminList);
		model.addAttribute("count", count);
		return "admin-list";
	}
	
	@RequestMapping("/messageList")
	public String toLiuyanList(Model model) {
		List<Message> msgList = messageService.findAllMessages();
		int count = msgList.size();
		model.addAttribute("count", count);
		model.addAttribute("msgList", msgList);
		return "liuyan-list";
	}
	
	@RequestMapping("/scoreList")
	public String toJifenList(Model model) {
		List<User> userList = userService.findAll();
		int count = userList.size();
		model.addAttribute("userList", userList);
		model.addAttribute("count",count);
		return "jifen-list";
	}
	
	@RequestMapping("/ordersList")
	public String toOrdersList(Model model) {
		//准备初始化数据
		List<Orders> list = ordersService.selectAll();
		int count = list.size();
		model.addAttribute("ordersList", list);
		model.addAttribute("count", count);
		return "dingdan-list";
	}
	
	@RequestMapping("/pasrkList")
	public String toCheweiList(Model model) {
		List<Park> list = parkService.findAllPark();
		int count=list.size();
		model.addAttribute("count", count);
		model.addAttribute("parkList", list);
		return "chewei-list";
	}
	
	@RequestMapping("/noticeList")
	public String toNoticeList(Model model) {
		List<Notice> all = noticeService.findAllNotices();
		int count = all.size();
		model.addAttribute("allNotices", all);
		model.addAttribute("count", count);
		return "gonggao-list";
	}
	@RequestMapping("/admin-add")
	public String toAdminAdd() {
		return "admin-add";
	}
	
	@RequestMapping("/answer-add")
	public String toAnswerAdd(@RequestParam("messageId")Integer id, Model model) {
		model.addAttribute("messageId", id);
		return "answer-add";
	}
}
