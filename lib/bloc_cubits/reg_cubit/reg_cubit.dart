import 'package:cms/models/reg_resp_model.dart';
import 'package:cms/validations/confirm_password_validation.dart';
import 'package:cms/validations/number_validation_dart.dart';
import 'package:cms/bloc_cubits/reg_cubit/reg_state.dart';
import 'package:cms/validations/password_validation.dart';
import 'package:cms/validations/email_validation.dart';
import 'package:cms/validations/field_validation.dart';
import 'package:cms/validations/name_validation.dart';
import 'package:cms/repository/auth_repository.dart';
import 'package:cms/validations/dob_validation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cms/models/user_model.dart';
import 'package:formz/formz.dart';

class RegCubit extends Cubit<RegState> {
  RegCubit(this._authRepository) : super(const RegState());

  final AuthRepository _authRepository;
  String? signupStatus;

  void nameChanged(String value) {
    final name = Name.dirty(value);
    emit(state.copyWith(
      name: name,
      status: Formz.validate([name, state.email, state.password]),
    ));
  }

  void numberChanged(String value) {
    final mobileNo = Number.dirty(value);
    emit(state.copyWith(
      number: mobileNo,
      status: Formz.validate([mobileNo, state.email, state.password]),
    ));
  }

  void dobChanged(String value) {
    final dob = DOB.dirty(value.toString());
    emit(state.copyWith(
      dob: dob,
      status: Formz.validate([dob, state.email, state.password]),
    ));
  }

  void locationChanged(String value) {
    final location = Field.dirty(value.toString());
    emit(state.copyWith(
      location: location,
      status: Formz.validate([location, state.email, state.password]),
    ));
  }

  void genderChanged(String value) {
    final gender = Field.dirty(value.toString());
    emit(state.copyWith(
      gender: gender,
      status: Formz.validate([gender, state.email, state.password]),
    ));
  }

  void emailChanged(String value) {
    final email = Email.dirty(value);
    emit(state.copyWith(
      email: email,
      status: Formz.validate([email, state.name, state.password]),
    ));
  }

  void passwordChanged(String value) {
    final password = Password.dirty(value);
    emit(state.copyWith(
      password: password,
      status: Formz.validate([password, state.name, state.email]),
    ));
  }

  void confirmPassword(String pass, String conPass) {
    final confirmPassword =
        ConfirmPassword.dirty(password: pass, value: conPass);
    emit(state.copyWith(
      confirmPassword: confirmPassword,
      status: Formz.validate([confirmPassword, state.name, state.email]),
    ));
  }

  Future<void> userReg(String userType) async {
    emit(state.copyWith(status: FormzStatus.submissionInProgress));
    EmployeeModel userModel = EmployeeModel(
        employeeName: state.name.value,
        employeeEmail: state.email.value,
        employeeMobileno: state.number.value,
        password: state.password.value,
        employeeType: 1);
    _authRepository.userRegistrationUser(userModel).then((value) {
      ResRespModel resRespModel = ResRespModel.fromJson(value);
      if (resRespModel != null && resRespModel.success == 0) {
        emit(state.copyWith(
            status: FormzStatus.submissionFailure,
            exceptionError: resRespModel.message));
      } else {
        emit(state.copyWith(status: FormzStatus.submissionSuccess));
      }
    });
  }
}
