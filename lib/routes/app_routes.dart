import 'package:cms/Screens/admin/employee/addemployee/add_employee_screen.dart';
import 'package:cms/Screens/admin/employee/showemployee/employee_screen.dart';
import 'package:cms/Screens/admin/compnay/addcompany/add_company_screen.dart';
import 'package:cms/Screens/admin/compnay/showcompany/company_screen.dart';
import 'package:cms/Screens/hr/compnay/showcompany/hr_company_screen.dart';
import 'package:cms/Screens/Inventories/home/inventory_home_screen.dart';
import 'package:cms/Screens/admin/clients/admin_clients_screen.dart';
import 'package:cms/Screens/admin/inventory/inventory_screen.dart';
import 'package:cms/Screens/hr/employee/hraddemployee/hr_add_employee_screen.dart';
import 'package:cms/Screens/hr/employee/hrshowemployee/hr_employee_screen.dart';
import 'package:cms/Screens/localization_screen/lang_screen.dart';
import 'package:cms/Screens/admin/projects/projects_screen.dart';
import 'package:cms/bloc_cubits/login_cubit/login_cubit.dart';
import 'package:cms/Screens/authentication/login_screen.dart';
import 'package:cms/Screens/authentication/auth_screen.dart';
import 'package:cms/Screens/authentication/reg_screen.dart';
import 'package:cms/Screens/admin/leave/leave_screen.dart';
import 'package:cms/Screens/hr/home/hr_home_screen.dart';
import 'package:cms/Screens/admin/home/home_screen.dart';
import 'package:cms/controllers/MenuController.dart';
import 'package:cms/repository/auth_repository.dart';
import 'package:cms/Screens/profile_screen.dart';
import 'package:cms/routes/app_routes_names.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:provider/provider.dart';

class Routes {
  static VxNavigator routerDelegate = VxNavigator(routes: {
    initialScreen: (uri, params) {
      return VxRoutePage(pageName: "auth", child: const AuthScreen());
    },
    loginScreen: (uri, params) {
      return VxRoutePage(pageName: "login", child: const LoginScreen());
    },
    registerScreen: (uri, params) {
      return VxRoutePage(pageName: "reg", child: const RegScreen());
    },
    employeeScreen: (uri, params) {
      return VxRoutePage(
          pageName: "Employee",
          child: ChangeNotifierProvider(
              create: (context) => MenuController(),
              child: const EmployeeScreen()));
    },
    addEmployeeScreen: (uri, params) {
      return VxRoutePage(
          pageName: "Employee Registration",
          child: ChangeNotifierProvider(
              create: (context) => MenuController(),
              child: const AddEmployee()));
    },
    chooseLangScreen: (uri, params) {
      return VxRoutePage(pageName: "Languages", child: const LangScreen());
    },
    settingScreen: (uri, params) {
      return VxRoutePage(
          pageName: "Auth",
          child: BlocProvider<LoginCubit>(
              create: (context) => LoginCubit(AuthRepository()),
              child: const ProfileScreen()));
    },
    adminHomeScreen: (uri, params) {
      return VxRoutePage(
          pageName: "Admin Home",
          child: ChangeNotifierProvider(
              create: (context) => MenuController(),
              child: const HomeScreen()));
    },
    inventoryHomeScreen: (uri, params) {
      return VxRoutePage(
          pageName: "Inventory Home",
          child: ChangeNotifierProvider(
              create: (context) => MenuController(),
              child: const InventoryHomeScreen()));
    },
    attendanceScreen: (uri, params) {
      return VxRoutePage(
          pageName: "Inventory Home",
          child: ChangeNotifierProvider(
              create: (context) => MenuController(),
              child: const InventoryHomeScreen()));
    },
    leaveScreen: (uri, params) {
      return VxRoutePage(
          pageName: "leave",
          child: ChangeNotifierProvider(
              create: (context) => MenuController(),
              child: const LeaveScreen()));
    },
    inventoryScreen: (uri, params) {
      return VxRoutePage(
          pageName: "inventory",
          child: ChangeNotifierProvider(
              create: (context) => MenuController(),
              child: const InventoryScreen()));
    },
    projectsScreen: (uri, params) {
      return VxRoutePage(
          pageName: "projects",
          child: ChangeNotifierProvider(
              create: (context) => MenuController(),
              child: const ProjectsScreen()));
    },
    adminClientsScreen: (uri, params) {
      return VxRoutePage(
          pageName: "Admin Clients",
          child: ChangeNotifierProvider(
              create: (context) => MenuController(),
              child: const AdminClientsScreen()));
    },
    adminCompanyScreen: (uri, params) {
      return VxRoutePage(
          pageName: "company",
          child: ChangeNotifierProvider(
              create: (context) => MenuController(),
              child: const CompanyScreen()));
    },
    addCompanyScreen: (uri, params) {
      return VxRoutePage(
          pageName: "add company",
          child: ChangeNotifierProvider(
              create: (context) => MenuController(),
              child: const AddCompany()));
    },
    langScreen: (uri, params) {
      return VxRoutePage(
          pageName: "lang",
          child: ChangeNotifierProvider(
              create: (context) => MenuController(),
              child: const LangScreen()));
    },

    //HR

    hrHomeScreen: (uri, params) {
      return VxRoutePage(
          pageName: "HR Home",
          child: ChangeNotifierProvider(
              create: (context) => MenuController(),
              child: const HRHomeScreen()));
    },

    hrCompanyScreen: (uri, params) {
      return VxRoutePage(
          pageName: "HR Company",
          child: ChangeNotifierProvider(
              create: (context) => MenuController(),
              child: const HRCompanyScreen()));
    },

    hrEmployeeScreen: (uri, params) {
      return VxRoutePage(
          pageName: "HR Employee",
          child: ChangeNotifierProvider(
              create: (context) => MenuController(),
              child: const HREmployeeScreen()));
    },
    hrAddEmployeeScreen: (uri, params) {
      return VxRoutePage(
          pageName: "HR Employee",
          child: ChangeNotifierProvider(
              create: (context) => MenuController(),
              child: const HRAddEmployee()));
    },
  });
}
