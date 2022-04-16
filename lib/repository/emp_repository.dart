import 'package:cms/models/add_employee_req.dart';
import 'package:cms/theme/app_network_constants.dart';
import 'package:cms/network/api_calls.dart';

class EmpRepository {
  dynamic resp;

  Future fetchEmployeeData(token) async {
    resp = APIManager.getAPICall(SHOW_EMPLOYEE_URL, token);
    return resp;
  }

  Future fetchEmployeeTypeData(token) {
    resp = APIManager.getAPICall(EMPLOYEE_TYPE_URL, token);
    return resp;
  }

  Future addEmployee(AddEmployeeReq addEmployeeReq, token) async {
    var addEmployeeInputJson = {
      "employee_name": addEmployeeReq.employeeName,
      "employee_dob": addEmployeeReq.employeeDob,
      "employee_gender": addEmployeeReq.employeeGender,
      "employee_mobileno": addEmployeeReq.employeeMobileno,
      "employee_alternate_mobileno": addEmployeeReq.employeeAlternateMobileno,
      "employee_email": addEmployeeReq.employeeEmail,
      "employee_type": addEmployeeReq.employeeType,
      "employee_dept": addEmployeeReq.employeeDept,
      "employee_dateofjoining": addEmployeeReq.employeeDateofjoining,
      "employee_working_location": addEmployeeReq.employeeWorkingLocation,
      "employee_end_date": addEmployeeReq.employeeEndDate,
      "employee_blood_group": addEmployeeReq.employeeBloodGroup,
      "employee_address": addEmployeeReq.employeeAddress,
      "employee_aadharno": addEmployeeReq.employeeAadharno,
      "employee_panno": addEmployeeReq.employeePanno,
      "employee_pfno": addEmployeeReq.employeePfno,
      "employee_esicno": addEmployeeReq.employeeEsicno,
      "employee_wcpolicy": addEmployeeReq.employeeWcpolicy,
      "employee_bank_acno": addEmployeeReq.employeeBankAcno,
      "employee_company_id": addEmployeeReq.employeeCompanyId,
      "password": addEmployeeReq.password,
    };
    resp = APIManager.postAPICall(ADD_EMPLOYEE_URL, addEmployeeInputJson, token);
    return resp;
  }
}
