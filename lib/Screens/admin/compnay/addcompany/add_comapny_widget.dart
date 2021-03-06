import 'package:cms/bloc_cubits/add_company_cubit/add_company_cubit.dart';
import 'package:cms/bloc_cubits/add_company_cubit/add_company_state.dart';
import 'package:cms/theme/app_shared_preferences_constant.dart';
import 'package:cms/storage/cache/secure_storage_helper.dart';
import 'package:cms/localization/app_localization.dart';
import 'package:cms/theme/app_font_size.dart' as dimens;
import 'package:cms/widgets/input_field_widget.dart';
import 'package:cms/routes/app_routes_names.dart';
import 'package:cms/widgets/dropdown_widget.dart';
import 'package:cms/widgets/multi_select_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cms/widgets/button_widget.dart';
import 'package:cms/helper/dialog.helper.dart';
import 'package:cms/theme/app_dimension.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:cms/theme/app_colors.dart';
import 'package:cms/PlatformService.dart';
import 'package:flutter/material.dart';
import 'package:formz/formz.dart';

class AddCompanyWidget extends StatefulWidget {
  const AddCompanyWidget({Key? key}) : super(key: key);

  @override
  _HRAddCompanyWidgetState createState() => _HRAddCompanyWidgetState();
}

class _HRAddCompanyWidgetState extends State<AddCompanyWidget> {
  var brightness, token;
  List<String>? deptTypesResp = [];
  List<String>? countryResp = [];
  List<String>? cityResp = [];
  List<String> _selectedItems = [];
  String? _cityType = "", _countryType = "", _companyType = "";
  final TextEditingController _companyNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneNoController = TextEditingController();
  final TextEditingController _faxController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _pincodeController = TextEditingController();
  final TextEditingController _websiteController = TextEditingController();
  final TextEditingController _comapnyInfoController = TextEditingController();

