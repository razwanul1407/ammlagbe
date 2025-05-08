import 'dart:async';

import 'package:ammlagbe/core/constants/app_themes.dart';
import 'package:ammlagbe/modules/auth/bloc/auth_bloc.dart';
import 'package:ammlagbe/modules/auth/views/sign_in_screen.dart';
import 'package:ammlagbe/modules/home/views/home_screen.dart';
import 'package:ammlagbe/modules/main_navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  StreamSubscription? _authSubscription;
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 3), () {
      if (mounted) {
        final authBloc = BlocProvider.of<AuthBloc>(context);
        authBloc.add(CheckAuthStatus());
      }

      // Listen to auth state changes
      final authBloc = BlocProvider.of<AuthBloc>(context);
      _authSubscription = authBloc.stream.listen((state) {
        if (mounted && (state is Authenticated || state is Unauthenticated)) {
          // Navigate without back button
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) {
                if (state is Authenticated) {
                  return const MainNavigation();
                } else {
                  return const SignInScreen();
                }
              },
            ),
          );
        }
      });
    });
  }

  @override
  void dispose() {
    // Cancel the stream subscription to avoid memory leaks
    _authSubscription?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appTheme.primaryColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.shopping_basket, size: 100, color: Colors.white),
            const SizedBox(height: 20),
            Text(
              'Amm Lagbe',
              style: appTheme.textTheme.headlineSmall?.copyWith(
                color: Colors.white,
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              'Your Mango Paradise',
              style: appTheme.textTheme.bodyMedium?.copyWith(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
