import 'package:cms/validations/email_validation.dart';
import 'package:cms/validations/field_validation.dart';
import 'package:cms/validations/name_validation.dart';
import 'package:cms/validations/number_validation_dart.dart';
import 'package:cms/validations/password_validation.dart';
import 'package:cms/validations/pincode_validation_dart.dart';
import 'package:cms/validations/website_validation.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';

class AddCompanyState extends Equatable {
  const AddCompanyState({
    this.name = const Name.pure(),
    this.companyType = const Field.pure(),
    this.email = const Email.pure(),
    this.number = const Number.pure(),
    this.fax = const Name.pure(),
    this.address = const Name.pure(),
    this.companyInfo = const Name.pure(),
    this.pincode = const Pincode.pure(),
    this.website = const Website.pure(),
    this.country = const Field.pure(),
    this.city = const Field.pure(),
    this.status = FormzStatus.pure,
    this.exceptionError = "",
  });

  final Name name;
  final Field companyType;
  final Email email;
  final Number number;
  final Name fax;
  final Name address;
  final Name companyInfo;
  final Pincode pincode;
  final Website website;
  final Field country;
  final Field city;
  final FormzStatus status;
  final String exceptionError;

  @override
  List<Object> get props => [
        name,
        companyType,
        email,
        number,
        address,
        pincode,
        website,
        fax,
        country,
        city,
        companyInfo,
        status,
        exceptionError
      ];

  AddCompanyState copyWith({
    Name? name,
    Field? companyType,
    Email? email,
    Number? number,
    Name? fax,
    Name? address,
    Pincode? pincode,
    Website? website,
    Field? country,
    Field? city,
    Name? companyInfo,
    FormzStatus? status,
    String? exceptionError,
  }) {
    return AddCompanyState(
      name: name ?? this.name,
      companyType: companyType ?? this.companyType,
      email: email ?? this.email,
      number: number ?? this.number,
      fax: fax ?? this.fax,
      address: address ?? this.address,
      pincode: pincode ?? this.pincode,
      website: website ?? this.website,
      country: country ?? this.country,
      city: city ?? this.city,
      companyInfo: companyInfo ?? this.companyInfo,
      status: status ?? this.status,
      exceptionError: exceptionError ?? this.exceptionError,
    );
  }
}
