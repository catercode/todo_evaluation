import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:my_todo_app/application/auth/auth.state.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:my_todo_app/infrastructure/auth.services.dart';
import 'package:my_todo_app/infrastructure/local.user.service.dart';
import 'package:my_todo_app/infrastructure/model/localstorage.dart';

///Provider for managing the authentication state and functionality.
final authProvider =
    StateNotifierProvider<AuthNotifier, AuthState>((ref) => AuthNotifier());
final authService = AuthService();

class AuthNotifier extends StateNotifier<AuthState> {
  AuthNotifier() : super(const AuthState());

  Future<bool> signInWithEmailAndPassword(
      {required String email, required String password}) async {
    state = state.copyWith(isLoading: true);
    await authService.signInWithEmailAndPassword(email, password).then((user) {
      if (user == null) {
        state = state.copyWith(isLoading: false);
      } else {
        state = state.copyWith(
            isSuccess: true, isLoading: false, currentuser: user);
        islogin(userlogs: LoginData(loginStatus: state.isSuccess));
      }
    });
    return state.isSuccess;
  }

  Future<bool> registerWithEmailAndPassword(
      {required String email, required String password}) async {
    state = state.copyWith(isLoading: true);
    await authService
        .registerWithEmailAndPassword(email, password)
        .then((user) {
      if (user == null) {
        state = state.copyWith(isLoading: false);
      } else {
        state = state.copyWith(
            isSuccess: true, isLoading: false, currentuser: user);
      }
    });
    return state.isSuccess;
  }

  clearSuccess() {
    state = state.copyWith(islogingOut: false, isSuccess: false);
  }

  logout() async {
    state = state.copyWith(isLoading: true);
    islogin(userlogs: LoginData(loginStatus: false)).then((isloginOut) {
      if (isloginOut == true) {
        Future.delayed(
          const Duration(seconds: 6),
          () {
            state = state.copyWith(isLoading: false, islogingOut: true);
          },
        );
      } else {
        state = state.copyWith(isLoading: false, islogingOut: false);
      }
    });
  }
}
