import 'package:cms/bloc_cubits/employee_cubit/employee_state.dart';
import 'package:cms/models/employee_resp_model.dart';
import 'package:cms/repository/emp_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EmployeeCubit extends Cubit<EmployeeState> {
  EmployeeCubit(this.empRepository) : super(EmployeeInitial());

  EmpRepository empRepository;
  List<EmployeeResp>? empResp;

  getEmployee(token) {
    emit(EmployeeLoading());
    empRepository.fetchEmployeeData(token).then((value) {
      EmployeeResp employeeResp = EmployeeResp.fromJson(value);
      List<Data> listEmployeeResp = List<Data>.from(employeeResp.data!);
      if (employeeResp != null && employeeResp.success == 0) {
        emit(EmployeeError(errorMessage: 'data not found'));
      } else {
        emit(EmployeeSuccess(message: "data found", empResp: listEmployeeResp));
      }
    });
  }

  addEmployee() {}
}
