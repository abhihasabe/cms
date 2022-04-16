import 'package:cms/validations/number_validation_dart.dart';
import 'package:cms/validations/email_validation.dart';
import 'package:cms/validations/field_validation.dart';
import 'package:cms/validations/name_validation.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';

class AddEmployeeState extends Equatable {
  const AddEmployeeState({
    this.name = const Name.pure(),
    this.email = const Email.pure(),
    this.number = const Number.pure(),
    this.password = const Field.pure(),
    this.companyType = const Field.pure(),
    this.country = const Field.pure(),
    this.city = const Field.pure(),
    this.employeeType = const Field.pure(),
    this.status = FormzStatus.pure,
    this.exceptionError = "",
  });

  final Name name;
  final Email email;
  final Number number;
  final Field password;
  final Field country;
  final Field city;
  final Field companyType;
  final Field employeeType;
  final FormzStatus status;
  final String exceptionError;

  @override
  List<Object> get props => [
        name,
        email,
        number,
        password,
        country,
        city,
        employeeType,
        companyType,
        status,
        exceptionError
      ];

  AddEmployeeState copyWith({
    Name? name,
    Email? email,
    Number? number,
    Field? password,
    Field? companyType,
    Field? employeeType,
    Field? country,
    Field? city,
    FormzStatus? status,
    String? exceptionError,
  }) {
    return AddEmployeeState(
      name: name ?? this.name,
      email: email ?? this.email,
      status: status ?? this.status,
      number: number ?? this.number,
      password: password ?? this.password,
      country: country ?? this.country,
      city: city ?? this.city,
      companyType: companyType ?? this.companyType,
      employeeType: employeeType ?? this.employeeType,
      exceptionError: exceptionError ?? this.exceptionError,
    );
  }
}
