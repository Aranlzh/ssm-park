package ssm.service;

import java.util.List;

import ssm.entity.Message;

public interface MessageService {
	
	public List<Message> selectMsgList(Integer id);
	
	public void deleteMsg(Integer id);
	
	public void insertMsg(Message msg) ;
	
	public List<Message> findAllMessages();
	
	public List<Message> findMessagesLikeContent(String content);
	
	public void deleteMessageById(Integer id)throws Exception;
	
	public boolean updateMessage(Message message);
}
