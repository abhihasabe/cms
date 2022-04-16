import 'package:cms/bloc_cubits/add_company_cubit/add_company_state.dart';
import 'package:cms/models/add_comapny_req.dart';
import 'package:cms/models/add_company_resp.dart';
import 'package:cms/models/company_type_resp_model.dart';
import 'package:cms/repository/company_repository.dart';
import 'package:cms/models/country_resp_model.dart';
import 'package:cms/models/company_resp_model.dart';
import 'package:cms/models/city_resp_model.dart';
import 'package:cms/validations/email_validation.dart';
import 'package:cms/validations/field_validation.dart';
import 'package:cms/validations/name_validation.dart';
import 'package:cms/validations/number_validation_dart.dart';
import 'package:cms/validations/pincode_validation_dart.dart';
import 'package:cms/validations/website_validation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

class AddCompanyCubit extends Cubit<AddCompanyState> {
  AddCompanyCubit(this._companyRepository) : super(const AddCompanyState());

  final CompanyRepository _companyRepository;
  List<CompanyResp>? empResp;

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

  void faxChanged(String value) {
    final fax = Name.dirty(value);
    emit(state.copyWith(
      fax: fax,
      status: Formz.validate([fax]),
    ));
  }

  void addressChanged(String value) {
    final address = Name.dirty(value);
    emit(state.copyWith(
      address: address,
      status: Formz.validate([address]),
    ));
  }

  void companyInfoChanged(String value) {
    final companyInfo = Name.dirty(value);
    emit(state.copyWith(
      companyInfo: companyInfo,
      status: Formz.validate([companyInfo]),
    ));
  }

  void pincodeChanged(String value) {
    final pincode = Pincode.dirty(value);
    emit(state.copyWith(
      pincode: pincode,
      status: Formz.validate([pincode]),
    ));
  }

  void websiteChanged(String value) {
    final website = Website.dirty(value);
    emit(state.copyWith(
      website: website,
      status: Formz.validate([website]),
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

  Future<void> addCompany(token) async {
    AddCompantReq addCompanyReq = AddCompantReq(
        companyName: state.name.value,
        companyType: int.parse(state.companyType.value),
        companyEmail: state.email.value,
        companyPhone: state.number.value,
        companyFax: state.fax.value,
        companyAddress: state.address.value,
        companyPincode: state.pincode.value,
        companyWebsite: state.website.value,
        companyCountry: int.parse(state.country.value),
        companyBranch: int.parse(state.city.value),
        companyInfo: state.companyInfo.value);

    if (!state.status.isValidated) return;
    emit(state.copyWith(status: FormzStatus.submissionInProgress));
    _companyRepository.addCompany(addCompanyReq, token).then((value) {
      AddCompanyResp result = AddCompanyResp.fromJson(value);
      if (result != null && result.success == 0) {
        emit(state.copyWith(
            status: FormzStatus.submissionFailure,
            exceptionError: result.message));
      } else {
        emit(state.copyWith(status: FormzStatus.submissionSuccess));
      }
    });
  }

  Future<List<CompanyTypeData>> getCompanyType(token) async =>
      _companyRepository.fetchCompanyTypeData(token).then((value) {
        CompanyTypesResp companyTypesResp = CompanyTypesResp.fromJson(value);
        List<CompanyTypeData> listCompanyData =
            List<CompanyTypeData>.from(companyTypesResp.data!);
        return listCompanyData;
      });

  Future<List<CountryData>> getCountry(token) async =>
      _companyRepository.fetchCountyData(token).then((value) {
        CountryResp countryResp = CountryResp.fromJson(value);
        List<CountryData> listCountryData =
            List<CountryData>.from(countryResp.data!);
        return listCountryData;
      });

  Future<List<CityData>> getCity(token, int i) async =>
      _companyRepository.fetchCityData(token, i).then((value) {
        CityResp cityResp = CityResp.fromJson(value);
        List<CityData> cityData = List<CityData>.from(cityResp.data!);
        return cityData;
      });
}
