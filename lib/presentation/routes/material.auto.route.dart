import 'package:auto_route/auto_route.dart';
import 'package:my_todo_app/presentation/routes/auth_gard.dart';

import 'material.auto.route.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen,Route')
class AppRouter extends $AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          path: '/home',
          page: TodoHomeRoute.page,
        ),
        AutoRoute(
          path: '/login',
          page: LoginRoute.page,
          initial: true,
          guards: [AuthGuard()],
        ),
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
        AutoRoute(
          path: '/edit',
          page: EditTodoRoute.page,
        ),
      ];
}
