package cn.njust.cxzx.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * Systemuser entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "systemuser", catalog = "cxzx")
public class Systemuser implements java.io.Serializable {

	// Fields

	private Integer id;
	private String userName;
	private String password;
	private String realName;

	// Constructors

	/** default constructor */
	public Systemuser() {
	}

	/** full constructor */
	public Systemuser(String userName, String password, String realName) {
		this.userName = userName;
		this.password = password;
		this.realName = realName;
	}

	// Property accessors
	@Id
	@GeneratedValue
	@Column(name = "Id", unique = true, nullable = false)
	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	@Column(name = "UserName", length = 50)
	public String getUserName() {
		return this.userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	@Column(name = "Password", length = 50)
	public String getPassword() {
		return this.password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	@Column(name = "RealName", length = 50)
	public String getRealName() {
		return this.realName;
	}

	public void setRealName(String realName) {
		this.realName = realName;
	}

}