import 'package:cms/Screens/admin/home/home_screen.dart';
import 'package:cms/Screens/authentication/login_screen.dart';
import 'package:cms/bloc_cubits/auth_cubit/auth_cubit.dart';
import 'package:cms/bloc_cubits/auth_cubit/auth_state.dart';
import 'package:cms/controllers/MenuController.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cms/Screens/splash_screen.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(builder: (context, authState) {
      if (authState is AuthInitialState) {
        return const SplashScreen();
      } else if (authState is AuthLoginSuccess) {
        return ChangeNotifierProvider(
          create: (context) => MenuController(),
          child: const HomeScreen(),
        );
      } else if (authState is AuthLoginFailure) {
        return const LoginScreen();
      }
      return const SplashScreen();
    });
  }
}
