import 'package:firetest/auth/auth_controller.dart';
import 'package:firetest/router/router_refresh.dart';
import 'package:go_router/go_router.dart';
import 'package:firetest/widgets/home/home.dart';
import 'package:firetest/widgets/login/login.dart';
import 'package:firetest/widgets/register/register.dart';
import 'package:firetest/widgets/account_page/account_page.dart';
import 'package:firetest/widgets/test/test_page.dart';
import 'package:flutter/material.dart';

class AppRouter {
  final AuthController _authController;

  AppRouter(this._authController);

  final publicPages = <String>{'/', '/login', '/register'};

  final loadingPages = <String>{'/splash'};

  final authedPages = <String>{'/account'};

  late final GoRouter router = GoRouter(
    refreshListenable: RouterRefresh(_authController.userChanges),
    redirect: (context, state) {
      if (_authController.isLoading) {
        return state.matchedLocation == '/splash' ? null : '/splash';
      }
      final isLoggedIn = _authController.currentUser != null;

      if (isLoggedIn) return checkAuthStatus(state.matchedLocation);
      if (!isLoggedIn) return checkPublicStatus(state.matchedLocation);

      return "/testpage";
    },
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) {
          return const Home();
        },
      ),
      GoRoute(
        path: '/login',
        builder: (context, state) {
          return const Login();
        },
      ),
      GoRoute(
        path: '/register',
        builder: (context, state) {
          return const Register();
        },
      ),
      GoRoute(
        path: '/account',
        builder: (context, state) {
          return const AccountPage();
        },
      ),
      GoRoute(
        path: '/testpage',
        builder: (context, state) {
          return const TestPage();
        },
      ),
      GoRoute(
        path: '/splash',
        builder: (context, state) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        },
      ),
    ],
  );

  String? checkAuthStatus(String path) {
    if (!authedPages.contains(path)) return '/';
    return null;
  }

  String? checkPublicStatus(String path) {
    if (!publicPages.contains(path)) return '/account';
    return null;
  }
}
