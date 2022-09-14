// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'comment_list_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$CommentListStateTearOff {
  const _$CommentListStateTearOff();

  CommentListStateData call(List<CommentListModel> commentLists) {
    return CommentListStateData(
      commentLists,
    );
  }

  CommentListStateLoading loading() {
    return const CommentListStateLoading();
  }

  CommentListStateError error(dynamic error) {
    return CommentListStateError(
      error,
    );
  }
}

/// @nodoc
const $CommentListState = _$CommentListStateTearOff();

/// @nodoc
mixin _$CommentListState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(List<CommentListModel> commentLists) $default, {
    required TResult Function() loading,
    required TResult Function(dynamic error) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult Function(List<CommentListModel> commentLists)? $default, {
    TResult Function()? loading,
    TResult Function(dynamic error)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(List<CommentListModel> commentLists)? $default, {
    TResult Function()? loading,
    TResult Function(dynamic error)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(CommentListStateData value) $default, {
    required TResult Function(CommentListStateLoading value) loading,
    required TResult Function(CommentListStateError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult Function(CommentListStateData value)? $default, {
    TResult Function(CommentListStateLoading value)? loading,
    TResult Function(CommentListStateError value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(CommentListStateData value)? $default, {
    TResult Function(CommentListStateLoading value)? loading,
    TResult Function(CommentListStateError value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CommentListStateCopyWith<$Res> {
  factory $CommentListStateCopyWith(
          CommentListState value, $Res Function(CommentListState) then) =
      _$CommentListStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$CommentListStateCopyWithImpl<$Res>
    implements $CommentListStateCopyWith<$Res> {
  _$CommentListStateCopyWithImpl(this._value, this._then);

  final CommentListState _value;
  // ignore: unused_field
  final $Res Function(CommentListState) _then;
}

/// @nodoc
abstract class $CommentListStateDataCopyWith<$Res> {
  factory $CommentListStateDataCopyWith(CommentListStateData value,
          $Res Function(CommentListStateData) then) =
      _$CommentListStateDataCopyWithImpl<$Res>;
  $Res call({List<CommentListModel> commentLists});
}

/// @nodoc
class _$CommentListStateDataCopyWithImpl<$Res>
    extends _$CommentListStateCopyWithImpl<$Res>
    implements $CommentListStateDataCopyWith<$Res> {
  _$CommentListStateDataCopyWithImpl(
      CommentListStateData _value, $Res Function(CommentListStateData) _then)
      : super(_value, (v) => _then(v as CommentListStateData));

  @override
  CommentListStateData get _value => super._value as CommentListStateData;

  @override
  $Res call({
    Object? commentLists = freezed,
  }) {
    return _then(CommentListStateData(
      commentLists == freezed
          ? _value.commentLists
          : commentLists // ignore: cast_nullable_to_non_nullable
              as List<CommentListModel>,
    ));
  }
}

/// @nodoc

class _$CommentListStateData implements CommentListStateData {
  const _$CommentListStateData(this.commentLists);

  @override
  final List<CommentListModel> commentLists;

  @override
  String toString() {
    return 'CommentListState(commentLists: $commentLists)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is CommentListStateData &&
            (identical(other.commentLists, commentLists) ||
                const DeepCollectionEquality()
                    .equals(other.commentLists, commentLists)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(commentLists);

  @JsonKey(ignore: true)
  @override
  $CommentListStateDataCopyWith<CommentListStateData> get copyWith =>
      _$CommentListStateDataCopyWithImpl<CommentListStateData>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(List<CommentListModel> commentLists) $default, {
    required TResult Function() loading,
    required TResult Function(dynamic error) error,
  }) {
    return $default(commentLists);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult Function(List<CommentListModel> commentLists)? $default, {
    TResult Function()? loading,
    TResult Function(dynamic error)? error,
  }) {
    return $default?.call(commentLists);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(List<CommentListModel> commentLists)? $default, {
    TResult Function()? loading,
    TResult Function(dynamic error)? error,
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(commentLists);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(CommentListStateData value) $default, {
    required TResult Function(CommentListStateLoading value) loading,
    required TResult Function(CommentListStateError value) error,
  }) {
    return $default(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult Function(CommentListStateData value)? $default, {
    TResult Function(CommentListStateLoading value)? loading,
    TResult Function(CommentListStateError value)? error,
  }) {
    return $default?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(CommentListStateData value)? $default, {
    TResult Function(CommentListStateLoading value)? loading,
    TResult Function(CommentListStateError value)? error,
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(this);
    }
    return orElse();
  }
}

abstract class CommentListStateData implements CommentListState {
  const factory CommentListStateData(List<CommentListModel> commentLists) =
      _$CommentListStateData;

  List<CommentListModel> get commentLists => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CommentListStateDataCopyWith<CommentListStateData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CommentListStateLoadingCopyWith<$Res> {
  factory $CommentListStateLoadingCopyWith(CommentListStateLoading value,
          $Res Function(CommentListStateLoading) then) =
      _$CommentListStateLoadingCopyWithImpl<$Res>;
}

/// @nodoc
class _$CommentListStateLoadingCopyWithImpl<$Res>
    extends _$CommentListStateCopyWithImpl<$Res>
    implements $CommentListStateLoadingCopyWith<$Res> {
  _$CommentListStateLoadingCopyWithImpl(CommentListStateLoading _value,
      $Res Function(CommentListStateLoading) _then)
      : super(_value, (v) => _then(v as CommentListStateLoading));

  @override
  CommentListStateLoading get _value => super._value as CommentListStateLoading;
}

/// @nodoc

class _$CommentListStateLoading implements CommentListStateLoading {
  const _$CommentListStateLoading();

  @override
  String toString() {
    return 'CommentListState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is CommentListStateLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(List<CommentListModel> commentLists) $default, {
    required TResult Function() loading,
    required TResult Function(dynamic error) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult Function(List<CommentListModel> commentLists)? $default, {
    TResult Function()? loading,
    TResult Function(dynamic error)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(List<CommentListModel> commentLists)? $default, {
    TResult Function()? loading,
    TResult Function(dynamic error)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(CommentListStateData value) $default, {
    required TResult Function(CommentListStateLoading value) loading,
    required TResult Function(CommentListStateError value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult Function(CommentListStateData value)? $default, {
    TResult Function(CommentListStateLoading value)? loading,
    TResult Function(CommentListStateError value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(CommentListStateData value)? $default, {
    TResult Function(CommentListStateLoading value)? loading,
    TResult Function(CommentListStateError value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class CommentListStateLoading implements CommentListState {
  const factory CommentListStateLoading() = _$CommentListStateLoading;
}

/// @nodoc
abstract class $CommentListStateErrorCopyWith<$Res> {
  factory $CommentListStateErrorCopyWith(CommentListStateError value,
          $Res Function(CommentListStateError) then) =
      _$CommentListStateErrorCopyWithImpl<$Res>;
  $Res call({dynamic error});
}

/// @nodoc
class _$CommentListStateErrorCopyWithImpl<$Res>
    extends _$CommentListStateCopyWithImpl<$Res>
    implements $CommentListStateErrorCopyWith<$Res> {
  _$CommentListStateErrorCopyWithImpl(
      CommentListStateError _value, $Res Function(CommentListStateError) _then)
      : super(_value, (v) => _then(v as CommentListStateError));

  @override
  CommentListStateError get _value => super._value as CommentListStateError;

  @override
  $Res call({
    Object? error = freezed,
  }) {
    return _then(CommentListStateError(
      error == freezed
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc

class _$CommentListStateError implements CommentListStateError {
  const _$CommentListStateError(this.error);

  @override
  final dynamic error;

  @override
  String toString() {
    return 'CommentListState.error(error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is CommentListStateError &&
            (identical(other.error, error) ||
                const DeepCollectionEquality().equals(other.error, error)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(error);

  @JsonKey(ignore: true)
  @override
  $CommentListStateErrorCopyWith<CommentListStateError> get copyWith =>
      _$CommentListStateErrorCopyWithImpl<CommentListStateError>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(List<CommentListModel> commentLists) $default, {
    required TResult Function() loading,
    required TResult Function(dynamic error) error,
  }) {
    return error(this.error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult Function(List<CommentListModel> commentLists)? $default, {
    TResult Function()? loading,
    TResult Function(dynamic error)? error,
  }) {
    return error?.call(this.error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(List<CommentListModel> commentLists)? $default, {
    TResult Function()? loading,
    TResult Function(dynamic error)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this.error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(CommentListStateData value) $default, {
    required TResult Function(CommentListStateLoading value) loading,
    required TResult Function(CommentListStateError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult Function(CommentListStateData value)? $default, {
    TResult Function(CommentListStateLoading value)? loading,
    TResult Function(CommentListStateError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(CommentListStateData value)? $default, {
    TResult Function(CommentListStateLoading value)? loading,
    TResult Function(CommentListStateError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class CommentListStateError implements CommentListState {
  const factory CommentListStateError(dynamic error) = _$CommentListStateError;

  dynamic get error => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CommentListStateErrorCopyWith<CommentListStateError> get copyWith =>
      throw _privateConstructorUsedError;
}
