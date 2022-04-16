class EmployeeResp {
  int? success;
  String? message;
  List<Data>? data;

  EmployeeResp({this.success, this.message, this.data});

  EmployeeResp.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? employeeName;
  String? employeeDob;
  String? employeeGender;
  String? employeeMobileno;
  String? employeeAlternateMobileno;
  String? employeeEmail;
  String? usersTypeName;
  String? companyTypesName;
  String? employeeDateofjoining;
  String? employeeEndDate;
  String? employeeBloodGroup;
  String? employeeAddress;
  String? employeeAadharno;
  String? employeePanno;
  String? employeePfno;
  String? employeeEsicno;
  String? employeeWcpolicy;
  String? employeeBankAcno;
  String? cityName;
  String? companyName;

  Data(
      {this.employeeName,
        this.employeeDob,
        this.employeeGender,
        this.employeeMobileno,
        this.employeeAlternateMobileno,
        this.employeeEmail,
        this.usersTypeName,
        this.companyTypesName,
        this.employeeDateofjoining,
        this.employeeEndDate,
        this.employeeBloodGroup,
        this.employeeAddress,
        this.employeeAadharno,
        this.employeePanno,
        this.employeePfno,
        this.employeeEsicno,
        this.employeeWcpolicy,
        this.employeeBankAcno,
        this.cityName,
        this.companyName});

  Data.fromJson(Map<String, dynamic> json) {
    employeeName = json['employee_name'];
    employeeDob = json['employee_dob'];
    employeeGender = json['employee_gender'];
    employeeMobileno = json['employee_mobileno'];
    employeeAlternateMobileno = json['employee_alternate_mobileno'];
    employeeEmail = json['employee_email'];
    usersTypeName = json['users_type_name'];
    companyTypesName = json['company_types_name'];
    employeeDateofjoining = json['employee_dateofjoining'];
    employeeEndDate = json['employee_end_date'];
    employeeBloodGroup = json['employee_blood_group'];
    employeeAddress = json['employee_address'];
    employeeAadharno = json['employee_aadharno'];
    employeePanno = json['employee_panno'];
    employeePfno = json['employee_pfno'];
    employeeEsicno = json['employee_esicno'];
    employeeWcpolicy = json['employee_wcpolicy'];
    employeeBankAcno = json['employee_bank_acno'];
    cityName = json['city_name'];
    companyName = json['company_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['employee_name'] = this.employeeName;
    data['employee_dob'] = this.employeeDob;
    data['employee_gender'] = this.employeeGender;
    data['employee_mobileno'] = this.employeeMobileno;
    data['employee_alternate_mobileno'] = this.employeeAlternateMobileno;
    data['employee_email'] = this.employeeEmail;
    data['users_type_name'] = this.usersTypeName;
    data['company_types_name'] = this.companyTypesName;
    data['employee_dateofjoining'] = this.employeeDateofjoining;
    data['employee_end_date'] = this.employeeEndDate;
    data['employee_blood_group'] = this.employeeBloodGroup;
    data['employee_address'] = this.employeeAddress;
    data['employee_aadharno'] = this.employeeAadharno;
    data['employee_panno'] = this.employeePanno;
    data['employee_pfno'] = this.employeePfno;
    data['employee_esicno'] = this.employeeEsicno;
    data['employee_wcpolicy'] = this.employeeWcpolicy;
    data['employee_bank_acno'] = this.employeeBankAcno;
    data['city_name'] = this.cityName;
    data['company_name'] = this.companyName;
    return data;
  }
}