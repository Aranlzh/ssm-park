package ssm.service;

import java.util.List;

import ssm.entity.Park;

public interface ParkService {
	// 查找所有车位
	public List<Park> findAllPark();
	
	// 通过车位状态查找
	public List<Park> findByStatus(int status)throws Exception;
	
	// 更新车位状态
	public void updateParkStatus(Park park)throws Exception;

	// 按照名字模糊查询车位
	public List<Park> findParkLikeName(String name) throws Exception;
	
	// 按照车位id查找车位
	public Park findParkById(Integer id) throws Exception;
	
	// 添加车位
	public boolean addNewPark(Park park) throws Exception;

	// 编辑车位
	public boolean editPark(Park park) throws Exception;

	// 删除车位
	public boolean deletePark(Park park) throws Exception;

	public Park getPark(Integer id);

	public boolean updatePark(Park park);
}
