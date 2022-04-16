import 'package:cms/models/company_type_resp_model.dart';

import '../../models/company_resp_model.dart';
import 'package:equatable/equatable.dart';

abstract class CompanyState extends Equatable {}

class CompanyInitial extends CompanyState {
  @override
  List<Object?> get props => [];
}

class CompanyLoading extends CompanyState {
  @override
  List<Object?> get props => [];
}

class CompanySuccess extends CompanyState {
  final String? message;
  final List<Data>? companyResp;
  CompanySuccess({this.message, this.companyResp});
  @override
  List<Object?> get props => [message, companyResp];
}

class CompanyTypeSuccess extends CompanyState {
  final String? message;
  final List<CompanyTypeData>? companyTypeResp;
  CompanyTypeSuccess({this.message, this.companyTypeResp});
  @override
  List<Object?> get props => [message, companyTypeResp];
}

class CompanyError extends CompanyState {
  final String? errorMessage;
  CompanyError({
    this.errorMessage,
  });
  @override
  List<Object?> get props => [errorMessage];
}