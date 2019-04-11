package ssm.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import ssm.entity.Admin;
import ssm.entity.Message;
import ssm.service.MessageService;
@Controller
@RequestMapping("/message")
public class MessageController {
	
	@Autowired
	private MessageService messageService;
	
	/**
	 * @return 我的留言界面
	 */
	@RequestMapping("/toMyMessage")
	public String toMyMessage() {
		return "myMessage";
	}
	
	/**
	 * @param id 用户的ID
	 * @return 该用户的留言列表
	 */
	@RequestMapping("/selectMessageByUserId")
	@ResponseBody
	public List<Message> selectMessagesByUserId(Integer id) throws Exception{
		return messageService.selectMsgList(id);
	}
	
	@RequestMapping("/addMessage")
	public String addMessages(@RequestParam("userId")Integer id,@RequestParam("userName")String userName,@RequestParam("content")String content) {
		Message msg = new Message();
		msg.setUserId(id);
		msg.setUserName(userName);
		msg.setContent(content);
		msg.setCreatedate(new Date());
		messageService.insertMsg(msg);
		return "myMessage";
	}
	
	//删除留言 2
	@RequestMapping(value="/deleteMsg")
	public String deleteMsg(Integer id){
		messageService.deleteMsg(id);
		//删除成功后重定向到留言板内容显示
		return "myMessage";
	}
	
	//根据id删除留言：后台页面
	@ResponseBody
	@RequestMapping("/delMessage")
	public Map<String,String> delMessage(@RequestParam("id")Integer id, Model model){
		Map<String,String> map = new HashMap<String, String>();
		map.put("res", "1");
		try {
			messageService.deleteMessageById(id);
			map.put("res", "0");
			return map;
		} catch (Exception e) {
			// TODO: handle exception
			return map;
		}
	}
	
	//用户留言 2
	public @ResponseBody List<Message> addMsg(@RequestParam("userId") Integer id,@RequestParam("MsgContent") String content){
		Message msg = new Message();
		msg.setUserId(id);
		msg.setContent(content);
		msg.setCreatedate(new Date());
		messageService.insertMsg(msg);	
		List<Message> list = messageService.selectMsgList(id);
		return list;
	}
	
	//根据留言内容模糊查找留言
	@RequestMapping("/findMessages")
	public String findMessageLikeContent(@RequestParam("content")String content,Model model) {
		List<Message> msgList = messageService.findMessagesLikeContent(content);
		model.addAttribute("msgList", msgList);
		model.addAttribute("count",msgList.size());
		model.addAttribute("content", content);
		return "liuyan-list";
	}
	
	//修改留言 - 留言回复
	@ResponseBody
	@RequestMapping("/answer-save")
	public Map<String, String> answerSave(Message message, HttpSession session) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("res", "1");
		Admin admin = (Admin) session.getAttribute("loginAdmin");
		message.setAdminId(admin.getId());
		message.setAdminName(admin.getName());
		message.setAnswerdate(new Date());
		if(messageService.updateMessage(message)) {
			map.put("res", "0");
		}
		return map;
	}
}
