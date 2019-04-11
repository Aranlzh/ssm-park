package ssm.mapper;

import java.util.List;

import ssm.entity.Park;
import ssm.entity.ParkQueryVo;

public interface MyParkMapper {
	public List<Park> findParksLikeWhat(ParkQueryVo parkQueryVo)throws Exception;
}
