import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:google_sign_in/google_sign_in.dart';

part 'auth.state.freezed.dart';

@freezed
class AuthState with _$AuthState {
  const factory AuthState({
    @Default(None()) Option authFailureOption,
    @Default(false) bool isLoading,
    @Default(false) bool isSuccess,
    @Default(false) bool islogingOut,
    @Default(null) User? currentuser,
  }) = _AuthState;
}
