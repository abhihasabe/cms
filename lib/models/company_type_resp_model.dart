class CompanyTypesResp {
  int? success;
  String? message;
  List<CompanyTypeData>? data;

  CompanyTypesResp({this.success, this.message, this.data});

  CompanyTypesResp.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    if (json['data'] != null) {
      data = <CompanyTypeData>[];
      json['data'].forEach((v) {
        data!.add(CompanyTypeData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CompanyTypeData {
  int? cid;
  String? companyTypesName;

  CompanyTypeData({this.cid, this.companyTypesName});

  CompanyTypeData.fromJson(Map<String, dynamic> json) {
    cid = json['cid'];
    companyTypesName = json['company_types_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['cid'] = cid;
    data['company_types_name'] = companyTypesName;
    return data;
  }
}