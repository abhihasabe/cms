import 'package:cms/Screens/admin/employee/addemployee/add_employee_widget.dart';
import 'package:cms/widgets/side_menu_widget/admin_side_menu_widget.dart';
import 'package:cms/widgets/app_scaffold_widget.dart';
import 'package:cms/widgets/header_widget.dart';
import 'package:cms/theme/app_colors.dart';
import 'package:cms/PlatformService.dart';
import 'package:flutter/material.dart';

class AddEmployee extends StatefulWidget {
  const AddEmployee({Key? key}) : super(key: key);

  @override
  _AddEmployeeState createState() => _AddEmployeeState();
}

class _AddEmployeeState extends State<AddEmployee> {

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
        appBar: const Header(
          bgColor: primaryColor,
          iconColor: onPrimaryColor,
          textColor: onPrimaryColor,
          title: "Admin - Add Employee",
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
              const Expanded(flex: 5, child: AddEmployeeWidget()),
            ],
          ),
        ));
  }
}
