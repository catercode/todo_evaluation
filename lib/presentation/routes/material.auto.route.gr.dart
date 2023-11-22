// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i7;
import 'package:flutter/material.dart' as _i9;
import 'package:my_todo_app/infrastructure/model/todo.model.dart' as _i8;
import 'package:my_todo_app/presentation/auth/login.screen.dart' as _i3;
import 'package:my_todo_app/presentation/auth/register.screen.dart' as _i4;
import 'package:my_todo_app/presentation/home/home.screen.dart' as _i6;
import 'package:my_todo_app/presentation/home/success.screen.dart' as _i5;
import 'package:my_todo_app/presentation/todo/addTodo.Screen.dart' as _i1;
import 'package:my_todo_app/presentation/todo/editTodo.Screen.dart' as _i2;

abstract class $AppRouter extends _i7.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i7.PageFactory> pagesMap = {
    AddTodoRoute.name: (routeData) {
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.AddTodoScreen(),
      );
    },
    EditTodoRoute.name: (routeData) {
      final args = routeData.argsAs<EditTodoRouteArgs>();
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i2.EditTodoScreen(
          todo: args.todo,
          key: args.key,
        ),
      );
    },
    LoginRoute.name: (routeData) {
      final args = routeData.argsAs<LoginRouteArgs>(
          orElse: () => const LoginRouteArgs());
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i3.LoginScreen(key: args.key),
      );
    },
    SignUpRoute.name: (routeData) {
      final args = routeData.argsAs<SignUpRouteArgs>(
          orElse: () => const SignUpRouteArgs());
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i4.SignUpScreen(key: args.key),
      );
    },
    SuccessRoute.name: (routeData) {
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.SuccessScreen(),
      );
    },
    TodoHomeRoute.name: (routeData) {
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i6.TodoHomeScreen(),
      );
    },
  };
}

/// generated route for
/// [_i1.AddTodoScreen]
class AddTodoRoute extends _i7.PageRouteInfo<void> {
  const AddTodoRoute({List<_i7.PageRouteInfo>? children})
      : super(
          AddTodoRoute.name,
          initialChildren: children,
        );

  static const String name = 'AddTodoRoute';

  static const _i7.PageInfo<void> page = _i7.PageInfo<void>(name);
}

/// generated route for
/// [_i2.EditTodoScreen]
class EditTodoRoute extends _i7.PageRouteInfo<EditTodoRouteArgs> {
  EditTodoRoute({
    required _i8.TodoModel todo,
    _i9.Key? key,
    List<_i7.PageRouteInfo>? children,
  }) : super(
          EditTodoRoute.name,
          args: EditTodoRouteArgs(
            todo: todo,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'EditTodoRoute';

  static const _i7.PageInfo<EditTodoRouteArgs> page =
      _i7.PageInfo<EditTodoRouteArgs>(name);
}

class EditTodoRouteArgs {
  const EditTodoRouteArgs({
    required this.todo,
    this.key,
  });

  final _i8.TodoModel todo;

  final _i9.Key? key;

  @override
  String toString() {
    return 'EditTodoRouteArgs{todo: $todo, key: $key}';
  }
}

/// generated route for
/// [_i3.LoginScreen]
class LoginRoute extends _i7.PageRouteInfo<LoginRouteArgs> {
  LoginRoute({
    _i9.Key? key,
    List<_i7.PageRouteInfo>? children,
  }) : super(
          LoginRoute.name,
          args: LoginRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static const _i7.PageInfo<LoginRouteArgs> page =
      _i7.PageInfo<LoginRouteArgs>(name);
}

class LoginRouteArgs {
  const LoginRouteArgs({this.key});

  final _i9.Key? key;

  @override
  String toString() {
    return 'LoginRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i4.SignUpScreen]
class SignUpRoute extends _i7.PageRouteInfo<SignUpRouteArgs> {
  SignUpRoute({
    _i9.Key? key,
    List<_i7.PageRouteInfo>? children,
  }) : super(
          SignUpRoute.name,
          args: SignUpRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'SignUpRoute';

  static const _i7.PageInfo<SignUpRouteArgs> page =
      _i7.PageInfo<SignUpRouteArgs>(name);
}

class SignUpRouteArgs {
  const SignUpRouteArgs({this.key});

  final _i9.Key? key;

  @override
  String toString() {
    return 'SignUpRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i5.SuccessScreen]
class SuccessRoute extends _i7.PageRouteInfo<void> {
  const SuccessRoute({List<_i7.PageRouteInfo>? children})
      : super(
          SuccessRoute.name,
          initialChildren: children,
        );

  static const String name = 'SuccessRoute';

  static const _i7.PageInfo<void> page = _i7.PageInfo<void>(name);
}

/// generated route for
/// [_i6.TodoHomeScreen]
class TodoHomeRoute extends _i7.PageRouteInfo<void> {
  const TodoHomeRoute({List<_i7.PageRouteInfo>? children})
      : super(
          TodoHomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'TodoHomeRoute';

  static const _i7.PageInfo<void> page = _i7.PageInfo<void>(name);
}
