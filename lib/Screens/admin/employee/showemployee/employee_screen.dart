import 'package:cms/Screens/admin/employee/showemployee/employee_widget.dart';
import 'package:cms/bloc_cubits/employee_cubit/employee_cubit.dart';
import 'package:cms/bloc_cubits/employee_cubit/employee_state.dart';
import 'package:cms/theme/app_shared_preferences_constant.dart';
import 'package:cms/storage/cache/secure_storage_helper.dart';
import 'package:cms/widgets/app_scaffold_widget.dart';
import 'package:cms/widgets/header_widget.dart';
import 'package:cms/widgets/side_menu_widget/admin_side_menu_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cms/helper/dialog.helper.dart';
import 'package:cms/theme/app_colors.dart';
import 'package:cms/PlatformService.dart';
import 'package:flutter/material.dart';

class EmployeeScreen extends StatefulWidget {
  const EmployeeScreen({Key? key}) : super(key: key);

  @override
  _EmployeeScreenState createState() => _EmployeeScreenState();
}

class _EmployeeScreenState extends State<EmployeeScreen> {
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
      context.read<EmployeeCubit>().getEmployee(token);
    }
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
        appBar: const Header(
          bgColor: primaryColor,
          iconColor: onPrimaryColor,
          textColor: onPrimaryColor,
          title: "Admin - Employee",
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
                  child: AdminSideMenu(
                      bgColor: onPrimaryColor, textColor: textColor),
                ),
              Expanded(
                  flex: 5,
                  child: BlocConsumer<EmployeeCubit, EmployeeState>(
                      listener: (context, state) {},
                      builder: (context, state) {
                        if (state is EmployeeInitial) {
                          return DialogHelper.buildLoading();
                        } else if (state is EmployeeLoading) {
                          return DialogHelper.buildLoading();
                        } else if (state is EmployeeSuccess) {
                          return state.empResp != null
                              ? EmployeeWidget(empData:state.empResp!)
                              : Container();
                        } else if (state is EmployeeError) {
                          return Center(child: Text("${state.errorMessage}"));
                        }
                        return DialogHelper.buildLoading();
                      })),
            ],
          ),
        ));
  }
}
