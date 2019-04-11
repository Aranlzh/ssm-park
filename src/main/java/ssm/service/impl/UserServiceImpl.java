package ssm.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import ssm.entity.User;
import ssm.entity.UserExample;
import ssm.entity.UserQueryVo;
import ssm.mapper.MyUserMapper;
import ssm.mapper.UserMapper;
import ssm.service.UserService;

@Service
@Transactional
public class UserServiceImpl implements UserService {

	@Resource(name="userMapper")
	private UserMapper userMapper;
	@Resource(name="myUserMapper")
	private MyUserMapper myUserMapper;

	@Override
	public List<User> findAll()  {
		UserExample example = new UserExample();

		return userMapper.selectByExample(example);
	}

	@Override
	public User findUserByName(String name) throws Exception {
		UserExample userExample = new UserExample();
		UserExample.Criteria criteria = userExample.createCriteria();
		criteria.andNameEqualTo(name);
		User user =  userMapper.selectByExample(userExample).get(0);
		
		return user;
	}

	@Override
	public List<User> findUsersLikeName(String name) throws Exception {
		UserQueryVo userQueryVo = new UserQueryVo();
		User user = new User();
		user.setName(name);
		userQueryVo.setUser(user);
		
		return myUserMapper.findUsersLikeWhat(userQueryVo);
	}

	@Override
	public User findUserById(Integer id) {
		User user = userMapper.selectByPrimaryKey(id);
		return user;
	}

	@Override
	public void editPassword(User user) {
		userMapper.updateByPrimaryKeySelective(user);
	}

		@Override
	public void addNewUser(User user) {
		userMapper.insert(user);
	}
	@Override
	public boolean updateStatusById(Integer id, int status) {
		User record = new User();
		record.setId(id);
		record.setStauts(status);
		try {
			userMapper.updateByPrimaryKeySelective(record);
			return true;
		}catch (Exception e) {
			return false;
		}
	}

	@Override
	public void editPhone_PlateNum(User user) {
		userMapper.updateByPrimaryKeySelective(user);
	}

	@Override
	public void editPoint(User user) {
		userMapper.updateByPrimaryKeySelective(user);
		
	}
	
	
}
