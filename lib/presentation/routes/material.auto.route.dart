import 'package:auto_route/auto_route.dart';

import 'material.auto.route.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen,Route')
class AppRouter extends $AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          path: '/home',
          page: TodoHomeRoute.page,
          initial: true,
        ),
        AutoRoute(path: '/login', page: LoginRoute.page),
        AutoRoute(
          path: '/register',
          page: SignUpRoute.page,
        ),
        AutoRoute(
          path: '/add task',
          page: AddTodoRoute.page,
        ),
        AutoRoute(
          path: '/success',
          page: SuccessRoute.page,
        ),
      ];
}
