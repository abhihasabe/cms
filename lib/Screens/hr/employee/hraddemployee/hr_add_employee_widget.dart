import 'package:cms/PlatformService.dart';
import 'package:cms/bloc_cubits/add_company_cubit/add_company_cubit.dart';
import 'package:cms/bloc_cubits/add_company_cubit/add_company_state.dart';
import 'package:cms/bloc_cubits/add_employee_cubit/add_employee_cubit.dart';
import 'package:cms/bloc_cubits/add_employee_cubit/add_employee_state.dart';
import 'package:cms/helper/dialog.helper.dart';
import 'package:cms/localization/app_localization.dart';
import 'package:cms/routes/app_routes_names.dart';
import 'package:cms/storage/cache/secure_storage_helper.dart';
import 'package:cms/theme/app_colors.dart';
import 'package:cms/theme/app_dimension.dart';
import 'package:cms/theme/app_shared_preferences_constant.dart';
import 'package:cms/utils/age_data.dart';
import 'package:cms/widgets/button_widget.dart';
import 'package:cms/widgets/dropdown_widget.dart';
import 'package:cms/widgets/header_widget.dart';
import 'package:cms/widgets/input_field_widget.dart';
import 'package:cms/widgets/radio_button_widget.dart';
import 'package:cms/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:velocity_x/velocity_x.dart';

class HRAddEmployeeWidget extends StatefulWidget {
  const HRAddEmployeeWidget({Key? key}) : super(key: key);

  @override
  _HRAddEmployeeWidgetState createState() => _HRAddEmployeeWidgetState();
}

