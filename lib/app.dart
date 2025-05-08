import 'package:ammlagbe/core/constants/app_themes.dart';
import 'package:ammlagbe/core/services/auth_services.dart';
import 'package:ammlagbe/modules/auth/bloc/auth_bloc.dart';
import 'package:ammlagbe/modules/auth/views/change_password_screen.dart';
import 'package:ammlagbe/modules/auth/views/sign_in_screen.dart';
import 'package:ammlagbe/modules/auth/views/sign_up_screen.dart';
import 'package:ammlagbe/modules/main_navigation.dart';
import 'package:ammlagbe/modules/splash/views/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create:
              (context) =>
                  AuthBloc(authService: AuthService())..add(CheckAuthStatus()),
        ),
      ],
      child: MaterialApp(
        title: 'Amm Lagbe',
        theme: appTheme,
        home: const SplashScreen(),
        routes: {
          '/signup': (context) => const SignUpScreen(),
          '/change-password': (context) => const ChangePasswordScreen(),
        },
        onGenerateRoute: (settings) {
          // This handles all other routes
          return MaterialPageRoute(
            builder: (context) {
              final authState = context.read<AuthBloc>().state;

              if (authState is Authenticated) {
                return const MainNavigation();
              } else {
                return const SignInScreen();
              }
            },
          );
        },
      ),
    );
  }
}
