package ssm.mapper;

import java.util.List;

import ssm.entity.Notice;
import ssm.entity.NoticeQueryVo;

public interface MyNoticeMapper {

	public List<Notice> findNoticeLikeWhat(NoticeQueryVo noticeQueryVo);
}
