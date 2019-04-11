package ssm.service;

import java.util.List;

import ssm.entity.Notice;


public interface NoticeService {

	public List<Notice> findAllNotices();
	
	public Notice findNoticeById(Integer id) throws Exception;
	
	public boolean insertNotice(Notice notice) throws Exception;
	
	public boolean deleteNoticeById(Integer id) throws Exception;
	
	public boolean updateNotice(Notice notice)throws Exception;
	
	public List<Notice> findNoticesLikeTitle(String title);
}
