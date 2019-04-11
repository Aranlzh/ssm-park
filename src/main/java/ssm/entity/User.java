package ssm.entity;

import java.util.Date;
import java.util.List;

public class User {
    private Integer id;

    private String name;

    private String password;

    private String phone;

    private String plateNum;

    private Integer stauts;

    private Date createdate;

    private Integer point;

    //用户与订单一对多关系声明
    private List<Orders> orders;
    
    public List<Orders> getOrders() {
		return orders;
	}

	public void setOrders(List<Orders> orders) {
		this.orders = orders;
	}

	public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password == null ? null : password.trim();
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone == null ? null : phone.trim();
    }

    public String getPlateNum() {
        return plateNum;
    }

    public void setPlateNum(String plateNum) {
        this.plateNum = plateNum == null ? null : plateNum.trim();
    }

    public Integer getStauts() {
        return stauts;
    }

    public void setStauts(Integer stauts) {
        this.stauts = stauts;
    }

    public Date getCreatedate() {
        return createdate;
    }

    public void setCreatedate(Date createdate) {
        this.createdate = createdate;
    }

    public Integer getPoint() {
        return point;
    }

    public void setPoint(Integer point) {
        this.point = point;
    }

	@Override
	public String toString() {
		return "User [id=" + id + ", name=" + name + ", password=" + password + ", phone=" + phone + ", plateNum="
				+ plateNum + ", stauts=" + stauts + ", createdate=" + createdate + ", point=" + point + ", orders="
				+ orders + "]";
	}
}