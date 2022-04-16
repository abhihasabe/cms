import 'package:cms/bloc_cubits/add_company_cubit/add_company_cubit.dart';
import 'package:cms/bloc_cubits/add_employee_cubit/add_employee_cubit.dart';
import 'package:cms/bloc_cubits/admin_home_cubit/admin_home_cubit.dart';
import 'package:cms/bloc_cubits/company_cubit/company_cubit.dart';
import 'package:cms/bloc_cubits/employee_cubit/employee_cubit.dart';
import 'package:cms/configure_web.dart';
import 'package:cms/repository/admin_home_repository.dart';
import 'package:cms/repository/company_repository.dart';
import 'package:cms/repository/emp_repository.dart';
import 'package:cms/storage/local/hive_helper.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:cms/bloc_cubits/login_cubit/login_cubit.dart';
import 'package:cms/bloc_cubits/theme_cubit/theme_cubit.dart';
import 'package:cms/bloc_cubits/theme_cubit/theme_state.dart';
import 'package:cms/bloc_cubits/auth_cubit/auth_cubit.dart';
import 'package:cms/bloc_cubits/reg_cubit/reg_cubit.dart';
import 'package:cms/localization/app_localization.dart';
import 'package:cms/repository/auth_repository.dart';
import 'package:cms/repository/lang_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:oktoast/oktoast.dart';
import 'package:provider/src/provider.dart';
import 'package:cms/routes/app_routes.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:cms/theme/app_theme.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await HiveBox.create();
  //configureApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OKToast(
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
              create: (context) => AddCompanyCubit(CompanyRepository())),
          BlocProvider(create: (context) => AddEmployeeCubit(EmpRepository())),
          BlocProvider(create: (context) => AdminCubit(AdminHomeRepository())),
          BlocProvider(create: (context) => CompanyCubit(CompanyRepository())),
          BlocProvider(create: (context) => EmployeeCubit(EmpRepository())),
          BlocProvider(create: (context) => ThemeCubit(LangRepository())),
          BlocProvider(create: (context) => LoginCubit(AuthRepository())),
          BlocProvider(create: (context) => RegCubit(AuthRepository())),
          BlocProvider(create: (context) => AuthCubit()..isSignedIn()),
        ],
        child: BlocBuilder<ThemeCubit, ThemeState>(
            buildWhen: (previousState, currentState) =>
                previousState != currentState,
            builder: (context, state) {
              return MaterialApp.router(
                title: 'Company Management System',
                debugShowCheckedModeBanner: false,
                theme: AppThemes.lightTheme,
                darkTheme: AppThemes.darkTheme,
                themeMode: context.select(
                    (ThemeCubit themeCubit) => themeCubit.state.themeMode),
                routeInformationParser: VxInformationParser(),
                routerDelegate: Routes.routerDelegate,
                locale: state.locale,
                localizationsDelegates: const [
                  AppLocalization.delegate,
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
                ],
                supportedLocales: const [
                  Locale('en', ''), // English, no country code
                  Locale('es', ''), // Spanish, no country code
                ],
                localeResolutionCallback: (locale, supportedLocales) {
                  for (var supportedLocale in supportedLocales) {
                    if (supportedLocale.languageCode == locale?.languageCode) {
                      return supportedLocale;
                    }
                  }
                  return supportedLocales.first;
                },
              );
            }),
      ),
    );
  }
}
