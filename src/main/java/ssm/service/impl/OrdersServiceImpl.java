package ssm.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import ssm.entity.Orders;
import ssm.entity.OrdersQueryVo;
import ssm.entity.User;
import ssm.entity.UserQueryVo;
import ssm.mapper.MyOrdersMapper;
import ssm.mapper.OrdersMapper;
import ssm.service.OrdersService;

@Service
@Transactional
public class OrdersServiceImpl implements OrdersService {
	
	@Autowired
	private MyOrdersMapper myOrdersMapper;
	@Autowired
	private OrdersMapper ordersMapper;

	@Override
	public List<Orders> selectOrdersByUserId(UserQueryVo vo) {
		List<Orders> list = myOrdersMapper.findOrdersByUserId(vo);
		return list;
	}

	@Override
	public void updateOrdersByOId(Orders orders) {
		ordersMapper.updateByPrimaryKeySelective(orders);
	}

	@Override
	public boolean delectOrdersByOId(Integer id) {
		try{
			ordersMapper.deleteByPrimaryKey(id);
			return true;
		}catch (Exception e) {
			return false;
		}
	}

	@Override
	public List<Orders> selectAll() {
		List<Orders> list = myOrdersMapper.findAllOrders();
		return list;
	}

	@Override
	public List<Orders> findOrdersLike(String name, String plateNum) {
		User u = new User();
		u.setName(name);
		u.setPlateNum(plateNum);
		Orders o = new Orders();
		o.setUser(u);
		OrdersQueryVo vo = new OrdersQueryVo();
		vo.setOrders(o);
		List<Orders> list = myOrdersMapper.findOrdersLike(vo);
		return list;
	}
	@Override
	public void addNewOrder(Orders orders) {
		ordersMapper.insert(orders);
	}
}
