package ssm.service;

import java.util.List;

import ssm.entity.User;

public interface UserService {
	
	public List<User> findAll();
	
	public User findUserByName(String name) throws Exception;
	
	public List<User> findUsersLikeName(String name)throws Exception;
	
	public User findUserById(Integer id); 
	
	public void editPassword(User user);
	
	public void addNewUser(User user);
	
	public void editPhone_PlateNum(User user);
	
	public void editPoint(User user);
	
	public boolean updateStatusById(Integer id,int status);
}
