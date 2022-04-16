class AddEmployeeResp {
  int? success;
  String? message;
  AddEmployeeData? data;

  AddEmployeeResp({this.success, this.message, this.data});

  AddEmployeeResp.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    data = json['data'] != null ? AddEmployeeData.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class AddEmployeeData {
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

  AddEmployeeData(
      {this.employeeName,
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

  AddEmployeeData.fromJson(Map<String, dynamic> json) {
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['employee_name'] = employeeName;
    data['employee_dob'] = employeeDob;
    data['employee_gender'] = employeeGender;
    data['employee_mobileno'] = employeeMobileno;
    data['employee_alternate_mobileno'] = employeeAlternateMobileno;
    data['employee_email'] = employeeEmail;
    data['employee_type'] = employeeType;
    data['employee_dept'] = employeeDept;
    data['employee_dateofjoining'] = employeeDateofjoining;
    data['employee_working_location'] = employeeWorkingLocation;
    data['employee_end_date'] = employeeEndDate;
    data['employee_blood_group'] = employeeBloodGroup;
    data['employee_address'] = employeeAddress;
    data['employee_aadharno'] = employeeAadharno;
    data['employee_panno'] = employeePanno;
    data['employee_pfno'] = employeePfno;
    data['employee_esicno'] = employeeEsicno;
    data['employee_wcpolicy'] = employeeWcpolicy;
    data['employee_bank_acno'] = employeeBankAcno;
    data['employee_company_id'] = employeeCompanyId;
    data['password'] = password;
    return data;
  }
}