// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'todo.state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$TodoState {
  Option<dynamic> get authFailureOption => throw _privateConstructorUsedError;
  AsyncValue<List<TodoModel>> get todo => throw _privateConstructorUsedError;
  List<TodoModel> get filteredTodo => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isSuccess => throw _privateConstructorUsedError;
  bool get iscompleted => throw _privateConstructorUsedError;
  bool get isDeleted => throw _privateConstructorUsedError;
  TodoModel? get selectedTodo => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TodoStateCopyWith<TodoState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TodoStateCopyWith<$Res> {
  factory $TodoStateCopyWith(TodoState value, $Res Function(TodoState) then) =
      _$TodoStateCopyWithImpl<$Res, TodoState>;
  @useResult
  $Res call(
      {Option<dynamic> authFailureOption,
      AsyncValue<List<TodoModel>> todo,
      List<TodoModel> filteredTodo,
      bool isLoading,
      bool isSuccess,
      bool iscompleted,
      bool isDeleted,
      TodoModel? selectedTodo});

  $TodoModelCopyWith<$Res>? get selectedTodo;
}

/// @nodoc
class _$TodoStateCopyWithImpl<$Res, $Val extends TodoState>
    implements $TodoStateCopyWith<$Res> {
  _$TodoStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? authFailureOption = null,
    Object? todo = null,
    Object? filteredTodo = null,
    Object? isLoading = null,
    Object? isSuccess = null,
    Object? iscompleted = null,
    Object? isDeleted = null,
    Object? selectedTodo = freezed,
  }) {
    return _then(_value.copyWith(
      authFailureOption: null == authFailureOption
          ? _value.authFailureOption
          : authFailureOption // ignore: cast_nullable_to_non_nullable
              as Option<dynamic>,
      todo: null == todo
          ? _value.todo
          : todo // ignore: cast_nullable_to_non_nullable
              as AsyncValue<List<TodoModel>>,
      filteredTodo: null == filteredTodo
          ? _value.filteredTodo
          : filteredTodo // ignore: cast_nullable_to_non_nullable
              as List<TodoModel>,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isSuccess: null == isSuccess
          ? _value.isSuccess
          : isSuccess // ignore: cast_nullable_to_non_nullable
              as bool,
      iscompleted: null == iscompleted
          ? _value.iscompleted
          : iscompleted // ignore: cast_nullable_to_non_nullable
              as bool,
      isDeleted: null == isDeleted
          ? _value.isDeleted
          : isDeleted // ignore: cast_nullable_to_non_nullable
              as bool,
      selectedTodo: freezed == selectedTodo
          ? _value.selectedTodo
          : selectedTodo // ignore: cast_nullable_to_non_nullable
              as TodoModel?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $TodoModelCopyWith<$Res>? get selectedTodo {
    if (_value.selectedTodo == null) {
      return null;
    }

    return $TodoModelCopyWith<$Res>(_value.selectedTodo!, (value) {
      return _then(_value.copyWith(selectedTodo: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$TodoStateImplCopyWith<$Res>
    implements $TodoStateCopyWith<$Res> {
  factory _$$TodoStateImplCopyWith(
          _$TodoStateImpl value, $Res Function(_$TodoStateImpl) then) =
      __$$TodoStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Option<dynamic> authFailureOption,
      AsyncValue<List<TodoModel>> todo,
      List<TodoModel> filteredTodo,
      bool isLoading,
      bool isSuccess,
      bool iscompleted,
      bool isDeleted,
      TodoModel? selectedTodo});

  @override
  $TodoModelCopyWith<$Res>? get selectedTodo;
}

/// @nodoc
class __$$TodoStateImplCopyWithImpl<$Res>
    extends _$TodoStateCopyWithImpl<$Res, _$TodoStateImpl>
    implements _$$TodoStateImplCopyWith<$Res> {
  __$$TodoStateImplCopyWithImpl(
      _$TodoStateImpl _value, $Res Function(_$TodoStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? authFailureOption = null,
    Object? todo = null,
    Object? filteredTodo = null,
    Object? isLoading = null,
    Object? isSuccess = null,
    Object? iscompleted = null,
    Object? isDeleted = null,
    Object? selectedTodo = freezed,
  }) {
    return _then(_$TodoStateImpl(
      authFailureOption: null == authFailureOption
          ? _value.authFailureOption
          : authFailureOption // ignore: cast_nullable_to_non_nullable
              as Option<dynamic>,
      todo: null == todo
          ? _value.todo
          : todo // ignore: cast_nullable_to_non_nullable
              as AsyncValue<List<TodoModel>>,
      filteredTodo: null == filteredTodo
          ? _value._filteredTodo
          : filteredTodo // ignore: cast_nullable_to_non_nullable
              as List<TodoModel>,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isSuccess: null == isSuccess
          ? _value.isSuccess
          : isSuccess // ignore: cast_nullable_to_non_nullable
              as bool,
      iscompleted: null == iscompleted
          ? _value.iscompleted
          : iscompleted // ignore: cast_nullable_to_non_nullable
              as bool,
      isDeleted: null == isDeleted
          ? _value.isDeleted
          : isDeleted // ignore: cast_nullable_to_non_nullable
              as bool,
      selectedTodo: freezed == selectedTodo
          ? _value.selectedTodo
          : selectedTodo // ignore: cast_nullable_to_non_nullable
              as TodoModel?,
    ));
  }
}

/// @nodoc

class _$TodoStateImpl implements _TodoState {
  const _$TodoStateImpl(
      {this.authFailureOption = const None(),
      this.todo = const AsyncData([]),
      final List<TodoModel> filteredTodo = const [],
      this.isLoading = false,
      this.isSuccess = false,
      this.iscompleted = false,
      this.isDeleted = false,
      this.selectedTodo = null})
      : _filteredTodo = filteredTodo;

  @override
  @JsonKey()
  final Option<dynamic> authFailureOption;
  @override
  @JsonKey()
  final AsyncValue<List<TodoModel>> todo;
  final List<TodoModel> _filteredTodo;
  @override
  @JsonKey()
  List<TodoModel> get filteredTodo {
    if (_filteredTodo is EqualUnmodifiableListView) return _filteredTodo;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_filteredTodo);
  }

  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final bool isSuccess;
  @override
  @JsonKey()
  final bool iscompleted;
  @override
  @JsonKey()
  final bool isDeleted;
  @override
  @JsonKey()
  final TodoModel? selectedTodo;

  @override
  String toString() {
    return 'TodoState(authFailureOption: $authFailureOption, todo: $todo, filteredTodo: $filteredTodo, isLoading: $isLoading, isSuccess: $isSuccess, iscompleted: $iscompleted, isDeleted: $isDeleted, selectedTodo: $selectedTodo)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TodoStateImpl &&
            (identical(other.authFailureOption, authFailureOption) ||
                other.authFailureOption == authFailureOption) &&
            (identical(other.todo, todo) || other.todo == todo) &&
            const DeepCollectionEquality()
                .equals(other._filteredTodo, _filteredTodo) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isSuccess, isSuccess) ||
                other.isSuccess == isSuccess) &&
            (identical(other.iscompleted, iscompleted) ||
                other.iscompleted == iscompleted) &&
            (identical(other.isDeleted, isDeleted) ||
                other.isDeleted == isDeleted) &&
            (identical(other.selectedTodo, selectedTodo) ||
                other.selectedTodo == selectedTodo));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      authFailureOption,
      todo,
      const DeepCollectionEquality().hash(_filteredTodo),
      isLoading,
      isSuccess,
      iscompleted,
      isDeleted,
      selectedTodo);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TodoStateImplCopyWith<_$TodoStateImpl> get copyWith =>
      __$$TodoStateImplCopyWithImpl<_$TodoStateImpl>(this, _$identity);
}

abstract class _TodoState implements TodoState {
  const factory _TodoState(
      {final Option<dynamic> authFailureOption,
      final AsyncValue<List<TodoModel>> todo,
      final List<TodoModel> filteredTodo,
      final bool isLoading,
      final bool isSuccess,
      final bool iscompleted,
      final bool isDeleted,
      final TodoModel? selectedTodo}) = _$TodoStateImpl;

  @override
  Option<dynamic> get authFailureOption;
  @override
  AsyncValue<List<TodoModel>> get todo;
  @override
  List<TodoModel> get filteredTodo;
  @override
  bool get isLoading;
  @override
  bool get isSuccess;
  @override
  bool get iscompleted;
  @override
  bool get isDeleted;
  @override
  TodoModel? get selectedTodo;
  @override
  @JsonKey(ignore: true)
  _$$TodoStateImplCopyWith<_$TodoStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
