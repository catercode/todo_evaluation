import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:my_todo_app/infrastructure/auth.services.dart';
import 'package:my_todo_app/infrastructure/local.user.service.dart';
import 'package:my_todo_app/presentation/routes/material.auto.route.gr.dart';

class AuthGuard extends AutoRouteGuard {
  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) async {
    final isLoggedIn = await hasUserLogin();

    if (isLoggedIn == false) {
      resolver.next();
    } else if (isLoggedIn == true) {
      router.replace(const TodoHomeRoute());
    } else {
      resolver.next();
    }
  }
}
