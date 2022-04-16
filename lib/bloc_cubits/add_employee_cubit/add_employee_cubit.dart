import 'package:cms/bloc_cubits/add_employee_cubit/add_employee_state.dart';
import 'package:cms/models/add_employee_resp.dart';
import 'package:cms/validations/number_validation_dart.dart';
import 'package:cms/validations/field_validation.dart';
import 'package:cms/validations/email_validation.dart';
import 'package:cms/validations/name_validation.dart';
import 'package:cms/models/employee_type_resp.dart';
import 'package:cms/repository/emp_repository.dart';
import 'package:cms/models/add_employee_req.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

class AddEmployeeCubit extends Cubit<AddEmployeeState> {
  AddEmployeeCubit(this._employeeRepository) : super(const AddEmployeeState());

  final EmpRepository _employeeRepository;
  List<EmpRepository>? empResp;

  void nameChanged(String value) {
    final name = Name.dirty(value);
    emit(state.copyWith(
      name: name,
      status: Formz.validate([name]),
    ));
  }

  void companyTypeChanged(int value) {
    final companyType = Field.dirty(value.toString());
    emit(state.copyWith(
      companyType: companyType,
      status: Formz.validate([companyType]),
    ));
  }

  void emailChanged(String value) {
    final email = Email.dirty(value);
    emit(state.copyWith(
      email: email,
      status: Formz.validate([email]),
    ));
  }

  void numberChanged(String value) {
    final mobileNo = Number.dirty(value);
    emit(state.copyWith(
      number: mobileNo,
      status: Formz.validate([mobileNo]),
    ));
  }

  void passwordChanged(String value) {
    final password = Field.dirty(value);
    emit(state.copyWith(
      password: password,
      status: Formz.validate([password]),
    ));
  }

  void employeeTypeChanged(int value) {
    final employeeType = Field.dirty(value.toString());
    emit(state.copyWith(
      employeeType: employeeType,
      status: Formz.validate([employeeType]),
    ));
  }

  void countryChanged(int value) {
    final countries = Field.dirty(value.toString());
    emit(state.copyWith(
      country: countries,
      status: Formz.validate([countries]),
    ));
  }

  void cityChanged(int value) {
    final city = Field.dirty(value.toString());
    emit(state.copyWith(
      city: city,
      status: Formz.validate([city]),
    ));
  }

  Future<List<EmployeeTypesData>> getEmployeeType(token) async =>
      _employeeRepository.fetchEmployeeTypeData(token).then((value) {
        EmployeeTypesResp companyTypesResp = EmployeeTypesResp.fromJson(value);
        List<EmployeeTypesData> listCompanyData =
            List<EmployeeTypesData>.from(companyTypesResp.data!);
        return listCompanyData;
      });

  Future<void> addEmployee(token) async {
    AddEmployeeReq addEmployeeReq = AddEmployeeReq(
        employeeName: state.name.value,
        employeeDob: "",
        employeeGender: "",
        employeeMobileno: state.number.value,
        employeeAlternateMobileno: "",
        employeeEmail: state.email.value,
        employeeType: int.parse(state.employeeType.value),
        employeeDept: null,
        employeeDateofjoining: "",
        employeeWorkingLocation: null,
        employeeEndDate: "",
        employeeBloodGroup: "",
        employeeAddress: "",
        employeeAadharno: "",
        employeePanno: "",
        employeePfno: "",
        employeeEsicno: "",
        employeeWcpolicy: "",
        employeeBankAcno: "",
        employeeCompanyId: null,
        password: state.password.value);

    print("addEmployeeReq $addEmployeeReq");

    if (!state.status.isValidated) return;
    emit(state.copyWith(status: FormzStatus.submissionInProgress));
    _employeeRepository.addEmployee(addEmployeeReq, token).then((value) {
      AddEmployeeResp result = AddEmployeeResp.fromJson(value);
      if (result != null && result.success == 0) {
        emit(state.copyWith(
            status: FormzStatus.submissionFailure,
            exceptionError: result.message));
      } else {
        emit(state.copyWith(status: FormzStatus.submissionSuccess));
      }
    });
  }
}
