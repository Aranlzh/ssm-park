package ssm.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import ssm.entity.Park;
import ssm.entity.ParkExample;
import ssm.entity.ParkQueryVo;
import ssm.mapper.MyParkMapper;
import ssm.mapper.ParkMapper;
import ssm.service.ParkService;

@Service
@Transactional
public class ParkServiceImpl implements ParkService {
	
	@Resource(name="parkMapper")
	private ParkMapper parkMapper;
	@Resource(name="myParkMapper")
	private MyParkMapper myParkMapper;
	
	@Override
	public List<Park> findAllPark() {
		ParkExample pe = new ParkExample();
		List<Park> list = parkMapper.selectByExample(pe);
		return list;
	}

	@Override
	public List<Park> findByStatus(int status) {
		ParkExample pe = new ParkExample();
		ParkExample.Criteria criteria = pe.createCriteria();
		criteria.andStatusEqualTo(status);
		List<Park> list = parkMapper.selectByExample(pe);
		return list;
	}

	@Override
	public void updateParkStatus(Park park) {
		parkMapper.updateByPrimaryKeySelective(park);
	}

	@Override
	public List<Park> findParkLikeName(String name) throws Exception {
		ParkQueryVo parkQueryVo = new ParkQueryVo();
		Park park = new Park();
		park.setName(name);
		parkQueryVo.setPark(park);
		return myParkMapper.findParksLikeWhat(parkQueryVo);
	}

	@Override
	public boolean addNewPark(Park park) throws Exception {
		int rows = parkMapper.insert(park);
		if (rows>0) {
			return true;
		} else {
			return false;
		}
	}

	@Override
	public boolean editPark(Park park) throws Exception {
		int rows = parkMapper.updateByPrimaryKey(park);
		if (rows>0) {
			return true;
		} else {
			return false;
		}
	}

	@Override
	public boolean deletePark(Park park) throws Exception {
		Integer id = park.getId();
		int rows = parkMapper.deleteByPrimaryKey(id);
		if (rows>0) {
			return true;
		} else {
			return false;
		}
	}
	@Override
	public Park findParkById(Integer id) throws Exception {
		return parkMapper.selectByPrimaryKey(id);
	}
	@Override
	public Park getPark(Integer id) {
		return parkMapper.selectByPrimaryKey(id);
	}

	@Override
	public boolean updatePark(Park park) {
		try{
			parkMapper.updateByPrimaryKeySelective(park);
			return true;
		}catch (Exception e) {
			return false;
		}
	}

}
