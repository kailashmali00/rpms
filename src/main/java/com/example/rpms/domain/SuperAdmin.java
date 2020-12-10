package com.example.rpms.domain;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import org.codehaus.jackson.annotate.JsonIgnoreProperties;
import org.hibernate.annotations.GenericGenerator;

@Entity
@Table(name = "admin")
@JsonIgnoreProperties(ignoreUnknown = true)
public class SuperAdmin {

	private Integer id;
	private String superAdminName;
	private String phone;
	private String emailID;
	private String address;
	private Date createdAT;
	private Date updatedAt;
	private Date startActivePeriod;
	private Date endActivePeriod;
	private String reasonForLeaving;
	private Integer status;
	private Integer isDeleted;
	private String image;

	@Id
	@GeneratedValue(generator = "increment")
	@GenericGenerator(name = "increment", strategy = "increment")
	@Column(name = "id")
	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getSuperAdminName() {
		return superAdminName;
	}

	public void setSuperAdminName(String superAdminName) {
		this.superAdminName = superAdminName;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getEmailID() {
		return emailID;
	}

	public void setEmailID(String emailID) {
		this.emailID = emailID;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public Date getCreatedAT() {
		return createdAT;
	}

	public void setCreatedAT(Date createdAT) {
		this.createdAT = createdAT;
	}

	public Date getUpdatedAt() {
		return updatedAt;
	}

	public void setUpdatedAt(Date updatedAt) {
		this.updatedAt = updatedAt;
	}

	public Date getStartActivePeriod() {
		return startActivePeriod;
	}

	public void setStartActivePeriod(Date startActivePeriod) {
		this.startActivePeriod = startActivePeriod;
	}

	public Date getEndActivePeriod() {
		return endActivePeriod;
	}

	public void setEndActivePeriod(Date endActivePeriod) {
		this.endActivePeriod = endActivePeriod;
	}

	public String getReasonForLeaving() {
		return reasonForLeaving;
	}

	public void setReasonForLeaving(String reasonForLeaving) {
		this.reasonForLeaving = reasonForLeaving;
	}

	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	public Integer getIsDeleted() {
		return isDeleted;
	}

	public void setIsDeleted(Integer isDeleted) {
		this.isDeleted = isDeleted;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

}
