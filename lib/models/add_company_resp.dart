class AddCompanyResp {
  int? success;
  String? message;

  AddCompanyResp({this.success, this.message});

  AddCompanyResp.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    data['message'] = message;
    return data;
  }
}
