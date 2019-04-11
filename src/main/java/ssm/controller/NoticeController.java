package ssm.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import ssm.entity.Admin;
import ssm.entity.Notice;
import ssm.service.NoticeService;

@Controller
@RequestMapping("/notice")
public class NoticeController {

	@Autowired
	private NoticeService noticeServiceImpl;
	
	//查找所有公告
	@RequestMapping("/findAllNotices")
	public @ResponseBody List<Notice> findAllNotices() throws Exception{
		return noticeServiceImpl.findAllNotices();
	}
	
	@RequestMapping("/toFindNoticeById")
	public ModelAndView toNoticeById(Integer id) throws Exception{
		ModelAndView mv = new ModelAndView();
		Notice notice = noticeServiceImpl.findNoticeById(id);
		if(notice!=null){
			mv.addObject("notice",notice);
			mv.setViewName("notice_details");
		}
		return mv;
		
	}
	
	// 跳转到某一个公告的编辑界面
	@RequestMapping("/notice-edit")
	public String toNoticeById(Model model,@RequestParam("id") Integer id) throws Exception {
		Notice notice = noticeServiceImpl.findNoticeById(id);
		if (notice != null) {
			model.addAttribute("noticeId", notice.getId());
			model.addAttribute("title", notice.getTitle());
			model.addAttribute("content", notice.getContent());
		}
		return "gonggao-edit";
	}
	
	//根据ID查询公告
	@RequestMapping("/findNoticeById")
	@ResponseBody
	public Notice findNoticeById(Integer id) throws Exception {
		return noticeServiceImpl.findNoticeById(id);
	}
	
	//插入公告
	@RequestMapping("/insertNotice")
	@ResponseBody
	public Map<String,String> insertNotice(Notice notice,HttpSession session) throws Exception {
		Admin admin = (Admin)session.getAttribute("loginAdmin");
		notice.setAdminName(admin.getName());
		notice.setAdminId(admin.getId());
		notice.setCreatedate(new Date());
		Map<String,String> map = new HashMap<String,String>();
		if(noticeServiceImpl.insertNotice(notice)){
			map.put("res", "1");
		}else{
			map.put("res", "0");
		}
		return map;
	}
	
	//根据ID删除公告
	@RequestMapping("/deleteNotice")
	@ResponseBody
	public Map<String,String> deleteNotice(@RequestParam("id")Integer id) throws Exception {
		Map<String,String> map = new HashMap<>();
		if(noticeServiceImpl.deleteNoticeById(id)){
			map.put("res","1");
		}else{
			map.put("res","0");
		}
		return map;
	}
	
	//修改公告
	@RequestMapping("/updateNotice")
	@ResponseBody
	public Map<String,String> updateNotice(Notice notice) throws Exception {
		Map<String,String> map = new HashMap<String,String>();
		map.put("res", "0");
		if(noticeServiceImpl.updateNotice(notice)) {
			map.put("res", "1");
		}
		return map;
		
	}
	
	//根据标题模糊查找公告
	@RequestMapping("/findNoticesLikeTitle")
	public String findNoticesLikeTitle(Model model,@RequestParam("title")String title){
		List<Notice> list = noticeServiceImpl.findNoticesLikeTitle(title);
		model.addAttribute("count",list.size());
		model.addAttribute("title", title);
		model.addAttribute("allNotices", list);
		return "gonggao-list";
	}
	
	@RequestMapping("/toAddNotice")
	public String toAddNotcie(){
		return "gonggao-add";
	}
}
