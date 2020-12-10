package com.example.rpms.domain;

import java.util.List;

public class PatientData {

	private String bloodPressure;
	private String bloodSugar;

	private String bloodPressureMax;
	private String bloodSugarMax;

	private String dateformat;

	private String categories;

	private List<PatientPhysiologicalData> patientPhysiologicalData;

	public String getBloodPressure() {
		return bloodPressure;
	}

	public void setBloodPressure(String bloodPressure) {
		this.bloodPressure = bloodPressure;
	}

	public String getBloodSugar() {
		return bloodSugar;
	}

	public void setBloodSugar(String bloodSugar) {
		this.bloodSugar = bloodSugar;
	}

	public String getDateformat() {
		return dateformat;
	}

	public void setDateformat(String dateformat) {
		this.dateformat = dateformat;
	}

	public String getBloodPressureMax() {
		return bloodPressureMax;
	}

	public void setBloodPressureMax(String bloodPressureMax) {
		this.bloodPressureMax = bloodPressureMax;
	}

	public String getBloodSugarMax() {
		return bloodSugarMax;
	}

	public void setBloodSugarMax(String bloodSugarMax) {
		this.bloodSugarMax = bloodSugarMax;
	}

	public List<PatientPhysiologicalData> getPatientPhysiologicalData() {
		return patientPhysiologicalData;
	}

	public void setPatientPhysiologicalData(
			List<PatientPhysiologicalData> patientPhysiologicalData) {
		this.patientPhysiologicalData = patientPhysiologicalData;
	}

	public String getCategories() {
		return categories;
	}

	public void setCategories(String categories) {
		this.categories = categories;
	}

}