  bool get isPopulated =>
      _companyNameController.text.isNotEmpty &&
      _companyType!.length > 0 &&
      _emailController.text.isNotEmpty &&
      _countryType!.length > 0 &&
      _cityType!.length > 0;

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
      context.read<AddCompanyCubit>().getCompanyType(token).then((value) {
        value.forEach((element) {
          deptTypesResp?.add(element.companyTypesName!);
        });
        setState(() {});
      });
      context.read<AddCompanyCubit>().getCountry(token).then((value) {
        value.forEach((element) {
          countryResp?.add(element.countryName!);
        });
        setState(() {});
      });
    }
  }

  void _showMultiSelect() async {
    final List<String>? results = await showDialog(
      context: context,
      builder: (BuildContext context) {
        return MultiSelect(items: countryResp!, title: "Country");
      },
    );

    // Update UI
    if (results != null) {
      setState(() {
        _selectedItems = results;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocConsumer<AddCompanyCubit, AddCompanyState>(
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
                  ? const EdgeInsets.all(8.0)
                  : const EdgeInsets.all(28.0),
              child: Card(
                elevation: 2,
                child: Padding(
                  padding: PlatFormServices.isMobile(context)
                      ? const EdgeInsets.only(left: 18.0, right: 18, top: 18)
                      : const EdgeInsets.only(left: 28.0, right: 28, top: 18),
                  child: Column(children: [
                    const SizedBox(height: DIMENSION_12),
                    InputTextFormFieldWidget(
                      controller: _companyNameController,
                      hintText:
                          AppLocalization.of(context)!.translate('uname')!,
                      textCapitalization: TextCapitalization.sentences,
                      textInputType: TextInputType.name,
                      actionKeyboard: TextInputAction.next,
                      prefixIcon: const Icon(
                        Icons.person,
                        color: hoverColorDarkColor,
                      ),
                      errorMessage: state.name.invalid
                          ? AppLocalization.of(context)!.translate('peuname')!
                          : null,
                      onChange: (name) =>
                          context.read<AddCompanyCubit>().nameChanged(name),
                      parametersValidate:
                          AppLocalization.of(context)!.translate('peuname')!,
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
                                    .read<AddCompanyCubit>()
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
                          context.read<AddCompanyCubit>().emailChanged(name),
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
                          context.read<AddCompanyCubit>().numberChanged(name),
                      parametersValidate:
                          AppLocalization.of(context)!.translate('peno')!,
                    ),
                    const SizedBox(height: DIMENSION_22),
                    InputTextFormFieldWidget(
                      controller: _faxController,
                      hintText: AppLocalization.of(context)!.translate('fax')!,
                      textCapitalization: TextCapitalization.sentences,
                      textInputType: TextInputType.text,
                      actionKeyboard: TextInputAction.next,
                      obscureText: false,
                      showSuffixIcon: false,
                      maxLine: 1,
                      prefixIcon:
                          const Icon(Icons.fax, color: hoverColorDarkColor),
                      errorMessage: state.fax.invalid
                          ? AppLocalization.of(context)!.translate('pefax')!
                          : null,
                      onChange: (name) =>
                          context.read<AddCompanyCubit>().faxChanged(name),
                      parametersValidate:
                          AppLocalization.of(context)!.translate('pefax')!,
                    ),
                    const SizedBox(height: DIMENSION_22),
                    InputTextFormFieldWidget(
                      controller: _addressController,
                      hintText:
                          AppLocalization.of(context)!.translate('address')!,
                      textCapitalization: TextCapitalization.sentences,
                      textInputType: TextInputType.text,
                      actionKeyboard: TextInputAction.next,
                      obscureText: false,
                      showSuffixIcon: false,
                      maxLine: 1,
                      prefixIcon:
                          const Icon(Icons.house, color: hoverColorDarkColor),
                      errorMessage: state.address.invalid
                          ? AppLocalization.of(context)!.translate('peaddress')!
                          : null,
                      onChange: (name) =>
                          context.read<AddCompanyCubit>().addressChanged(name),
                      parametersValidate:
                          AppLocalization.of(context)!.translate('peaddress')!,
                    ),
                    const SizedBox(height: DIMENSION_22),
                    InputTextFormFieldWidget(
                      controller: _pincodeController,
                      hintText:
                          AppLocalization.of(context)!.translate('pincode')!,
                      textCapitalization: TextCapitalization.sentences,
                      textInputType: TextInputType.number,
                      actionKeyboard: TextInputAction.next,
                      obscureText: false,
                      showSuffixIcon: false,
                      maxLine: 1,
                      prefixIcon: const Icon(Icons.monitor_weight_outlined,
                          color: hoverColorDarkColor),
                      errorMessage: state.pincode.invalid
                          ? AppLocalization.of(context)!.translate('pepincode')!
                          : null,
                      onChange: (name) =>
                          context.read<AddCompanyCubit>().pincodeChanged(name),
                      parametersValidate:
                          AppLocalization.of(context)!.translate('pepincode')!,
                    ),
                    const SizedBox(height: DIMENSION_22),
                    InputTextFormFieldWidget(
                      controller: _websiteController,
                      hintText:
                          AppLocalization.of(context)!.translate('website')!,
                      textCapitalization: TextCapitalization.sentences,
                      textInputType: TextInputType.text,
                      actionKeyboard: TextInputAction.next,
                      obscureText: false,
                      showSuffixIcon: false,
                      maxLine: 1,
                      prefixIcon: const Icon(Icons.vpn_lock,
                          color: hoverColorDarkColor),
                      errorMessage: state.website.invalid
                          ? AppLocalization.of(context)!.translate('pew')!
                          : null,
                      onChange: (name) =>
                          context.read<AddCompanyCubit>().websiteChanged(name),
                      parametersValidate:
                          AppLocalization.of(context)!.translate('pew')!,
                    ),
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
                              .read<AddCompanyCubit>()
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
                              .read<AddCompanyCubit>()
                              .cityChanged(index + 1);
                        });
                      },
                      errorMessage: state.city.invalid
                          ? AppLocalization.of(context)!.translate('pscty')
                          : null,
                    ),
                    const SizedBox(height: DIMENSION_22),
                    InputTextFormFieldWidget(
                      controller: _comapnyInfoController,
                      hintText: AppLocalization.of(context)!
                          .translate('companyinfo')!,
                      textCapitalization: TextCapitalization.sentences,
                      textInputType: TextInputType.text,
                      actionKeyboard: TextInputAction.done,
                      obscureText: false,
                      showSuffixIcon: false,
                      maxLine: 5,
                      prefixIcon: const Icon(Icons.monitor_weight_outlined,
                          color: hoverColorDarkColor),
                      errorMessage: state.companyInfo.invalid
                          ? AppLocalization.of(context)!.translate('peci')!
                          : null,
                      onChange: (name) => context
                          .read<AddCompanyCubit>()
                          .companyInfoChanged(name),
                      parametersValidate:
                          AppLocalization.of(context)!.translate('peci')!,
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
                      onClick: isPopulated /*&& state.status.isValidated*/
                          ? () =>
                              context.read<AddCompanyCubit>().addCompany(token)
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
