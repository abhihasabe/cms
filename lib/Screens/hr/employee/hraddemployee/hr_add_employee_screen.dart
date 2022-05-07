import 'package:cms/Screens/admin/compnay/addcompany/1add_comapny_widget.dart';
import 'package:cms/Screens/admin/employee/addemployee/add_employee_widget.dart';
import 'package:cms/Screens/hr/employee/hraddemployee/hr_add_employee_widget.dart';
import 'package:cms/widgets/app_scaffold_widget.dart';
import 'package:cms/widgets/header_widget.dart';
import 'package:cms/widgets/side_menu_widget/admin_side_menu_widget.dart';
import 'package:cms/theme/app_colors.dart';
import 'package:cms/PlatformService.dart';
import 'package:cms/widgets/side_menu_widget/hr_side_menu_widget.dart';
import 'package:flutter/material.dart';

class HRAddEmployee extends StatefulWidget {
  const HRAddEmployee({Key? key}) : super(key: key);

  @override
  _HRAddEmployeeState createState() => _HRAddEmployeeState();
}

class _HRAddEmployeeState extends State<HRAddEmployee> {
  @override
  Widget build(BuildContext context) {
    return AppScaffold(
        appBar: const Header(
          bgColor: primaryColor,
          iconColor: onPrimaryColor,
          textColor: onPrimaryColor,
          title: "HR - Add Employee",
        ),
        drawer: PlatFormServices.isDesktop(context)
            ? const HRSideMenu(bgColor: onPrimaryColor, textColor: textColor)
            : const HRSideMenu(bgColor: primaryColor, textColor: textDarkColor),
        body: SafeArea(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (PlatFormServices.isDesktop(context))
                const Expanded(
                  child:
                      HRSideMenu(bgColor: onPrimaryColor, textColor: textColor),
                ),
              const Expanded(flex: 5, child: HRAddEmployeeWidget()),
            ],
          ),
        ));
  }
}
