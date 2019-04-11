package ssm.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ssm.entity.Message;
import ssm.entity.MessageExample;
import ssm.entity.MessageQueryVo;
import ssm.mapper.MessageMapper;
import ssm.mapper.MyMessageMapper;
import ssm.service.MessageService;

@Service("messageService")
public class MessageServiceImpl implements MessageService {
	
	@Autowired
	MessageMapper messageMapper;
	
	@Override
	public List<Message> selectMsgList(Integer id) {
		MessageExample me = new MessageExample();
		MessageExample.Criteria criteria = me.createCriteria();
		criteria.andUserIdEqualTo(id);
		List<Message> list = messageMapper.selectByExample(me);
		return list;
	}

	@Override
	public void deleteMsg(Integer id) {
		messageMapper.deleteByPrimaryKey(id);
	}

	@Override
	public void insertMsg(Message msg) {
		messageMapper.insert(msg);
	}
	
	@Resource(name="myMessageMapper")
	private MyMessageMapper myMessageMapper;
	
	@Override
	public List<Message> findAllMessages() {
		MessageExample example = new MessageExample();
		
		return messageMapper.selectByExample(example );
	}

	@Override
	public List<Message> findMessagesLikeContent(String content) {
		MessageQueryVo messageQueryVo = new MessageQueryVo();
		Message message = new Message();
		message.setContent(content);
		messageQueryVo.setMessage(message);
		
		return myMessageMapper.findMessagesLikeWhat(messageQueryVo);
	}

	@Override
	public void deleteMessageById(Integer id) throws Exception {
		messageMapper.deleteByPrimaryKey(id);
		
	}

	@Override
	public boolean updateMessage(Message message) {
		try {
			messageMapper.updateByPrimaryKeySelective(message);
			return true;
		} catch (Exception e) {
			// TODO: handle exception
			return false;
		}
	}

}
