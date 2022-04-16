import 'package:cms/bloc_cubits/login_cubit/login_state.dart';
import 'package:cms/models/login_resp_model.dart';
import 'package:cms/storage/cache/secure_storage_helper.dart';
import 'package:cms/theme/app_shared_preferences_constant.dart';
import 'package:cms/validations/password_validation.dart';
import 'package:cms/validations/email_validation.dart';
import 'package:cms/repository/auth_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this._authRepository) : super(const LoginState());

  final AuthRepository _authRepository;

  void emailChanged(String value) {
    final email = Email.dirty(value);
    emit(state.copyWith(
      email: email,
      status: Formz.validate([email, state.email, state.password]),
    ));
  }

  void passwordChanged(String value) {
    final password = Password.dirty(value);
    emit(state.copyWith(
      password: password,
      status: Formz.validate([password, state.email, state.password]),
    ));
  }

  // auth_screen logout
  Future logout() async {
    await SecStore.deleteAll();
  }

  Future<void> userLogin() async {
    if (!state.status.isValidated) return;
    emit(state.copyWith(status: FormzStatus.submissionInProgress));
    _authRepository
        .signInWithEmail(state.email.value, state.password.value)
        .then((loginResp) {
      LoginResp? result = LoginResp.fromJson(loginResp);
      if (result != null && result.success == 0) {
        emit(state.copyWith(
            status: FormzStatus.submissionFailure,
            exceptionError: result.message));
      } else {
        SecStore.setValue(
            keyVal: SharedPreferencesConstant.USEREMAIL,
            value: result.data!.employeeEmail.toString());
        SecStore.setValue(
            keyVal: SharedPreferencesConstant.USERTYPE,
            value: result.data!.employeeType.toString());
        SecStore.setValue(
                keyVal: SharedPreferencesConstant.EMPLOYEETYPEID,
                value: result.data!.employeeType.toString())
            .then((value) {
          SecStore.setValue(
                  keyVal: SharedPreferencesConstant.TOKEN,
                  value: result.token.toString())
              .then((value) {
            emit(state.copyWith(status: FormzStatus.submissionSuccess));
          });
        });
      }
    });
  }
}
