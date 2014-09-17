package cn.njust.cxzx.model;

import java.sql.Timestamp;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

/**
 * Multipurpose entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "multipurpose", catalog = "cxzx")
public class Multipurpose implements java.io.Serializable {
	public static final	int NEWS = 1;//新闻动态
	public static final int NOTICE = 2;//公示通知
	public static final int RECRUITMENT = 3;//人才招聘
	public static final int EXCHANGES = 4;//交流合作
	public static final int ACHIEVEMENT = 5;//项目成果
	public static final int TEACHERTRAINING = 6;//青年教师培养
	public static final int STUDENTSTRAINING = 7;//学生培养
	public static final int CENTREOVERVIEW = 11;//中心概况
	public static final int COUNCIL = 12;//理事会
	public static final int ACADEMICCOMMITTEE = 13;//学术委员会
	public static final int CENTRALADMINISTRATIVE = 14;//中心行政管理机构
	public static final int RESEARCH = 15;//研究部
	public static final int ANALYSISANDTESTINGCENTER = 16;//微纳米材料分析测试中心
	public static final int MICRONANOMETALSTRUCTURALMATERIALSRESEARCHDEPARTMENT = 21;//微纳米金属结构材料研究部
	public static final int FUNCTIONALNANOMATERIALSRESEARCH = 22;//纳米功能材料研究部
	public static final int MICROANDNANOMATERIALSPROCESSINGEQUIPMENTRESEARCHDEPARTMENT = 23;//微纳米材料加工装备研究部
	// Fields
	private Integer id;
	private Systemuser systemuser;
	private String title;
	private String content;
	private Integer type;
	private Timestamp createTime;

	// Constructors

	/** default constructor */
	public Multipurpose() {
	}

	/** minimal constructor */
	public Multipurpose(Timestamp createTime) {
		this.createTime = createTime;
	}

	/** full constructor */
	public Multipurpose(Systemuser systemuser, String title, String content,
			Integer type, Timestamp createTime) {
		this.systemuser = systemuser;
		this.title = title;
		this.content = content;
		this.type = type;
		this.createTime = createTime;
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

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "CreateUserId")
	public Systemuser getSystemuser() {
		return this.systemuser;
	}

	public void setSystemuser(Systemuser systemuser) {
		this.systemuser = systemuser;
	}

	@Column(name = "Title", length = 100)
	public String getTitle() {
		return this.title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	@Column(name = "Content")
	public String getContent() {
		return this.content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	@Column(name = "Type")
	public Integer getType() {
		return this.type;
	}

	public void setType(Integer type) {
		this.type = type;
	}

	@Column(name = "CreateTime", nullable = false, length = 19)
	public Timestamp getCreateTime() {
		return this.createTime;
	}

	public void setCreateTime(Timestamp createTime) {
		this.createTime = createTime;
	}

}