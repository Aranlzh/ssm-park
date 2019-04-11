package ssm.service;

import java.util.List;

import ssm.entity.Admin;

public interface AdminService {

	public List<Admin> findAdminByName(String name);
	
	public List<Admin> findAll();
	
	public List<Admin> findAdminsLikeName(String name);
	
	public boolean insertAdmin(Admin admin);
	
	public boolean deleteAdminById(Integer id);
}
