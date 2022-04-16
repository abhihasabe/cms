class CompanyResp {
  int? success;
  String? message;
  List<Data>? data;

  CompanyResp({this.success, this.message, this.data});

  CompanyResp.fromJson(Map<String, dynamic> json) {
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
  String? companyName;
  String? companyTypesName;
  String? companyEmail;
  String? companyPhone;
  String? companyFax;
  String? companyAddress;
  String? countryName;
  String? cityName;
  String? companyPincode;
  String? companyWebsite;
  String? companyInfo;

  Data(
      {this.companyName,
        this.companyTypesName,
        this.companyEmail,
        this.companyPhone,
        this.companyFax,
        this.companyAddress,
        this.countryName,
        this.cityName,
        this.companyPincode,
        this.companyWebsite,
        this.companyInfo});

  Data.fromJson(Map<String, dynamic> json) {
    companyName = json['company_name'];
    companyTypesName = json['company_types_name'];
    companyEmail = json['company_email'];
    companyPhone = json['company_phone'];
    companyFax = json['company_fax'];
    companyAddress = json['company_address'];
    countryName = json['country_name'];
    cityName = json['city_name'];
    companyPincode = json['company_pincode'];
    companyWebsite = json['company_website'];
    companyInfo = json['company_info'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['company_name'] = this.companyName;
    data['company_types_name'] = this.companyTypesName;
    data['company_email'] = this.companyEmail;
    data['company_phone'] = this.companyPhone;
    data['company_fax'] = this.companyFax;
    data['company_address'] = this.companyAddress;
    data['country_name'] = this.countryName;
    data['city_name'] = this.cityName;
    data['company_pincode'] = this.companyPincode;
    data['company_website'] = this.companyWebsite;
    data['company_info'] = this.companyInfo;
    return data;
  }
}