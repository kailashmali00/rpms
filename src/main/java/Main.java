import java.util.ArrayList;
import java.util.List;

import com.example.rpms.domain.PatientData;
import com.example.rpms.domain.PatientPhysiologicalData;
import com.google.gson.Gson;


public class Main {
	
	public static void main(String[] args) {
		
		PatientPhysiologicalData patientPhysiologicalData=new PatientPhysiologicalData();
		patientPhysiologicalData.setDeviceID("123");
		
		PatientPhysiologicalData patientPhysiologicalData1=new PatientPhysiologicalData();
		patientPhysiologicalData1.setDeviceID("123");
		
		List<PatientPhysiologicalData> datas=new ArrayList<>();
		datas.add(patientPhysiologicalData);
		
		datas.add(patientPhysiologicalData1);
		
		
		
		PatientData patientData=new PatientData();
		
		patientData.setPatientPhysiologicalData(datas);
		
		
		System.out.println(new Gson().toJson(patientData));
		
	}

}
