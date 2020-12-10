package com.example.rpms.domain;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import org.codehaus.jackson.annotate.JsonIgnore;
import org.codehaus.jackson.annotate.JsonIgnoreProperties;

@SuppressWarnings("serial")
@Entity
@Table(name = "users")
@JsonIgnoreProperties(ignoreUnknown = true)
public class Users implements Serializable {

	private String username;
	private String password;
	private String uniqueID;
	private Integer adminID;
	private Integer hcgID;
	private Integer docID;
	private Integer nurseID;
	private Integer status;
	private Integer isDeleted;
	private Date createdAT;
	private Date updatedAT;
	private Integer patientID;
	private boolean enabled = true;
	private Authorities authorities;
	private boolean password_creation_status;

	@Id
	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getUniqueID() {
		return uniqueID;
	}

	public void setUniqueID(String uniqueID) {
		this.uniqueID = uniqueID;
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

	public Integer getIsDeleted() {
		return isDeleted;
	}

	public void setIsDeleted(Integer isDeleted) {
		this.isDeleted = isDeleted;
	}

	public Date getCreatedAT() {
		return createdAT;
	}

	public void setCreatedAT(Date createdAT) {
		this.createdAT = createdAT;
	}

	public Date getUpdatedAT() {
		return updatedAT;
	}

	public void setUpdatedAT(Date updatedAT) {
		this.updatedAT = updatedAT;
	}

	public Integer getPatientID() {
		return patientID;
	}

	public void setPatientID(Integer patientID) {
		this.patientID = patientID;
	}

	public void setAuthorities(Authorities authorities) {
		this.authorities = authorities;
	}

	@OneToOne(fetch = FetchType.EAGER, cascade = CascadeType.ALL)
	@JoinColumn(name = "username")
	@JsonIgnore
	public Authorities getAuthorities() {
		return authorities;
	}

	public boolean isEnabled() {
		return enabled;
	}

	public void setEnabled(boolean enabled) {
		this.enabled = enabled;
	}

	public boolean isPassword_creation_status() {
		return password_creation_status;
	}

	public void setPassword_creation_status(boolean password_creation_status) {
		this.password_creation_status = password_creation_status;
	}

	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	public Integer getAdminID() {
		return adminID;
	}

	public void setAdminID(Integer adminID) {
		this.adminID = adminID;
	}

}