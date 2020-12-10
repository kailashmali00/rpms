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
@Table(name = "measure")
@JsonIgnoreProperties(ignoreUnknown = true)
public class Measure {

	private Integer id;

	private Integer hcgID;
	private Integer docID;
	private Integer patientID;
	private String bloodPresure;
	private String bloodsugur;

	private Date createdAT;
	private Date updatedAT;

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

	public Integer getPatientID() {
		return patientID;
	}

	public void setPatientID(Integer patientID) {
		this.patientID = patientID;
	}

	public String getBloodPresure() {
		return bloodPresure;
	}

	public void setBloodPresure(String bloodPresure) {
		this.bloodPresure = bloodPresure;
	}

	public String getBloodsugur() {
		return bloodsugur;
	}

	public void setBloodsugur(String bloodsugur) {
		this.bloodsugur = bloodsugur;
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

	public String getBloodPresureMax() {
		return bloodPresureMax;
	}

	public void setBloodPresureMax(String bloodPresureMax) {
		this.bloodPresureMax = bloodPresureMax;
	}

	public String getBloodsugurMax() {
		return bloodsugurMax;
	}

	public void setBloodsugurMax(String bloodsugurMax) {
		this.bloodsugurMax = bloodsugurMax;
	}

}
