package com.example.rpms.domain;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import org.codehaus.jackson.annotate.JsonIgnoreProperties;
import org.hibernate.annotations.ColumnTransformer;
import org.hibernate.annotations.GenericGenerator;

@Entity
@Table(name = "patient")
@JsonIgnoreProperties(ignoreUnknown = true)
public class Patient {

	private Integer id;
	
	
	private String firstname;
	private String middlename;
	private String lastname;
	private String nickname;

	private String sex;
	private String date_of_birth;
	private String weight;
	private String height;
	private String cellphone;
	private String homephone;

	private String homeaddress;
	private String mailingAddress;
	private String email;

	private String ssn_number;
	private String mr_number;
	private String city;
	private String state;
	private String country;
	private String zipcode;

	private Date createdAt;
	private Date updatedAt;
	private Date startActivePeriod;
	private Date endActivePeriod;
	private String reasonForLeaving;
	private Integer status;
	private Integer isDeleted;
	private Integer hcgID;
	private Integer docID;
	private Integer nurseID;

	private String categories;
	private String image;

	private String bloodPresure;
	private String bloodsugur;

	private String bloodPresureMax;
	private String bloodsugurMax;

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
	
	@ColumnTransformer(
			read="AES_DECRYPT(firstname,'E$t!!#RRT')", 
			write="AES_ENCRYPT(?,'E$t!!#RRT')")
	@Column(name="firstname")
	public String getFirstname() {
		return firstname;
	}
	
   
	public void setFirstname(String firstname) {
		this.firstname = firstname;
	}
			@ColumnTransformer(
			read="AES_DECRYPT(middlename,'E$t!!#RRT')", 
			write="AES_ENCRYPT(?,'E$t!!#RRT')")
	public String getMiddlename() {
		return middlename;
	}

	public void setMiddlename(String middlename) {
		this.middlename = middlename;
	}
	@ColumnTransformer(
			read="AES_DECRYPT(lastname,'E$t!!#RRT')", 
			write="AES_ENCRYPT(?,'E$t!!#RRT')")
	@Column(name="lastname")
	public String getLastname() {
		return lastname;
	}
	
