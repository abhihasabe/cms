import 'package:cms/models/employee_resp_model.dart';
import 'package:equatable/equatable.dart';

abstract class EmployeeState extends Equatable {}

class EmployeeInitial extends EmployeeState {
  @override
  List<Object?> get props => [];
}

class EmployeeLoading extends EmployeeState {
  @override
  List<Object?> get props => [];
}

class EmployeeSuccess extends EmployeeState {
  final String? message;
  final List<Data>? empResp;
  EmployeeSuccess({this.message, this.empResp});
  @override
  List<Object?> get props => [message, empResp];
}

class EmployeeError extends EmployeeState {
  final String? errorMessage;
  EmployeeError({
    this.errorMessage,
  });
  @override
  List<Object?> get props => [errorMessage];
}