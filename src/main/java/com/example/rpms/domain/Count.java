package com.example.rpms.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import org.codehaus.jackson.annotate.JsonIgnoreProperties;
import org.hibernate.annotations.GenericGenerator;

@Entity
@Table(name = "count")
@JsonIgnoreProperties(ignoreUnknown = true)
public class Count {

	private Integer id;
	private Integer patientCount;
	private Integer doctorCount;
	private Integer nurseCount;
	private Integer unAssignedPatientCount;

	private Integer doc1;
	private Integer doc2;
	private Integer doc3;
	private Integer doc4;
	private Integer doc5;
	private Integer doc6;

	private Integer nursedata1;
	private Integer nursedata2;
	private Integer nursedata3;
	private Integer nursedata4;
	private Integer nursedata5;
	private Integer nursedata6;
	private Integer nursedata7;
	private Integer nursedata8;
	private Integer nursedata9;
	private Integer nursedata10;

	private Integer doctorMsg;
	private Integer nurseMsg;

	private Integer patientData;
	private Integer patientProb;

	private Integer hcgCount;
	private Integer blockedUserCount;
	private Integer blockedPatientCount;
	private Integer blockedNurseCount;
	private Integer blockedDoctorCount;
	

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

	public Integer getPatientCount() {
		return patientCount;
	}

	public void setPatientCount(Integer patientCount) {
		this.patientCount = patientCount;
	}

	public Integer getDoctorCount() {
		return doctorCount;
	}

	public void setDoctorCount(Integer doctorCount) {
		this.doctorCount = doctorCount;
	}

	public Integer getNurseCount() {
		return nurseCount;
	}

	public void setNurseCount(Integer nurseCount) {
		this.nurseCount = nurseCount;
	}

	public Integer getUnAssignedPatientCount() {
		return unAssignedPatientCount;
	}

	public void setUnAssignedPatientCount(Integer unAssignedPatientCount) {
		this.unAssignedPatientCount = unAssignedPatientCount;
	}

	public Integer getDoc1() {
		return doc1;
	}

	public void setDoc1(Integer doc1) {
		this.doc1 = doc1;
	}

	public Integer getDoc2() {
		return doc2;
	}

	public void setDoc2(Integer doc2) {
		this.doc2 = doc2;
	}

	public Integer getDoc3() {
		return doc3;
	}

	public void setDoc3(Integer doc3) {
		this.doc3 = doc3;
	}

	public Integer getDoc4() {
		return doc4;
	}

	public void setDoc4(Integer doc4) {
		this.doc4 = doc4;
	}

	public Integer getDoc5() {
		return doc5;
	}

	public void setDoc5(Integer doc5) {
		this.doc5 = doc5;
	}

	public Integer getDoc6() {
		return doc6;
	}

	public void setDoc6(Integer doc6) {
		this.doc6 = doc6;
	}

	public Integer getNursedata1() {
		return nursedata1;
	}

	public void setNursedata1(Integer nursedata1) {
		this.nursedata1 = nursedata1;
	}

	public Integer getNursedata2() {
		return nursedata2;
	}

	public void setNursedata2(Integer nursedata2) {
		this.nursedata2 = nursedata2;
	}

	public Integer getNursedata3() {
		return nursedata3;
	}

	public void setNursedata3(Integer nursedata3) {
		this.nursedata3 = nursedata3;
	}

	public Integer getNursedata4() {
		return nursedata4;
	}

	public void setNursedata4(Integer nursedata4) {
		this.nursedata4 = nursedata4;
	}

	public Integer getNursedata5() {
		return nursedata5;
	}

	public void setNursedata5(Integer nursedata5) {
		this.nursedata5 = nursedata5;
	}

	public Integer getNursedata6() {
		return nursedata6;
	}

	public void setNursedata6(Integer nursedata6) {
		this.nursedata6 = nursedata6;
	}

	public Integer getNursedata7() {
		return nursedata7;
	}

	public void setNursedata7(Integer nursedata7) {
		this.nursedata7 = nursedata7;
	}

	public Integer getNursedata8() {
		return nursedata8;
	}

	public void setNursedata8(Integer nursedata8) {
		this.nursedata8 = nursedata8;
	}

	public Integer getNursedata9() {
		return nursedata9;
	}

	public void setNursedata9(Integer nursedata9) {
		this.nursedata9 = nursedata9;
	}

	public Integer getNursedata10() {
		return nursedata10;
	}

	public void setNursedata10(Integer nursedata10) {
		this.nursedata10 = nursedata10;
	}

	public Integer getDoctorMsg() {
		return doctorMsg;
	}

	public void setDoctorMsg(Integer doctorMsg) {
		this.doctorMsg = doctorMsg;
	}

	public Integer getNurseMsg() {
		return nurseMsg;
	}

	public void setNurseMsg(Integer nurseMsg) {
		this.nurseMsg = nurseMsg;
	}

	public Integer getPatientData() {
		return patientData;
	}

	public void setPatientData(Integer patientData) {
		this.patientData = patientData;
	}

	public Integer getPatientProb() {
		return patientProb;
	}

	public void setPatientProb(Integer patientProb) {
		this.patientProb = patientProb;
	}

	public Integer getHcgCount() {
		return hcgCount;
	}

	public void setHcgCount(Integer hcgCount) {
		this.hcgCount = hcgCount;
	}

	public Integer getBlockedUserCount() {
		return blockedUserCount;
	}

	public void setBlockedUserCount(Integer blockedUserCount) {
		this.blockedUserCount = blockedUserCount;
	}

	public Integer getBlockedPatientCount() {
		return blockedPatientCount;
	}

	public void setBlockedPatientCount(Integer blockedPatientCount) {
		this.blockedPatientCount = blockedPatientCount;
	}

	public Integer getBlockedNurseCount() {
		return blockedNurseCount;
	}

	public void setBlockedNurseCount(Integer blockedNurseCount) {
		this.blockedNurseCount = blockedNurseCount;
	}

	public Integer getBlockedDoctorCount() {
		return blockedDoctorCount;
	}

	public void setBlockedDoctorCount(Integer blockedDoctorCount) {
		this.blockedDoctorCount = blockedDoctorCount;
	}
	
	

}
