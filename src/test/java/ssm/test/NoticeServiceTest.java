package ssm.test;

import javax.annotation.Resource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import ssm.entity.Notice;
import ssm.service.NoticeService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations="classpath:applicationContext.xml")
public class NoticeServiceTest {

	@Resource(name="noticeServiceImpl")
	private NoticeService noticeService;
	
	@Test
	public void testInsert() throws Exception {
		Notice notice = new Notice();
		notice.setTitle("1234556");
		notice.setContent("aoehadhoa");
		noticeService.insertNotice(notice);
	}
	
	@Test
	public void testDelete() throws Exception {
		noticeService.deleteNoticeById(11);
	}
	
}
