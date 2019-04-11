package ssm.mapper;

import java.util.List;

import ssm.entity.Admin;
import ssm.entity.AdminQueryVo;

public interface MyAdminMapper {

	public List<Admin> findAdminsLikeWhat(AdminQueryVo adminQueryVo);
}
