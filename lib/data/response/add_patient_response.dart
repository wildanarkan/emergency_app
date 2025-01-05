class AddPatientResponse {
	bool? success;
	Data? data;

	AddPatientResponse({this.success, this.data});

	AddPatientResponse.fromJson(Map<String, dynamic> json) {
		success = json['success'];
		data = json['data'] != null ? Data.fromJson(json['data']) : null;
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = <String, dynamic>{};
		data['success'] = success;
		if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
		return data;
	}
}

class Data {
	String? name;
	int? age;
	int? gender;
	String? desc;
	String? arrival;
	int? status;
	String? mechanism;
	String? injury;
	String? treatment;
	int? caseType;
	String? timeIncident;
	String? hospitalId;
	String? photoInjury;
	int? userId;
	String? updatedAt;
	String? createdAt;
	int? id;

	Data({this.name, this.age, this.gender, this.desc, this.arrival, this.status, this.mechanism, this.injury, this.treatment, this.caseType, this.timeIncident, this.hospitalId, this.photoInjury, this.userId, this.updatedAt, this.createdAt, this.id});

	Data.fromJson(Map<String, dynamic> json) {
		name = json['name'];
		age = json['age'];
		gender = json['gender'];
		desc = json['desc'];
		arrival = json['arrival'];
		status = json['status'];
		mechanism = json['mechanism'];
		injury = json['injury'];
		treatment = json['treatment'];
		caseType = json['case'];
		timeIncident = json['time_incident'];
		hospitalId = json['hospital_id'];
		photoInjury = json['photo_injury'];
		userId = json['user_id'];
		updatedAt = json['updated_at'];
		createdAt = json['created_at'];
		id = json['id'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = <String, dynamic>{};
		data['name'] = name;
		data['age'] = age;
		data['gender'] = gender;
		data['desc'] = desc;
		data['arrival'] = arrival;
		data['status'] = status;
		data['mechanism'] = mechanism;
		data['injury'] = injury;
		data['treatment'] = treatment;
		data['case'] = caseType;
		data['time_incident'] = timeIncident;
		data['hospital_id'] = hospitalId;
		data['photo_injury'] = photoInjury;
		data['user_id'] = userId;
		data['updated_at'] = updatedAt;
		data['created_at'] = createdAt;
		data['id'] = id;
		return data;
	}
}
