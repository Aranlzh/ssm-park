package ssm.service.impl;

import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import ssm.entity.Notice;
import ssm.entity.NoticeExample;
import ssm.entity.NoticeQueryVo;
import ssm.mapper.MyNoticeMapper;
import ssm.mapper.NoticeMapper;
import ssm.service.NoticeService;

@Service(value="noticeServiceImpl")
@Transactional
public class NoticeServiceImpl implements NoticeService {
	
	@Resource(name="noticeMapper")
	private NoticeMapper noticeMapper;
	@Resource(name="myNoticeMapper")
	private MyNoticeMapper myNoticeMapper;

	@Override
	public List<Notice> findAllNotices() {
		NoticeExample example = new NoticeExample();
		
		return noticeMapper.selectByExample(example);
	}
	
	@Override
	public Notice findNoticeById(Integer id) throws Exception {
		return noticeMapper.selectByPrimaryKey(id);
	}

	@Override
	public boolean insertNotice(Notice notice) throws Exception {
		notice.setCreatedate(new Date());
		if(noticeMapper.insert(notice)>0){
			return true;
		}
		return false;
	}

	@Override
	public boolean deleteNoticeById(Integer id) throws Exception {
		if(noticeMapper.deleteByPrimaryKey(id)>0){
			return true;
		}else{
			return false;
		}
	}

	@Override
	public boolean updateNotice(Notice record) throws Exception {
		try{
			noticeMapper.updateByPrimaryKeySelective(record);
			return true;
		}catch (Exception e) {
			return false;
		}
	}

	@Override
	public List<Notice> findNoticesLikeTitle(String title){
		NoticeQueryVo noticeQueryVo = new NoticeQueryVo();
		Notice notice = new Notice();
		notice.setTitle(title);
		noticeQueryVo.setNotice(notice);
		
		return myNoticeMapper.findNoticeLikeWhat(noticeQueryVo);
	}

	
}
