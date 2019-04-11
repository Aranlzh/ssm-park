package ssm.entity;

public class Orders {
    private Integer id;

    private String code;

    private Integer userId;

    private Integer parkId;

    private String createdate;

    private Integer status;

    private Double total;
        
    //声明与用户多对一关系
    private User user;
    //声明与车位一对一关系
    private Park park;

    public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Park getPark() {
		return park;
	}

	public void setPark(Park park) {
		this.park = park;
	}

	public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code == null ? null : code.trim();
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public Integer getParkId() {
        return parkId;
    }

    public void setParkId(Integer parkId) {
        this.parkId = parkId;
    }

    public String getCreatedate() {
        return createdate;
    }

    public void setCreatedate(String createdate) {
        this.createdate = createdate;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public Double getTotal() {
        return total;
    }

    public void setTotal(Double total) {
        this.total = total;
    }

	@Override
	public String toString() {
		return "Orders [id=" + id + ", code=" + code + ", userId=" + userId + ", parkId=" + parkId + ", createdate="
				+ createdate + ", status=" + status + ", total=" + total + ", user=" + user + ", park=" + park + "]";
	}
    
}