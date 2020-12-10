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
@Table(name = "comments")
@JsonIgnoreProperties(ignoreUnknown = true)
public class Comments {

	private Integer id;
	private String message;
	private String entrytime;
	private Integer docID;
	private Integer nurseID;
	private Integer patientID;
	private Integer isReadNurse;
	private Integer isReadDoc;
	private String seentime;
	private Date createdAT;
	private Date updatedAT;
	private Integer data_point_id;
	private Integer hcgID;
	private Integer isDeleted;
	private Integer isSentDoc;
	private Integer isSentNures;
	private String docName;
	private String patientName;
	private String nurseName;

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

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public String getEntrytime() {
		return entrytime;
	}

	public void setEntrytime(String entrytime) {
		this.entrytime = entrytime;
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

	public Integer getPatientID() {
		return patientID;
	}

	public void setPatientID(Integer patientID) {
		this.patientID = patientID;
	}

	public Integer getIsReadNurse() {
		return isReadNurse;
	}

	public void setIsReadNurse(Integer isReadNurse) {
		this.isReadNurse = isReadNurse;
	}

	public Integer getIsReadDoc() {
		return isReadDoc;
	}

	public void setIsReadDoc(Integer isReadDoc) {
		this.isReadDoc = isReadDoc;
	}

	public String getSeentime() {
		return seentime;
	}

	public void setSeentime(String seentime) {
		this.seentime = seentime;
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

	public Integer getData_point_id() {
		return data_point_id;
	}

	public void setData_point_id(Integer data_point_id) {
		this.data_point_id = data_point_id;
	}

	public Integer getHcgID() {
		return hcgID;
	}

	public void setHcgID(Integer hcgID) {
		this.hcgID = hcgID;
	}

	public Integer getIsDeleted() {
		return isDeleted;
	}

	public void setIsDeleted(Integer isDeleted) {
		this.isDeleted = isDeleted;
	}

	public Integer getIsSentDoc() {
		return isSentDoc;
	}

	public void setIsSentDoc(Integer isSentDoc) {
		this.isSentDoc = isSentDoc;
	}

	public Integer getIsSentNures() {
		return isSentNures;
	}

	public void setIsSentNures(Integer isSentNures) {
		this.isSentNures = isSentNures;
	}

	public String getDocName() {
		return docName;
	}

	public void setDocName(String docName) {
		this.docName = docName;
	}

	public String getPatientName() {
		return patientName;
	}

	public void setPatientName(String patientName) {
		this.patientName = patientName;
	}

	public String getNurseName() {
		return nurseName;
	}

	public void setNurseName(String nurseName) {
		this.nurseName = nurseName;
	}

}
