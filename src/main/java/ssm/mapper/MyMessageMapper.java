package ssm.mapper;

import java.util.List;

import ssm.entity.Message;
import ssm.entity.MessageQueryVo;

public interface MyMessageMapper {

	public List<Message> findMessagesLikeWhat(MessageQueryVo messageQueryVo);
}