class _HRAddEmployeeWidgetState extends State<HRAddEmployeeWidget> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneNoController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  String? _cityType = "",
      _countryType = "",
      _companyType = "",
      _employeeType = "";
  List<String>? empTypesResp = [];
  var brightness, token;
  List<String>? deptTypesResp = [];
  List<String>? countryResp = [];
  List<String>? cityResp = [];

  bool get isPopulated =>
      _nameController.text.isNotEmpty &&
      _employeeType!.length > 0 &&
      _emailController.text.isNotEmpty &&
      _phoneNoController.text.isNotEmpty &&
      _passwordController.text.isNotEmpty &&
      _cityType!.length > 0 &&
      _countryType!.length > 0 &&
      _companyType!.length > 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getType();
    brightness = MediaQueryData.fromWindow(WidgetsBinding.instance!.window)
        .platformBrightness;
  }

  void getType() async {
    token = await SecStore.getValue(keyVal: SharedPreferencesConstant.TOKEN);
    if (token != null) {
      context.read<AddEmployeeCubit>().getEmployeeType(token).then((value) {
        for (var element in value) {
          empTypesResp?.add(element.usersTypeName!);
        }
        setState(() {});
      });
    }
    if (token != null) {
      context.read<AddCompanyCubit>().getCompanyType(token).then((value) {
        for (var element in value) {
          deptTypesResp?.add(element.companyTypesName!);
        }
        setState(() {});
      });
      context.read<AddCompanyCubit>().getCountry(token).then((value) {
        for (var element in value) {
          countryResp?.add(element.countryName!);
        }
        setState(() {});
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocConsumer<AddEmployeeCubit, AddEmployeeState>(
          listener: (context, state) {
        if (state.status.isSubmissionFailure) {
          DialogHelper.showToasts(state.exceptionError);
          DialogHelper.dismissDialog(context);
        } else if (state.status.isSubmissionSuccess) {
          DialogHelper.showToasts("Company Added Successfully");
          VxNavigator.of(context).push(Uri.parse(adminHomeScreen));
        } else if (state.status.isSubmissionInProgress) {
          DialogHelper.showLoaderDialog(context);
        }
      }, builder: (context, state) {
        return ListView(
          controller: ScrollController(),
          children: [
            Padding(
              padding: PlatFormServices.isMobile(context)
                  ? const EdgeInsets.all(8)
                  : const EdgeInsets.all(28),
              child: Card(
                elevation: 2,
                child: Padding(
                  padding: PlatFormServices.isMobile(context)
                      ? const EdgeInsets.only(left: 18.0, right: 18, top: 18)
                      : const EdgeInsets.only(left: 28.0, right: 28, top: 18),
                  child: Column(children: [
                    const SizedBox(height: DIMENSION_12),
                    InputTextFormFieldWidget(
                      controller: _nameController,
                      hintText:
                          AppLocalization.of(context)!.translate('uname')!,
                      textCapitalization: TextCapitalization.sentences,
                      textInputType: TextInputType.number,
                      actionKeyboard: TextInputAction.next,
                      prefixIcon: const Icon(
                        Icons.person,
                        color: hoverColorDarkColor,
                      ),
                      errorMessage: state.name.invalid
                          ? AppLocalization.of(context)!.translate('peuname')!
                          : null,
                      onChange: (name) =>
                          context.read<AddEmployeeCubit>().nameChanged(name),
                      parametersValidate:
                          AppLocalization.of(context)!.translate('peuname')!,
                    ),
                    const SizedBox(height: DIMENSION_22),
                    InputTextFormFieldWidget(
                      controller: _emailController,
                      hintText:
                          AppLocalization.of(context)!.translate('email')!,
                      textCapitalization: TextCapitalization.sentences,
                      textInputType: TextInputType.emailAddress,
                      actionKeyboard: TextInputAction.next,
                      obscureText: false,
                      showSuffixIcon: false,
                      maxLine: 1,
                      prefixIcon:
                          const Icon(Icons.email, color: hoverColorDarkColor),
                      errorMessage: state.email.invalid
                          ? AppLocalization.of(context)!.translate('peeid')!
                          : null,
                      onChange: (name) =>
                          context.read<AddEmployeeCubit>().emailChanged(name),
                      parametersValidate:
                          AppLocalization.of(context)!.translate('peeid')!,
                    ),
                    const SizedBox(height: DIMENSION_22),
                    InputTextFormFieldWidget(
                      controller: _phoneNoController,
                      hintText: AppLocalization.of(context)!.translate('pno')!,
                      textCapitalization: TextCapitalization.sentences,
                      textInputType: TextInputType.phone,
                      actionKeyboard: TextInputAction.next,
                      obscureText: false,
                      showSuffixIcon: false,
                      maxLine: 1,
                      prefixIcon:
                          const Icon(Icons.phone, color: hoverColorDarkColor),
                      errorMessage: state.number.invalid
                          ? AppLocalization.of(context)!.translate('peno')!
                          : null,
                      onChange: (name) =>
                          context.read<AddEmployeeCubit>().numberChanged(name),
                      parametersValidate:
                          AppLocalization.of(context)!.translate('peno')!,
                    ),
                    const SizedBox(height: DIMENSION_22),
                    deptTypesResp != null
                        ? DropdownWidget(
                            context: context,
                            hintText: AppLocalization.of(context)!
                                .translate('companytype'),
                            label: AppLocalization.of(context)!
                                .translate('companytype'),
                            prefixIcon: const Icon(
                              Icons.account_balance,
                              color: hoverColorDarkColor,
                            ),
                            items: deptTypesResp,
                            value: _companyType,
                            onChoose: (newValue, index) {
                              setState(() {
                                _companyType = newValue;
                                FocusScope.of(context)
                                    .requestFocus(FocusNode());
                                context
                                    .read<AddEmployeeCubit>()
                                    .companyTypeChanged(index + 1);
                              });
                            },
                            errorMessage: state.companyType.invalid
                                ? AppLocalization.of(context)!
                                    .translate('psct')!
                                : null,
                          )
                        : Container(height: 0),
                    const SizedBox(height: DIMENSION_22),
                    DropdownWidget(
                      context: context,
                      hintText:
                          AppLocalization.of(context)!.translate('country'),
                      label: AppLocalization.of(context)!.translate('country'),
                      prefixIcon: const Icon(
                        Icons.local_airport,
                        color: hoverColorDarkColor,
                      ),
                      items: countryResp,
                      value: _countryType,
                      onChoose: (newValue, index) {
                        setState(() {
                          _countryType = newValue;
                          FocusScope.of(context).requestFocus(FocusNode());
                          cityResp?.clear();
                          _cityType = "";
                          context
                              .read<AddEmployeeCubit>()
                              .countryChanged(index + 1);
                          if (_countryType != null) {
                            context
                                .read<AddCompanyCubit>()
                                .getCity(token, index + 1)
                                .then((value) {
                              value.forEach((element) {
                                cityResp?.add(element.cityName!);
                              });
                              setState(() {});
                            });
                          }
                        });
                      },
                      errorMessage: state.country.invalid
                          ? AppLocalization.of(context)!.translate('psctry')
                          : null,
                    ),
                    const SizedBox(height: DIMENSION_22),
                    DropdownWidget(
                      context: context,
                      hintText: AppLocalization.of(context)!.translate('city'),
                      label: AppLocalization.of(context)!.translate('city'),
                      prefixIcon: const Icon(
                        Icons.location_city,
                        color: hoverColorDarkColor,
                      ),
                      items: cityResp,
                      value: _cityType,
                      onChoose: (newValue, index) {
                        setState(() {
                          _cityType = newValue;
                          FocusScope.of(context).requestFocus(FocusNode());
                          context
                              .read<AddEmployeeCubit>()
                              .cityChanged(index + 1);
                        });
                      },
                      errorMessage: state.city.invalid
                          ? AppLocalization.of(context)!.translate('pscty')
                          : null,
                    ),
                    const SizedBox(height: DIMENSION_22),
                    DropdownWidget(
                      context: context,
                      hintText: AppLocalization.of(context)!.translate('uty'),
                      label: AppLocalization.of(context)!.translate('uty'),
                      prefixIcon: const Icon(
                        Icons.supervised_user_circle,
                        color: hoverColorDarkColor,
                      ),
                      items: empTypesResp,
                      value: _employeeType,
                      onChoose: (newValue, index) {
                        setState(() {
                          _employeeType = newValue;
                          FocusScope.of(context).requestFocus(FocusNode());
                          context
                              .read<AddEmployeeCubit>()
                              .employeeTypeChanged(index + 1);
                        });
                      },
                      errorMessage: state.employeeType.invalid
                          ? AppLocalization.of(context)!.translate('peut')!
                          : null,
                    ),
                    const SizedBox(height: DIMENSION_22),
                    DropdownWidget(
                      context: context,
                      hintText: AppLocalization.of(context)!.translate('uty'),
                      label: AppLocalization.of(context)!.translate('uty'),
                      prefixIcon: const Icon(
                        Icons.supervised_user_circle,
                        color: hoverColorDarkColor,
                      ),
                      items: empTypesResp,
                      value: _employeeType,
                      onChoose: (newValue, index) {
                        setState(() {
                          _employeeType = newValue;
                          FocusScope.of(context).requestFocus(FocusNode());
                          context
                              .read<AddEmployeeCubit>()
                              .employeeTypeChanged(index + 1);
                        });
                      },
                      errorMessage: state.employeeType.invalid
                          ? AppLocalization.of(context)!.translate('peut')!
                          : null,
                    ),
                    const SizedBox(height: DIMENSION_22),
                    InputTextFormFieldWidget(
                      controller: _passwordController,
                      hintText:
                          AppLocalization.of(context)!.translate('password')!,
                      textCapitalization: TextCapitalization.sentences,
                      textInputType: TextInputType.number,
                      actionKeyboard: TextInputAction.next,
                      obscureText: false,
                      showSuffixIcon: false,
                      maxLine: 1,
                      prefixIcon: const Icon(Icons.monitor_weight_outlined,
                          color: hoverColorDarkColor),
                      errorMessage: state.password.invalid
                          ? AppLocalization.of(context)!.translate('pepass')!
                          : null,
                      onChange: (password) => context
                          .read<AddEmployeeCubit>()
                          .passwordChanged(password),
                      parametersValidate:
                          AppLocalization.of(context)!.translate('pepass')!,
                    ),
                    const SizedBox(height: DIMENSION_20),
                    ButtonWidget(
                      width: double.infinity,
                      title: AppLocalization.of(context)!.translate('add')!,
                      height: DIMENSION_42,
                      bTitleBold: true,
                      bgColor: (brightness == Brightness.dark)
                          ? buttonDarkColor
                          : buttonColor,
                      textColor: (brightness == Brightness.dark)
                          ? buttonDarkTextColor
                          : buttonTextColor,
                      disabledBgColor: (brightness == Brightness.dark)
                          ? disabledDarkColor
                          : disabledColor,
                      disabledTextColor: (brightness == Brightness.dark)
                          ? disabledTextDarkColor
                          : disabledTextColor,
                      bTitleS: true,
                      borderRadius: DIMENSION_5,
                      onClick: isPopulated && state.status.isValidated
                          ? () => context
                              .read<AddEmployeeCubit>()
                              .addEmployee(token)
                          : null,
                    ),
                    const SizedBox(height: DIMENSION_20),
                  ]),
                ),
              ),
            )
          ],
        );
      }),
    );
  }
}
