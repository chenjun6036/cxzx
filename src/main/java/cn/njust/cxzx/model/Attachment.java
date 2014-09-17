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
 * Attachment entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "attachment", catalog = "cxzx")
public class Attachment implements java.io.Serializable {

	// Fields

	private Integer id;
	private Multipurpose multipurpose;
	private String fileName;
	private String url;
	private Timestamp uploadTime;

	// Constructors

	/** default constructor */
	public Attachment() {
	}

	/** full constructor */
	public Attachment(Multipurpose multipurpose, String fileName, String url,
			Timestamp uploadTime) {
		this.multipurpose = multipurpose;
		this.fileName = fileName;
		this.url = url;
		this.uploadTime = uploadTime;
	}

	// Property accessors
	@Id
	@GeneratedValue
	@Column(name = "id", unique = true, nullable = false)
	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "multiPurposeId")
	public Multipurpose getMultipurpose() {
		return this.multipurpose;
	}

	public void setMultipurpose(Multipurpose multipurpose) {
		this.multipurpose = multipurpose;
	}

	@Column(name = "fileName", length = 100)
	public String getFileName() {
		return this.fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	@Column(name = "url", length = 100)
	public String getUrl() {
		return this.url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	@Column(name = "uploadTime", length = 19)
	public Timestamp getUploadTime() {
		return this.uploadTime;
	}

	public void setUploadTime(Timestamp uploadTime) {
		this.uploadTime = uploadTime;
	}

}