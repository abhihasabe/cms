import 'package:cms/theme/app_network_constants.dart';
import 'package:cms/models/user_model.dart';
import 'package:cms/network/api_calls.dart';

class AuthRepository {
  dynamic resp;

  Future signInWithEmail(String userName, String password) async {
    var loginJson = {"employee_email": userName, "password": password};
    resp = APIManager.authAPICall(LOGIN_URL, loginJson);
    return resp;
  }

  Future userRegistrationUser(EmployeeModel employeeModel) {
    var regJson = {
      "employee_name": "${employeeModel.employeeName}" != "null"
          ? "${employeeModel.employeeName}"
          : "",
      "employee_dob": "${employeeModel.employeeDob}" != "null"
          ? "${employeeModel.employeeDob}"
          : "",
      "employee_gender": "${employeeModel.employeeGender}" != "null"
          ? "${employeeModel.employeeGender}"
          : "",
      "employee_mobileno": "${employeeModel.employeeMobileno}" != "null"
          ? "${employeeModel.employeeMobileno}"
          : "",
      "employee_alternate_mobileno":
          "${employeeModel.employeeAlternateMobileno}" != "null"
              ? "${employeeModel.employeeAlternateMobileno}"
              : "",
      "employee_email": "${employeeModel.employeeEmail}" != "null"
          ? "${employeeModel.employeeEmail}"
          : "",
      "employee_type": "${employeeModel.employeeType}" != "null"
          ? "${employeeModel.employeeType}"
          : null,
      "employee_dept": "${employeeModel.employeeDept}" != "null"
          ? "${employeeModel.employeeDept}"
          : null,
      "employee_dateofjoining": "${employeeModel.employeeDateofjoining}" != "null"
          ? "${employeeModel.employeeDateofjoining}"
          : "",
      "employee_working_location":
          "${employeeModel.employeeWorkingLocation}" != "null"
              ? "${employeeModel.employeeWorkingLocation}"
              : null,
      "employee_end_date": "${employeeModel.employeeEndDate}" != "null"
          ? "${employeeModel.employeeEndDate}"
          : "",
      "employee_blood_group": "${employeeModel.employeeBloodGroup}" != "null"
          ? "${employeeModel.employeeBloodGroup}"
          : "",
      "employee_address": "${employeeModel.employeeAddress}" != "null"
          ? "${employeeModel.employeeAddress}"
          : "",
      "employee_aadharno": "${employeeModel.employeeAadharno}" != "null"
          ? "${employeeModel.employeeAadharno}"
          : "",
      "employee_panno": "${employeeModel.employeePanno}" != "null"
          ? "${employeeModel.employeePanno}"
          : "",
      "employee_pfno": "${employeeModel.employeePfno}" != "null"
          ? "${employeeModel.employeePfno}"
          : "",
      "employee_esicno": "${employeeModel.employeeEsicno}" != "null"
          ? "${employeeModel.employeeEsicno}"
          : "",
      "employee_wcpolicy": "${employeeModel.employeeWcpolicy}" != "null"
          ? "${employeeModel.employeeWcpolicy}"
          : "",
      "employee_bank_acno": "${employeeModel.employeeBankAcno}" != "null"
          ? "${employeeModel.employeeBankAcno}"
          : "",
      "employee_company_id": "${employeeModel.employeeCompanyId}" != "null"
          ? "${employeeModel.employeeCompanyId}"
          : null,
      "password":
          "${employeeModel.password}" != null ? "${employeeModel.password}" : ""
    };
    resp = APIManager.authAPICall(ADD_ADMIN_URL, regJson);
    return resp;
  }
}
