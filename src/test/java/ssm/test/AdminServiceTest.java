package ssm.test;

import java.util.List;

import javax.annotation.Resource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import ssm.entity.Admin;
import ssm.service.AdminService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations="classpath:applicationContext.xml")
public class AdminServiceTest {

	@Resource(name="adminServiceImpl")
	private AdminService adminServiceImpl;
	
	@Test
	public void testFindAdmin() throws Exception {
		List<Admin> admin = adminServiceImpl.findAdminByName("admin");
		System.out.println(admin.get(0).getName()+"  "+admin.get(0).getPassword()+"  "+admin.get(0).getCreatedate());
	}
	
	@Test
	public void testFindAll() throws Exception {
		List<Admin> adminList = adminServiceImpl.findAll();
		for(Admin admin:adminList)
			System.out.println(admin.getName()+"  "+admin.getPassword()+"  "+admin.getCreatedate());
	}
	
	@Test
	public void testFindAdminsLikeName() throws Exception {
		List<Admin> adminList = adminServiceImpl.findAdminsLikeName("ad");
		for(Admin admin:adminList)
			System.out.println(admin.getName()+"  "+admin.getPassword()+"  "+admin.getCreatedate());
	}
}
