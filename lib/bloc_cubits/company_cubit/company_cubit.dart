import 'package:cms/bloc_cubits/company_cubit/company_state.dart';
import 'package:cms/models/city_resp_model.dart';
import 'package:cms/models/company_type_resp_model.dart';
import 'package:cms/models/country_resp_model.dart';
import 'package:cms/repository/company_repository.dart';
import 'package:cms/models/company_resp_model.dart';
import 'package:cms/validations/email_validation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

class CompanyCubit extends Cubit<CompanyState> {
  CompanyCubit(this._companyRepository) : super(CompanyInitial());

  final CompanyRepository _companyRepository;
  List<CompanyResp>? empResp;

  getCompany(token) {
    emit(CompanyLoading());
    _companyRepository.fetchCompanyData(token).then((value) {
      CompanyResp employeeResp = CompanyResp.fromJson(value);
      List<Data> listEmployeeResp = List<Data>.from(employeeResp.data!);
      if (employeeResp != null && employeeResp.success == 0) {
        emit(CompanyError(errorMessage: 'data not found'));
      } else {
        emit(CompanySuccess(
            message: "data found", companyResp: listEmployeeResp));
      }
    });
  }
}
