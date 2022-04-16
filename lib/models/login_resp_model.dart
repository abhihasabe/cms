class LoginResp {
  int? success;
  String? message;
  String? token;
  Data? data;

  LoginResp({this.success, this.message, this.token, this.data});

  LoginResp.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    token = json['token'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['message'] = this.message;
    data['token'] = this.token;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  int? eid;
  String? employeeName;
  String? employeeDob;
  String? employeeGender;
  String? employeeMobileno;
  String? employeeAlternateMobileno;
  String? employeeEmail;
  int? employeeType;
  int? employeeDept;
  String? employeeDateofjoining;
  int? employeeWorkingLocation;
  String? employeeEndDate;
  String? employeeBloodGroup;
  String? employeeAddress;
  String? employeeAadharno;
  String? employeePanno;
  String? employeePfno;
  String? employeeEsicno;
  String? employeeWcpolicy;
  String? employeeBankAcno;
  int? employeeCompanyId;
  String? password;

  Data(
      {this.eid,
      this.employeeName,
      this.employeeDob,
      this.employeeGender,
      this.employeeMobileno,
      this.employeeAlternateMobileno,
      this.employeeEmail,
      this.employeeType,
      this.employeeDept,
      this.employeeDateofjoining,
      this.employeeWorkingLocation,
      this.employeeEndDate,
      this.employeeBloodGroup,
      this.employeeAddress,
      this.employeeAadharno,
      this.employeePanno,
      this.employeePfno,
      this.employeeEsicno,
      this.employeeWcpolicy,
      this.employeeBankAcno,
      this.employeeCompanyId,
      this.password});

  Data.fromJson(Map<String, dynamic> json) {
    eid = json['eid'];
    employeeName = json['employee_name'];
    employeeDob = json['employee_dob'];
    employeeGender = json['employee_gender'];
    employeeMobileno = json['employee_mobileno'];
    employeeAlternateMobileno = json['employee_alternate_mobileno'];
    employeeEmail = json['employee_email'];
    employeeType = json['employee_type'];
    employeeDept = json['employee_dept'];
    employeeDateofjoining = json['employee_dateofjoining'];
    employeeWorkingLocation = json['employee_working_location'];
    employeeEndDate = json['employee_end_date'];
    employeeBloodGroup = json['employee_blood_group'];
    employeeAddress = json['employee_address'];
    employeeAadharno = json['employee_aadharno'];
    employeePanno = json['employee_panno'];
    employeePfno = json['employee_pfno'];
    employeeEsicno = json['employee_esicno'];
    employeeWcpolicy = json['employee_wcpolicy'];
    employeeBankAcno = json['employee_bank_acno'];
    employeeCompanyId = json['employee_company_id'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['eid'] = this.eid;
    data['employee_name'] = this.employeeName;
    data['employee_dob'] = this.employeeDob;
    data['employee_gender'] = this.employeeGender;
    data['employee_mobileno'] = this.employeeMobileno;
    data['employee_alternate_mobileno'] = this.employeeAlternateMobileno;
    data['employee_email'] = this.employeeEmail;
    data['employee_type'] = this.employeeType;
    data['employee_dept'] = this.employeeDept;
    data['employee_dateofjoining'] = this.employeeDateofjoining;
    data['employee_working_location'] = this.employeeWorkingLocation;
    data['employee_end_date'] = this.employeeEndDate;
    data['employee_blood_group'] = this.employeeBloodGroup;
    data['employee_address'] = this.employeeAddress;
    data['employee_aadharno'] = this.employeeAadharno;
    data['employee_panno'] = this.employeePanno;
    data['employee_pfno'] = this.employeePfno;
    data['employee_esicno'] = this.employeeEsicno;
    data['employee_wcpolicy'] = this.employeeWcpolicy;
    data['employee_bank_acno'] = this.employeeBankAcno;
    data['employee_company_id'] = this.employeeCompanyId;
    data['password'] = this.password;
    return data;
  }
}