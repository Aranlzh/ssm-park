package ssm.mapper;

import java.util.List;
import org.apache.ibatis.annotations.Param;
import ssm.entity.Park;
import ssm.entity.ParkExample;

public interface ParkMapper {
    int countByExample(ParkExample example);

    int deleteByExample(ParkExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(Park record);

    int insertSelective(Park record);

    List<Park> selectByExample(ParkExample example);

    Park selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") Park record, @Param("example") ParkExample example);

    int updateByExample(@Param("record") Park record, @Param("example") ParkExample example);

    int updateByPrimaryKeySelective(Park record);

    int updateByPrimaryKey(Park record);
}