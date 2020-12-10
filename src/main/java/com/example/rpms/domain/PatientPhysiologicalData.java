package com.example.rpms.domain;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.codehaus.jackson.annotate.JsonIgnoreProperties;
import org.hibernate.annotations.GenericGenerator;

@Entity
@Table(name = "patientphysiologicaldata")
@JsonIgnoreProperties(ignoreUnknown = true)
public class PatientPhysiologicalData {

	public Integer id;

	private String patientMRid;
	public Integer readingFor;
	public Integer sugervalue;
	public Integer pressuresystolic;
	public Integer pressurediastolic;
	private String rdata;
	private String measurementtype;
	private String units;
	private String devicetype;
	private String devicebrandmodel;
	private String devicenetworkaddress;
	private String deviceID;
	private String deviceTime;
	private String receivedDateTime;
	private String fstate = "Normal";
	private String reviewerType;
	public Integer docId;
	public Integer nurseId;

	public Integer isDeleted;

	private String glucoseMax;
	private String glucoseMin;
	private String bloodPressureMax;
	private String bloodPressureMin;

	private String patient_name;

	public PatientPhysiologicalData() {
	}

	public PatientPhysiologicalData(String patientMRid, Integer readingFor,
			Integer sugervalue, Integer pressuresystolic,
			Integer pressurediastolic, String rdata, String measurementtype,
			String units, String devicetype, String devicebrandmodel,
			String devicenetworkaddress, String deviceID, String deviceTime,
			String receivedDateTime, String fstate, String reviewerType,
			Integer docId, Integer nurseId, String glucoseMax,
			String glucoseMin, String bloodPressureMax, String bloodPressureMin) {
		super();

		this.patientMRid = patientMRid;
		this.readingFor = readingFor;
		this.sugervalue = sugervalue;
		this.pressuresystolic = pressuresystolic;
		this.pressurediastolic = pressurediastolic;
		this.rdata = rdata;
		this.measurementtype = measurementtype;
		this.units = units;
		this.devicetype = devicetype;
		this.devicebrandmodel = devicebrandmodel;
		this.devicenetworkaddress = devicenetworkaddress;
		this.deviceID = deviceID;
		this.deviceTime = deviceTime;
		this.receivedDateTime = receivedDateTime;
		this.fstate = fstate;
		this.reviewerType = reviewerType;
		this.docId = docId;
		this.nurseId = nurseId;
		this.glucoseMax = glucoseMax;
		this.glucoseMin = glucoseMin;
		this.bloodPressureMax = bloodPressureMax;
		this.bloodPressureMin = bloodPressureMin;
	}

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

	public String getPatientMRid() {
		return patientMRid;
	}

	public void setPatientMRid(String patientMRid) {
		this.patientMRid = patientMRid;
	}

	public Integer getReadingFor() {
		return readingFor;
	}

	public void setReadingFor(Integer readingFor) {
		this.readingFor = readingFor;
	}

	public Integer getSugervalue() {
		return sugervalue;
	}

	public void setSugervalue(Integer sugervalue) {
		this.sugervalue = sugervalue;
	}

	public Integer getPressuresystolic() {
		return pressuresystolic;
	}

	public void setPressuresystolic(Integer pressuresystolic) {
		this.pressuresystolic = pressuresystolic;
	}

	public Integer getPressurediastolic() {
		return pressurediastolic;
	}

	public void setPressurediastolic(Integer pressurediastolic) {
		this.pressurediastolic = pressurediastolic;
	}

	public String getRdata() {
		return rdata;
	}

	public void setRdata(String rdata) {
		this.rdata = rdata;
	}

	public String getMeasurementtype() {
		return measurementtype;
	}

	public void setMeasurementtype(String measurementtype) {
		this.measurementtype = measurementtype;
	}

	public String getUnits() {
		return units;
	}

	public void setUnits(String units) {
		this.units = units;
	}

	public String getDevicetype() {
		return devicetype;
	}

	public void setDevicetype(String devicetype) {
		this.devicetype = devicetype;
	}

	public String getDevicebrandmodel() {
		return devicebrandmodel;
	}

	public void setDevicebrandmodel(String devicebrandmodel) {
		this.devicebrandmodel = devicebrandmodel;
	}

	public String getDevicenetworkaddress() {
		return devicenetworkaddress;
	}

	public void setDevicenetworkaddress(String devicenetworkaddress) {
		this.devicenetworkaddress = devicenetworkaddress;
	}

	public String getDeviceID() {
		return deviceID;
	}

	public void setDeviceID(String deviceID) {
		this.deviceID = deviceID;
	}

	public String getDeviceTime() {
		return deviceTime;
	}

	public void setDeviceTime(String deviceTime) {
		this.deviceTime = deviceTime;
	}

	public String getReceivedDateTime() {
		return receivedDateTime;
	}

	public void setReceivedDateTime(String receivedDateTime) {
		this.receivedDateTime = receivedDateTime;
	}

	public String getFstate() {
		return fstate;
	}

	public void setFstate(String fstate) {
		this.fstate = fstate;
	}

	public String getReviewerType() {
		return reviewerType;
	}

	public void setReviewerType(String reviewerType) {
		this.reviewerType = reviewerType;
	}

	public Integer getDocId() {
		return docId;
	}

	public void setDocId(Integer docId) {
		this.docId = docId;
	}

	public Integer getNurseId() {
		return nurseId;
	}

	public void setNurseId(Integer nurseId) {
		this.nurseId = nurseId;
	}

	public Integer getIsDeleted() {
		return isDeleted;
	}

	public void setIsDeleted(Integer isDeleted) {
		this.isDeleted = isDeleted;
	}

	public String getGlucoseMax() {
		return glucoseMax;
	}

	public void setGlucoseMax(String glucoseMax) {
		this.glucoseMax = glucoseMax;
	}

	public String getGlucoseMin() {
		return glucoseMin;
	}

	public void setGlucoseMin(String glucoseMin) {
		this.glucoseMin = glucoseMin;
	}

	public String getBloodPressureMax() {
		return bloodPressureMax;
	}

	public void setBloodPressureMax(String bloodPressureMax) {
		this.bloodPressureMax = bloodPressureMax;
	}

	public String getBloodPressureMin() {
		return bloodPressureMin;
	}

	public void setBloodPressureMin(String bloodPressureMin) {
		this.bloodPressureMin = bloodPressureMin;
	}

	private int provideInt(String s) {
		try {
			return Integer.parseInt(s);
		} catch (Exception e) {
			return 0;
		}
	}
	
	
	public String getPatient_name() {
		return patient_name;
	}

	public void setPatient_name(String patient_name) {
		this.patient_name = patient_name;
	}

}
