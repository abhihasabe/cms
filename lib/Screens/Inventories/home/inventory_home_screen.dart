import 'package:cms/Screens/Inventories/home/inventory_home_mobile_widget.dart';
import 'package:cms/Screens/Inventories/home/inventory_home_web_widget.dart';
import 'package:cms/bloc_cubits/admin_home_cubit/admin_home_cubit.dart';
import 'package:cms/bloc_cubits/admin_home_cubit/admin_home_state.dart';
import 'package:cms/widgets/side_menu_widget/hr_side_menu_widget.dart';
import 'package:cms/Screens/hr/home/hr_home_mobile_widget.dart';
import 'package:cms/theme/app_shared_preferences_constant.dart';
import 'package:cms/storage/cache/secure_storage_helper.dart';
import 'package:cms/Screens/hr/home/hr_home_web_widget.dart';
import 'package:cms/widgets/app_scaffold_widget.dart';
import 'package:cms/widgets/header_widget.dart';
import 'package:cms/widgets/side_menu_widget/inventory_side_menu_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cms/helper/dialog.helper.dart';
import 'package:cms/theme/app_colors.dart';
import 'package:cms/PlatformService.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

class InventoryHomeScreen extends StatefulWidget {
  const InventoryHomeScreen({Key? key}) : super(key: key);

  @override
  _InventoryHomeScreenState createState() => _InventoryHomeScreenState();
}

class _InventoryHomeScreenState extends State<InventoryHomeScreen> {
  bool openMenu = false;
  var token;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getType();
  }

  void getType() async {
    await SecStore.getValue(keyVal: SharedPreferencesConstant.TOKEN)
        .then((value) {
      if (value != null) {
        context.read<AdminCubit>().showCount(value);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
        appBar: const Header(
          bgColor: primaryColor,
          iconColor: onPrimaryColor,
          textColor: onPrimaryColor,
          title: "Inventory - Home",
        ),
        drawer: PlatFormServices.isDesktop(context)
            ? const InventorySideMenu(
                bgColor: onPrimaryColor, textColor: textColor)
            : const InventorySideMenu(
                bgColor: primaryColor, textColor: textDarkColor),
        body: SafeArea(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (PlatFormServices.isDesktop(context))
                Expanded(
                  child: PlatFormServices.isDesktop(context)
                      ? const InventorySideMenu(
                          bgColor: onPrimaryColor, textColor: textColor)
                      : const InventorySideMenu(
                          bgColor: primaryColor, textColor: textDarkColor),
                ),
              Expanded(
                flex: 5,
                child: BlocConsumer<AdminCubit, AdminState>(
                    listener: (context, state) {},
                    builder: (context, state) {
                      if (state is AdminInitial) {
                        return DialogHelper.buildLoading();
                      } else if (state is AdminLoading) {
                        return DialogHelper.buildLoading();
                      } else if (state is AdminSuccess) {
                        return state.countData != null
                            ? PlatFormServices.isMobile(context)
                                ? InventoryHomeMobileWidget(
                                    countData: state.countData)
                                : InventoryHomeWebWidget(
                                    countData: state.countData)
                            : Container();
                      } else if (state is AdminError) {
                        return Center(child: Text("${state.errorMessage}"));
                      }
                      return DialogHelper.buildLoading();
                    }),
              ),
            ],
          ),
        ));
  }
}
