class CityResp {
  int? success;
  String? message;
  List<CityData>? data;

  CityResp({this.success, this.message, this.data});

  CityResp.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    if (json['data'] != null) {
      data = <CityData>[];
      json['data'].forEach((v) {
        data!.add(new CityData.fromJson(v));
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

class CityData {
  int? cid;
  String? cityName;
  int? countryId;

  CityData({this.cid, this.cityName, this.countryId});

  CityData.fromJson(Map<String, dynamic> json) {
    cid = json['cid'];
    cityName = json['city_name'];
    countryId = json['country_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['cid'] = this.cid;
    data['city_name'] = this.cityName;
    data['country_id'] = this.countryId;
    return data;
  }
}