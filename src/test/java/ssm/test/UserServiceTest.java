package ssm.test;

import java.util.List;

import javax.annotation.Resource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import ssm.entity.User;
import ssm.service.UserService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations="classpath:applicationContext.xml")
public class UserServiceTest {

	@Resource(name="userServiceImpl")
	private UserService userServiceImpl;
	
	@Test
	public void testFindAll() throws Exception {
		List<User> list = this.userServiceImpl.findAll();
		for(User u:list) {
			System.out.println(u.getName()+"  "+u.getId()+"  "+u.getPassword());
		}
	}
	
	@Test
	public void testFindUserByName() throws Exception {
		User user = userServiceImpl.findUserByName("张三");
		System.out.println(user);
	}
	
	@Test
	public void findUsersLikeName() throws Exception {
		List<User> list = this.userServiceImpl.findUsersLikeName("张");
		for(User u:list) {
			System.out.println(u.getName()+"  "+u.getId()+"  "+u.getPassword());
		}
	}
	
	@Test
	public void testEditPoint() throws Exception {
		User user = this.userServiceImpl.findUserById(21);
		Integer point = user.getPoint();
		point = point + 10;
		user.setPoint(point);
		System.out.println(user.toString());
		userServiceImpl.editPoint(user);
	}
	
}
