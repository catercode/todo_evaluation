import 'package:auto_route/auto_route.dart';

class AuthGuard extends AutoRouteGuard {
  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) async {
    // the navigation is paused until resolver.next() is called with either
    // true to resume/continue navigation or false to abort navigation
    // final isLoggedIn = await getIt<IAuthFacade>().hasUserLoggedIn();
    // // ignore: prefer_typing_uninitialized_variables
    // var userType;
    // if (isLoggedIn) {
    //   userType = (await getIt<IAuthFacade>().getCurrentUser()).fold(
    //     (failure) => failure,
    //     (user) {
    //       userType = user.role.name.toString();
    //       [Role.PUBLIC.name].contains(userType)
    //           ? router.replace(const PublicRoute())
    //           : resolver.next();
    //       return null;
    //     },
    //   );
    // } else {
    //   router.replaceAll([const LoginRoute()]);
    // }
  }
}
