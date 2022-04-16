import 'package:cms/PlatformService.dart';
import 'package:cms/Screens/admin/compnay/showcompany/company_widget.dart';
import 'package:cms/bloc_cubits/company_cubit/company_cubit.dart';
import 'package:cms/bloc_cubits/company_cubit/company_state.dart';
import 'package:cms/helper/dialog.helper.dart';
import 'package:cms/storage/cache/secure_storage_helper.dart';
import 'package:cms/theme/app_colors.dart';
import 'package:cms/theme/app_shared_preferences_constant.dart';
import 'package:cms/widgets/app_scaffold_widget.dart';
import 'package:cms/widgets/header_widget.dart';
import 'package:cms/widgets/side_menu_widget/admin_side_menu_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CompanyScreen extends StatefulWidget {
  const CompanyScreen({Key? key}) : super(key: key);

  @override
  _CompanyScreenState createState() => _CompanyScreenState();
}

class _CompanyScreenState extends State<CompanyScreen> {
  var token;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getType();
  }

  void getType() async {
    token = await SecStore.getValue(keyVal: SharedPreferencesConstant.TOKEN);
    if (token != null) {
      context.read<CompanyCubit>().getCompany(token);
    }
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
        appBar: const Header(
          bgColor: primaryColor,
          iconColor: onPrimaryColor,
          textColor: onPrimaryColor,
          title: "Admin - Company",
        ),
        drawer: PlatFormServices.isDesktop(context)
            ? const AdminSideMenu(bgColor: onPrimaryColor, textColor: textColor)
            : const AdminSideMenu(bgColor: primaryColor, textColor: textDarkColor),
        body: SafeArea(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (PlatFormServices.isDesktop(context))
                const Expanded(
                  child: AdminSideMenu(bgColor: onPrimaryColor, textColor: textColor),
                ),
              Expanded(
                  flex: 5,
                  child: BlocConsumer<CompanyCubit, CompanyState>(
                      listener: (context, state) {},
                      builder: (context, state) {
                        if (state is CompanyInitial) {
                          return DialogHelper.buildLoading();
                        } else if (state is CompanyLoading) {
                          return DialogHelper.buildLoading();
                        } else if (state is CompanySuccess) {
                          return state.companyResp != null
                              ? HRCompanyWidget(companyData: state.companyResp!)
                              : Container();
                        } else if (state is CompanyError) {
                          return Center(child: Text("${state.errorMessage}"));
                        }
                        return DialogHelper.buildLoading();
                      })),
            ],
          ),
        ));
  }
}
