package ssm.service.impl;

import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import ssm.entity.Admin;
import ssm.entity.AdminExample;
import ssm.entity.AdminQueryVo;
import ssm.mapper.AdminMapper;
import ssm.mapper.MyAdminMapper;
import ssm.service.AdminService;

@Service
@Transactional
public class AdminServiceImpl implements AdminService {

	@Resource(name="adminMapper")
	private AdminMapper adminMapper;
	@Resource(name="myAdminMapper")
	private MyAdminMapper myAdminMapper;

	@Override
	public List<Admin> findAdminByName(String name) {
		AdminExample example = new AdminExample();
		AdminExample.Criteria criteria = example.createCriteria();
		criteria.andNameEqualTo(name);
		List<Admin> admin = adminMapper.selectByExample(example);
		return admin;
	}

	@Override
	public List<Admin> findAll() {
		AdminExample example = new AdminExample();
		List<Admin> admins = adminMapper.selectByExample(example);
		return admins;
	}

	@Override
	public List<Admin> findAdminsLikeName(String name) {
		AdminQueryVo adminQueryVo = new AdminQueryVo();
		Admin admin = new Admin();
		admin.setName(name);
		adminQueryVo.setAdmin(admin);
		
		return myAdminMapper.findAdminsLikeWhat(adminQueryVo);
	}

	@Override
	public boolean insertAdmin(Admin admin) {
		admin.setCreatedate(new Date());
		if(adminMapper.insert(admin)>0)
				return true;
		return false;
	}

	@Override
	public boolean deleteAdminById(Integer id) {
		try {
			adminMapper.deleteByPrimaryKey(id);
			return true;
		} catch (Exception e) {
			// TODO: handle exception
			return false;
		}
	}
	
	
}
