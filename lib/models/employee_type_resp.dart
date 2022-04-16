class EmployeeTypesResp {
  int? success;
  String? message;
  List<EmployeeTypesData>? data;

  EmployeeTypesResp({this.success, this.message, this.data});

  EmployeeTypesResp.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    if (json['data'] != null) {
      data = <EmployeeTypesData>[];
      json['data'].forEach((v) {
        data!.add(new EmployeeTypesData.fromJson(v));
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

class EmployeeTypesData {
  int? utID;
  String? usersTypeName;

  EmployeeTypesData({this.utID, this.usersTypeName});

  EmployeeTypesData.fromJson(Map<String, dynamic> json) {
    utID = json['utID'];
    usersTypeName = json['users_type_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['utID'] = this.utID;
    data['users_type_name'] = this.usersTypeName;
    return data;
  }
}