import 'package:cms/PlatformService.dart';
import 'package:cms/routes/app_routes_names.dart';
import 'package:cms/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:velocity_x/velocity_x.dart';

class InventorySideMenu extends StatelessWidget {
  const InventorySideMenu(
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
              title: "Home",
              svgSrc: "assets/icons/menu_dashbord.svg",
              press: () {
                VxNavigator.of(context).push(Uri.parse(inventoryHomeScreen));
              },
              textColor: textColor),
          SideMenuItem(
              title: "Inventory",
              svgSrc: "assets/icons/menu_task.svg",
              press: () {
                VxNavigator.of(context).push(Uri.parse(adminCompanyScreen));
              },
              textColor: textColor),
          SideMenuItem(
              title: "Add Inventory",
              svgSrc: "assets/icons/menu_tran.svg",
              press: () {
                VxNavigator.of(context).push(Uri.parse(addCompanyScreen));
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
