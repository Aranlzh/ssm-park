package ssm.mapper;

import java.util.List;

import ssm.entity.Orders;
import ssm.entity.User;
import ssm.entity.UserQueryVo;

public interface MyUserMapper {

	public List<User> findUsersLikeWhat(UserQueryVo userQueryVo)throws Exception;
	
	public List<Orders> findOrdersByUserId(UserQueryVo userQueryVo);
}
