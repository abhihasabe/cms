import 'package:cms/PlatformService.dart';
import 'package:cms/routes/app_routes_names.dart';
import 'package:cms/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:velocity_x/velocity_x.dart';

class HRSideMenu extends StatelessWidget {
  const HRSideMenu(
      {Key? key, this.permanentlyDisplay, this.bgColor, this.textColor})
      : super(key: key);

  final Color? bgColor, textColor;
  final bool? permanentlyDisplay;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: bgColor,
      child: ListView(
        children: [
          if (PlatFormServices.isMobile(context))
            DrawerHeader(
              child: Image.asset("assets/images/logo.png"),
            ),
          SideMenuItem(
              title: "Dashboard",
              svgSrc: "assets/icons/menu_dashbord.svg",
              press: () {
                VxNavigator.of(context).push(Uri.parse(hrHomeScreen));
              },
              textColor: textColor),
          SideMenuItem(
              title: "Company",
              svgSrc: "assets/icons/menu_task.svg",
              press: () {
                VxNavigator.of(context).push(Uri.parse(hrCompanyScreen));
              },
              textColor: textColor),
          SideMenuItem(
              title: "Employee",
              svgSrc: "assets/icons/menu_tran.svg",
              press: () {
                VxNavigator.of(context).push(Uri.parse(hrEmployeeScreen));
              },
              textColor: textColor),
          SideMenuItem(
              title: "Attendance",
              svgSrc: "assets/icons/menu_tran.svg",
              press: () {
                VxNavigator.of(context).push(Uri.parse(employeeScreen));
              },
              textColor: textColor),
          SideMenuItem(
              title: "Leave",
              svgSrc: "assets/icons/menu_task.svg",
              press: () {
                VxNavigator.of(context).push(Uri.parse(addEmployeeScreen));
              },
              textColor: textColor),
          SideMenuItem(
              title: "Add Employee",
              svgSrc: "assets/icons/menu_doc.svg",
              press: () {
                VxNavigator.of(context).push(Uri.parse(hrAddEmployeeScreen));
              },
              textColor: textColor),
          SideMenuItem(
              title: "Add Salary",
              svgSrc: "assets/icons/menu_notification.svg",
              press: () {
                VxNavigator.of(context).push(Uri.parse(inventoryScreen));
              },
              textColor: textColor),
          SideMenuItem(
              title: "Add Inventory",
              svgSrc: "assets/icons/menu_profile.svg",
              press: () {
                VxNavigator.of(context).push(Uri.parse(employeeScreen));
              },
              textColor: textColor),
          SideMenuItem(
              title: "Expense",
              svgSrc: "assets/icons/menu_setting.svg",
              press: () {
                VxNavigator.of(context).push(Uri.parse(projectsScreen));
              },
              textColor: textColor),
          SideMenuItem(
              title: "Add Expense",
              svgSrc: "assets/icons/menu_setting.svg",
              press: () {
                VxNavigator.of(context).push(Uri.parse(langScreen));
              },
              textColor: textColor),
          SideMenuItem(
              title: "Calendar",
              svgSrc: "assets/icons/menu_setting.svg",
              press: () {
                VxNavigator.of(context).push(Uri.parse(projectsScreen));
              },
              textColor: textColor),
          SideMenuItem(
              title: "Add Calendar",
              svgSrc: "assets/icons/menu_setting.svg",
              press: () {
                VxNavigator.of(context).push(Uri.parse(langScreen));
              },
              textColor: textColor),
          SideMenuItem(
              title: "Projects",
              svgSrc: "assets/icons/menu_setting.svg",
              press: () {
                VxNavigator.of(context).push(Uri.parse(projectsScreen));
              },
              textColor: textColor),
          SideMenuItem(
              title: "Add Projects",
              svgSrc: "assets/icons/menu_setting.svg",
              press: () {
                VxNavigator.of(context).push(Uri.parse(langScreen));
              },
              textColor: textColor),
        ],
      ),
    );
  }
}

class SideMenuItem extends StatelessWidget {
  const SideMenuItem(
      {Key? key,
      // For selecting those three line once press "Command+D"
      this.title,
      this.svgSrc,
      this.press,
      this.textColor,
      this.selectedTileColor})
      : super(key: key);

  final String? title, svgSrc;
  final VoidCallback? press;
  final Color? textColor, selectedTileColor;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          selectedTileColor: disabledTextColor,
          onTap: press,
          horizontalTitleGap: 0.0,
          minVerticalPadding: 10,
          leading: SvgPicture.asset(
            svgSrc!,
            color: textColor,
            height: 16,
          ),
          title: Text(
            title!,
            style: TextStyle(color: textColor),
          ),
        ),
        const Divider(
          height: 1,
          color: enableBorderColor,
        )
      ],
    );
  }
}
