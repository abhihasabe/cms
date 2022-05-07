import 'package:cms/Screens/admin/home/home_mobile_widget.dart';
import 'package:cms/Screens/admin/home/home_web_widget.dart';
import 'package:cms/bloc_cubits/admin_home_cubit/admin_home_cubit.dart';
import 'package:cms/bloc_cubits/admin_home_cubit/admin_home_state.dart';
import 'package:cms/helper/dialog.helper.dart';
import 'package:cms/storage/cache/secure_storage_helper.dart';
import 'package:cms/theme/app_shared_preferences_constant.dart';
import 'package:cms/widgets/app_scaffold_widget.dart';
import 'package:cms/widgets/header_widget.dart';
import 'package:cms/widgets/side_menu_widget/admin_side_menu_widget.dart';
import 'package:cms/theme/app_colors.dart';
import 'package:cms/PlatformService.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
        /*appBar: ToolbarWidget(
        title: AppLocalization.of(context)!.translate('home')!,
        hideBackArrow: PlatFormServices.isMobile(context),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.notifications,
              size: DIMENSION_28,
            ),
            onPressed: () {},
          ),
          const SizedBox(
            width: DIMENSION_12,
          )
        ],
        onClick: () {
          //Navigator.of(context).pushNamed(route.settingScreen);
        },
      ),*/
        appBar: const Header(
          bgColor: primaryColor,
          iconColor: onPrimaryColor,
          textColor: onPrimaryColor,
          title: "Admin - Home",
        ),
        drawer: PlatFormServices.isDesktop(context)
            ? const AdminSideMenu(bgColor: onPrimaryColor, textColor: textColor)
            : const AdminSideMenu(
                bgColor: primaryColor, textColor: textDarkColor),
        body: SafeArea(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (PlatFormServices.isDesktop(context))
                Expanded(
                  child: PlatFormServices.isDesktop(context)
                      ? const AdminSideMenu(
                          bgColor: onPrimaryColor, textColor: textColor)
                      : const AdminSideMenu(
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
                                ? HomeMobileWidget(countData: state.countData)
                                : HomeWebWidget(countData: state.countData)
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
