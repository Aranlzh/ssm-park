package ssm.test;

import java.util.List;

import javax.annotation.Resource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import ssm.entity.Message;
import ssm.service.MessageService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations="classpath:applicationContext.xml")
public class MessageServiceTest {

	@Resource(name="messageServiceImpl")
	private MessageService messageServiceImpl;
	
	@Test
	public void testFindAllMessages() throws Exception {
		List<Message> msgList = messageServiceImpl.findAllMessages();
		for(Message msg:msgList) {
			System.out.println(msg.getContent());
		}
	}
	@Test
	public void testFindMessagesLike() throws Exception {
		List<Message> msgList = messageServiceImpl.findMessagesLikeContent("mmp");
		for(Message msg:msgList) {
			System.out.println(msg.getContent());
		}
	}
	
}
