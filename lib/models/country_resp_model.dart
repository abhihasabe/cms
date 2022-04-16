class CountryResp {
  int? success;
  String? message;
  List<CountryData>? data;

  CountryResp({this.success, this.message, this.data});

  CountryResp.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    if (json['data'] != null) {
      data = <CountryData>[];
      json['data'].forEach((v) {
        data!.add(new CountryData.fromJson(v));
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

class CountryData {
  int? cid;
  String? countryName;

  CountryData({this.cid, this.countryName});

  CountryData.fromJson(Map<String, dynamic> json) {
    cid = json['cid'];
    countryName = json['country_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['cid'] = this.cid;
    data['country_name'] = this.countryName;
    return data;
  }
}