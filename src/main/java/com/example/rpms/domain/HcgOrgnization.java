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
@Table(name = "hcgorgnization")
@JsonIgnoreProperties(ignoreUnknown = true)
public class HcgOrgnization {

	private Integer id;
	private String hcgtimezone;
	private String hcgName;
	private String phone;
	private String emailID;
	private String address;
	private Date createdAT;
	private Date updatedAt;
	private String startActivePeriod;
	private String endActivePeriod;
	private String reasonForLeaving;
	private Integer status;
	private Integer isDeleted;
	private String image;

	private String timezone;
	private String bloodPresure;
	private String gulcose;
	private String dateformat;

	private String bloodPresureMax;
	private String gulcoseMax;

	private String categories;

	private Integer adminID;

	private String firstname;
	private String middlename;
	private String lastname;
	private String nickname;
	private String sex;
	private String cellphone;
	private String homephone;
	private String homeaddress;
	private String mailingAddress;

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

	public String getHcgtimezone() {
		return hcgtimezone;
	}

	public void setHcgtimezone(String hcgtimezone) {
		this.hcgtimezone = hcgtimezone;
	}

	public String getHcgName() {
		return hcgName;
	}

	public void setHcgName(String hcgName) {
		this.hcgName = hcgName;
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

	public String getStartActivePeriod() {
		return startActivePeriod;
	}

	public void setStartActivePeriod(String startActivePeriod) {
		this.startActivePeriod = startActivePeriod;
	}

	public String getEndActivePeriod() {
		return endActivePeriod;
	}

	public void setEndActivePeriod(String endActivePeriod) {
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

	public String getTimezone() {
		return timezone;
	}

	public void setTimezone(String timezone) {
		this.timezone = timezone;
	}

	public String getBloodPresure() {
		return bloodPresure;
	}

	public void setBloodPresure(String bloodPresure) {
		this.bloodPresure = bloodPresure;
	}

	public String getGulcose() {
		return gulcose;
	}

	public void setGulcose(String gulcose) {
		this.gulcose = gulcose;
	}

	public String getDateformat() {
		return dateformat;
	}

	public void setDateformat(String dateformat) {
		this.dateformat = dateformat;
	}

	public String getBloodPresureMax() {
		return bloodPresureMax;
	}

	public void setBloodPresureMax(String bloodPresureMax) {
		this.bloodPresureMax = bloodPresureMax;
	}

	public String getGulcoseMax() {
		return gulcoseMax;
	}

	public void setGulcoseMax(String gulcoseMax) {
		this.gulcoseMax = gulcoseMax;
	}

	public String getCategories() {
		return categories;
	}

	public void setCategories(String categories) {
		this.categories = categories;
	}

	public Integer getAdminID() {
		return adminID;
	}

	public void setAdminID(Integer adminID) {
		this.adminID = adminID;
	}

	public String getFirstname() {
		return firstname;
	}

	public void setFirstname(String firstname) {
		this.firstname = firstname;
	}

	public String getMiddlename() {
		return middlename;
	}

	public void setMiddlename(String middlename) {
		this.middlename = middlename;
	}

	public String getLastname() {
		return lastname;
	}

	public void setLastname(String lastname) {
		this.lastname = lastname;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public String getCellphone() {
		return cellphone;
	}

	public void setCellphone(String cellphone) {
		this.cellphone = cellphone;
	}

	public String getHomephone() {
		return homephone;
	}

	public void setHomephone(String homephone) {
		this.homephone = homephone;
	}

	public String getHomeaddress() {
		return homeaddress;
	}

	public void setHomeaddress(String homeaddress) {
		this.homeaddress = homeaddress;
	}

	public String getMailingAddress() {
		return mailingAddress;
	}

	public void setMailingAddress(String mailingAddress) {
		this.mailingAddress = mailingAddress;
	}

}
