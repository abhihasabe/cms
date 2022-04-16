class AddCompantReq {
  String? companyName;
  int? companyType;
  String? companyEmail;
  String? companyPhone;
  String? companyFax;
  String? companyAddress;
  String? companyPincode;
  String? companyWebsite;
  int? companyCountry;
  int? companyBranch;
  String? companyInfo;

  AddCompantReq(
      {this.companyName,
      this.companyType,
      this.companyEmail,
      this.companyPhone,
      this.companyFax,
      this.companyAddress,
      this.companyBranch,
      this.companyPincode,
      this.companyCountry,
      this.companyWebsite,
      this.companyInfo});

  AddCompantReq.fromJson(Map<String, dynamic> json) {
    companyName = json['company_name'];
    companyType = json['company_type'];
    companyEmail = json['company_email'];
    companyPhone = json['company_phone'];
    companyFax = json['company_fax'];
    companyAddress = json['company_address'];
    companyBranch = json['company_branch'];
    companyPincode = json['company_pincode'];
    companyCountry = json['company_country'];
    companyWebsite = json['company_website'];
    companyInfo = json['company_info'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['company_name'] = this.companyName;
    data['company_type'] = this.companyType;
    data['company_email'] = this.companyEmail;
    data['company_phone'] = this.companyPhone;
    data['company_fax'] = this.companyFax;
    data['company_address'] = this.companyAddress;
    data['company_branch'] = this.companyBranch;
    data['company_pincode'] = this.companyPincode;
    data['company_country'] = this.companyCountry;
    data['company_website'] = this.companyWebsite;
    data['company_info'] = this.companyInfo;
    return data;
  }
}