	public void setLastname(String lastname) {
		this.lastname = lastname;
	}
	@ColumnTransformer(
			read="AES_DECRYPT(nickname,'E$t!!#RRT')", 
			write="AES_ENCRYPT(?,'E$t!!#RRT')")
	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	@ColumnTransformer(
			read="AES_DECRYPT(sex,'E$t!!#RRT')", 
			write="AES_ENCRYPT(?,'E$t!!#RRT')")
	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}
	@ColumnTransformer(
			read="AES_DECRYPT(date_of_birth,'E$t!!#RRT')", 
			write="AES_ENCRYPT(?,'E$t!!#RRT')")
	public String getDate_of_birth() {
		return date_of_birth;
	}

	public void setDate_of_birth(String date_of_birth) {
		this.date_of_birth = date_of_birth;
	}
	@ColumnTransformer(
			read="AES_DECRYPT(weight,'E$t!!#RRT')", 
			write="AES_ENCRYPT(?,'E$t!!#RRT')")
	public String getWeight() {
		return weight;
	}

	public void setWeight(String weight) {
		this.weight = weight;
	}
	@ColumnTransformer(
			read="AES_DECRYPT(height,'E$t!!#RRT')", 
			write="AES_ENCRYPT(?,'E$t!!#RRT')")
	public String getHeight() {
		return height;
	}

	public void setHeight(String height) {
		this.height = height;
	}
	@ColumnTransformer(
			read="AES_DECRYPT(cellphone,'E$t!!#RRT')", 
			write="AES_ENCRYPT(?,'E$t!!#RRT')")
	public String getCellphone() {
		return cellphone;
	}

	public void setCellphone(String cellphone) {
		this.cellphone = cellphone;
	}
	@ColumnTransformer(
			read="AES_DECRYPT(homephone,'E$t!!#RRT')", 
			write="AES_ENCRYPT(?,'E$t!!#RRT')")
	public String getHomephone() {
		return homephone;
	}

	public void setHomephone(String homephone) {
		this.homephone = homephone;
	}
	@ColumnTransformer(
			read="AES_DECRYPT(homeaddress,'E$t!!#RRT')", 
			write="AES_ENCRYPT(?,'E$t!!#RRT')")
	public String getHomeaddress() {
		return homeaddress;
	}
	
	public void setHomeaddress(String homeaddress) {
		this.homeaddress = homeaddress;
	}
	@ColumnTransformer(
			read="AES_DECRYPT(mailingAddress,'E$t!!#RRT')", 
			write="AES_ENCRYPT(?,'E$t!!#RRT')")
	public String getMailingAddress() {
		return mailingAddress;
	}

	public void setMailingAddress(String mailingAddress) {
		this.mailingAddress = mailingAddress;
	}
	@ColumnTransformer(
			read="AES_DECRYPT(email,'E$t!!#RRT')", 
			write="AES_ENCRYPT(?,'E$t!!#RRT')")
	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}
	@ColumnTransformer(
			read="AES_DECRYPT(ssn_number,'E$t!!#RRT')", 
			write="AES_ENCRYPT(?,'E$t!!#RRT')")
	public String getSsn_number() {
		return ssn_number;
	}

	public void setSsn_number(String ssn_number) {
		this.ssn_number = ssn_number;
	}
	/*@ColumnTransformer(
			read="AES_DECRYPT(mr_number,'E$t!!#RRT')", 
			write="AES_ENCRYPT(?,'E$t!!#RRT')")*/
	public String getMr_number() {
		return mr_number;
	}

	public void setMr_number(String mr_number) {
		this.mr_number = mr_number;
	}
	@ColumnTransformer(
			read="AES_DECRYPT(city,'E$t!!#RRT')", 
			write="AES_ENCRYPT(?,'E$t!!#RRT')")
	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}
	@ColumnTransformer(
			read="AES_DECRYPT(state,'E$t!!#RRT')", 
			write="AES_ENCRYPT(?,'E$t!!#RRT')")
	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}
	@ColumnTransformer(
			read="AES_DECRYPT(country,'E$t!!#RRT')", 
			write="AES_ENCRYPT(?,'E$t!!#RRT')")
	public String getCountry() {
		return country;
	}

	public void setCountry(String country) {
		this.country = country;
	}
	@ColumnTransformer(
			read="AES_DECRYPT(zipcode,'E$t!!#RRT')", 
			write="AES_ENCRYPT(?,'E$t!!#RRT')")
	public String getZipcode() {
		return zipcode;
	}

	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
	}

	public Date getCreatedAt() {
		return createdAt;
	}

	public void setCreatedAt(Date createdAt) {
		this.createdAt = createdAt;
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
	@ColumnTransformer(
			read="AES_DECRYPT(reasonForLeaving,'E$t!!#RRT')", 
			write="AES_ENCRYPT(?,'E$t!!#RRT')")
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

	public Integer getHcgID() {
		return hcgID;
	}

	public void setHcgID(Integer hcgID) {
		this.hcgID = hcgID;
	}

	public Integer getDocID() {
		return docID;
	}

	public void setDocID(Integer docID) {
		this.docID = docID;
	}

	public Integer getNurseID() {
		return nurseID;
	}

	public void setNurseID(Integer nurseID) {
		this.nurseID = nurseID;
	}
	@ColumnTransformer(
			read="AES_DECRYPT(categories,'E$t!!#RRT')", 
			write="AES_ENCRYPT(?,'E$t!!#RRT')")
	public String getCategories() {
		return categories;
	}

	public void setCategories(String categories) {
		this.categories = categories;
	}
	
	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	/*@ColumnTransformer(
			read="AES_DECRYPT(bloodPresure,'E$t!!#RRT')", 
			write="AES_ENCRYPT(?,'E$t!!#RRT')")*/
	public String getBloodPresure() {
		return bloodPresure;
	}

	public void setBloodPresure(String bloodPresure) {
		this.bloodPresure = bloodPresure;
	}
	/*@ColumnTransformer(
			read="AES_DECRYPT(bloodsugur,'E$t!!#RRT')", 
			write="AES_ENCRYPT(?,'E$t!!#RRT')")*/
	public String getBloodsugur() {
		return bloodsugur;
	}

	public void setBloodsugur(String bloodsugur) {
		this.bloodsugur = bloodsugur;
	}
/*	@ColumnTransformer(
			read="AES_DECRYPT(bloodPresureMax,'E$t!!#RRT')", 
			write="AES_ENCRYPT(?,'E$t!!#RRT')")*/
	public String getBloodPresureMax() {
		return bloodPresureMax;
	}

	public void setBloodPresureMax(String bloodPresureMax) {
		this.bloodPresureMax = bloodPresureMax;
	}
	/*@ColumnTransformer(
			read="AES_DECRYPT(bloodsugurMax,'E$t!!#RRT')", 
			write="AES_ENCRYPT(?,'E$t!!#RRT')")*/
	public String getBloodsugurMax() {
		return bloodsugurMax;
	}

	public void setBloodsugurMax(String bloodsugurMax) {
		this.bloodsugurMax = bloodsugurMax;
	}

}
