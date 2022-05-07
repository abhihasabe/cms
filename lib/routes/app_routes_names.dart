import 'package:cms/Screens/localization_screen/lang_screen.dart';
import 'package:cms/Screens/admin/employee/showemployee/employee_screen.dart';
import 'package:cms/Screens/authentication/login_screen.dart';
import 'package:cms/bloc_cubits/login_cubit/login_cubit.dart';
import 'package:cms/Screens/authentication/auth_screen.dart';
import 'package:cms/Screens/authentication/reg_screen.dart';
import 'package:cms/Screens/admin/home/home_screen.dart';
import 'package:cms/controllers/MenuController.dart';
import 'package:cms/repository/auth_repository.dart';
import 'package:cms/Screens/profile_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:provider/provider.dart';

const String inventoryHomeScreen = 'inventoryHome';
const String attendanceScreen = 'attendanceScreen';
const String addEmployeeScreen = 'addEmployee';
const String addCompanyScreen = 'addCompany';
const String adminCompanyScreen = 'company';
const String adminClientsScreen = 'clients';
const String inventoryScreen = 'inventory';
const String registerScreen = 'register';
const String employeeScreen = 'employee';
const String projectsScreen = 'projects';
const String chooseLangScreen = 'lang';
const String settingScreen = 'setting';
const String splashScreen = 'splash';
const String leaveScreen = 'leave';
const String loginScreen = 'login';
const String adminHomeScreen = 'home';
const String langScreen = 'lang';
const String initialScreen = '/';


//HR
const String hrEmployeeScreen = 'hremployee';
const String hrAddEmployeeScreen = 'hraddemployee';
const String hrCompanyScreen = 'hrcompany';
const String hrHomeScreen = 'hrHome';
