class CountResp {
  int? success;
  String? message;
  List<Data>? data;

  CountResp({this.success, this.message, this.data});

  CountResp.fromJson(Map<String, dynamic> json) {
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
  String? tABLENAME;
  int? sUMTABLEROWS;

  Data({this.tABLENAME, this.sUMTABLEROWS});

  Data.fromJson(Map<String, dynamic> json) {
    tABLENAME = json['TABLE_NAME'];
    sUMTABLEROWS = json['SUM(TABLE_ROWS)'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['TABLE_NAME'] = this.tABLENAME;
    data['SUM(TABLE_ROWS)'] = this.sUMTABLEROWS;
    return data;
  }
}