// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth.state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AuthState {
  Option<dynamic> get authFailureOption => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isSuccess => throw _privateConstructorUsedError;
  bool get islogingOut => throw _privateConstructorUsedError;
  User? get currentuser => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AuthStateCopyWith<AuthState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthStateCopyWith<$Res> {
  factory $AuthStateCopyWith(AuthState value, $Res Function(AuthState) then) =
      _$AuthStateCopyWithImpl<$Res, AuthState>;
  @useResult
  $Res call(
      {Option<dynamic> authFailureOption,
      bool isLoading,
      bool isSuccess,
      bool islogingOut,
      User? currentuser});
}

/// @nodoc
class _$AuthStateCopyWithImpl<$Res, $Val extends AuthState>
    implements $AuthStateCopyWith<$Res> {
  _$AuthStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? authFailureOption = null,
    Object? isLoading = null,
    Object? isSuccess = null,
    Object? islogingOut = null,
    Object? currentuser = freezed,
  }) {
    return _then(_value.copyWith(
      authFailureOption: null == authFailureOption
          ? _value.authFailureOption
          : authFailureOption // ignore: cast_nullable_to_non_nullable
              as Option<dynamic>,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isSuccess: null == isSuccess
          ? _value.isSuccess
          : isSuccess // ignore: cast_nullable_to_non_nullable
              as bool,
      islogingOut: null == islogingOut
          ? _value.islogingOut
          : islogingOut // ignore: cast_nullable_to_non_nullable
              as bool,
      currentuser: freezed == currentuser
          ? _value.currentuser
          : currentuser // ignore: cast_nullable_to_non_nullable
              as User?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AuthStateImplCopyWith<$Res>
    implements $AuthStateCopyWith<$Res> {
  factory _$$AuthStateImplCopyWith(
          _$AuthStateImpl value, $Res Function(_$AuthStateImpl) then) =
      __$$AuthStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Option<dynamic> authFailureOption,
      bool isLoading,
      bool isSuccess,
      bool islogingOut,
      User? currentuser});
}

/// @nodoc
class __$$AuthStateImplCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$AuthStateImpl>
    implements _$$AuthStateImplCopyWith<$Res> {
  __$$AuthStateImplCopyWithImpl(
      _$AuthStateImpl _value, $Res Function(_$AuthStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? authFailureOption = null,
    Object? isLoading = null,
    Object? isSuccess = null,
    Object? islogingOut = null,
    Object? currentuser = freezed,
  }) {
    return _then(_$AuthStateImpl(
      authFailureOption: null == authFailureOption
          ? _value.authFailureOption
          : authFailureOption // ignore: cast_nullable_to_non_nullable
              as Option<dynamic>,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isSuccess: null == isSuccess
          ? _value.isSuccess
          : isSuccess // ignore: cast_nullable_to_non_nullable
              as bool,
      islogingOut: null == islogingOut
          ? _value.islogingOut
          : islogingOut // ignore: cast_nullable_to_non_nullable
              as bool,
      currentuser: freezed == currentuser
          ? _value.currentuser
          : currentuser // ignore: cast_nullable_to_non_nullable
              as User?,
    ));
  }
}

/// @nodoc

class _$AuthStateImpl implements _AuthState {
  const _$AuthStateImpl(
      {this.authFailureOption = const None(),
      this.isLoading = false,
      this.isSuccess = false,
      this.islogingOut = false,
      this.currentuser = null});

  @override
  @JsonKey()
  final Option<dynamic> authFailureOption;
  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final bool isSuccess;
  @override
  @JsonKey()
  final bool islogingOut;
  @override
  @JsonKey()
  final User? currentuser;

  @override
  String toString() {
    return 'AuthState(authFailureOption: $authFailureOption, isLoading: $isLoading, isSuccess: $isSuccess, islogingOut: $islogingOut, currentuser: $currentuser)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthStateImpl &&
            (identical(other.authFailureOption, authFailureOption) ||
                other.authFailureOption == authFailureOption) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isSuccess, isSuccess) ||
                other.isSuccess == isSuccess) &&
            (identical(other.islogingOut, islogingOut) ||
                other.islogingOut == islogingOut) &&
            (identical(other.currentuser, currentuser) ||
                other.currentuser == currentuser));
  }

  @override
  int get hashCode => Object.hash(runtimeType, authFailureOption, isLoading,
      isSuccess, islogingOut, currentuser);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthStateImplCopyWith<_$AuthStateImpl> get copyWith =>
      __$$AuthStateImplCopyWithImpl<_$AuthStateImpl>(this, _$identity);
}

abstract class _AuthState implements AuthState {
  const factory _AuthState(
      {final Option<dynamic> authFailureOption,
      final bool isLoading,
      final bool isSuccess,
      final bool islogingOut,
      final User? currentuser}) = _$AuthStateImpl;

  @override
  Option<dynamic> get authFailureOption;
  @override
  bool get isLoading;
  @override
  bool get isSuccess;
  @override
  bool get islogingOut;
  @override
  User? get currentuser;
  @override
  @JsonKey(ignore: true)
  _$$AuthStateImplCopyWith<_$AuthStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
