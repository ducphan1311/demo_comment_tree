// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'comment_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$CommentStateTearOff {
  const _$CommentStateTearOff();

  CommentStateData call(List<CommentModel> comments) {
    return CommentStateData(
      comments,
    );
  }

  CommentStateLoading loading() {
    return const CommentStateLoading();
  }

  CommentStateError error(dynamic error) {
    return CommentStateError(
      error,
    );
  }
}

/// @nodoc
const $CommentState = _$CommentStateTearOff();

/// @nodoc
mixin _$CommentState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(List<CommentModel> comments) $default, {
    required TResult Function() loading,
    required TResult Function(dynamic error) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult Function(List<CommentModel> comments)? $default, {
    TResult Function()? loading,
    TResult Function(dynamic error)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(List<CommentModel> comments)? $default, {
    TResult Function()? loading,
    TResult Function(dynamic error)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(CommentStateData value) $default, {
    required TResult Function(CommentStateLoading value) loading,
    required TResult Function(CommentStateError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult Function(CommentStateData value)? $default, {
    TResult Function(CommentStateLoading value)? loading,
    TResult Function(CommentStateError value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(CommentStateData value)? $default, {
    TResult Function(CommentStateLoading value)? loading,
    TResult Function(CommentStateError value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CommentStateCopyWith<$Res> {
  factory $CommentStateCopyWith(
          CommentState value, $Res Function(CommentState) then) =
      _$CommentStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$CommentStateCopyWithImpl<$Res> implements $CommentStateCopyWith<$Res> {
  _$CommentStateCopyWithImpl(this._value, this._then);

  final CommentState _value;
  // ignore: unused_field
  final $Res Function(CommentState) _then;
}

/// @nodoc
abstract class $CommentStateDataCopyWith<$Res> {
  factory $CommentStateDataCopyWith(
          CommentStateData value, $Res Function(CommentStateData) then) =
      _$CommentStateDataCopyWithImpl<$Res>;
  $Res call({List<CommentModel> comments});
}

/// @nodoc
class _$CommentStateDataCopyWithImpl<$Res>
    extends _$CommentStateCopyWithImpl<$Res>
    implements $CommentStateDataCopyWith<$Res> {
  _$CommentStateDataCopyWithImpl(
      CommentStateData _value, $Res Function(CommentStateData) _then)
      : super(_value, (v) => _then(v as CommentStateData));

  @override
  CommentStateData get _value => super._value as CommentStateData;

  @override
  $Res call({
    Object? comments = freezed,
  }) {
    return _then(CommentStateData(
      comments == freezed
          ? _value.comments
          : comments // ignore: cast_nullable_to_non_nullable
              as List<CommentModel>,
    ));
  }
}

/// @nodoc

class _$CommentStateData implements CommentStateData {
  const _$CommentStateData(this.comments);

  @override
  final List<CommentModel> comments;

  @override
  String toString() {
    return 'CommentState(comments: $comments)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is CommentStateData &&
            (identical(other.comments, comments) ||
                const DeepCollectionEquality()
                    .equals(other.comments, comments)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(comments);

  @JsonKey(ignore: true)
  @override
  $CommentStateDataCopyWith<CommentStateData> get copyWith =>
      _$CommentStateDataCopyWithImpl<CommentStateData>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(List<CommentModel> comments) $default, {
    required TResult Function() loading,
    required TResult Function(dynamic error) error,
  }) {
    return $default(comments);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult Function(List<CommentModel> comments)? $default, {
    TResult Function()? loading,
    TResult Function(dynamic error)? error,
  }) {
    return $default?.call(comments);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(List<CommentModel> comments)? $default, {
    TResult Function()? loading,
    TResult Function(dynamic error)? error,
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(comments);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(CommentStateData value) $default, {
    required TResult Function(CommentStateLoading value) loading,
    required TResult Function(CommentStateError value) error,
  }) {
    return $default(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult Function(CommentStateData value)? $default, {
    TResult Function(CommentStateLoading value)? loading,
    TResult Function(CommentStateError value)? error,
  }) {
    return $default?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(CommentStateData value)? $default, {
    TResult Function(CommentStateLoading value)? loading,
    TResult Function(CommentStateError value)? error,
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(this);
    }
    return orElse();
  }
}

abstract class CommentStateData implements CommentState {
  const factory CommentStateData(List<CommentModel> comments) =
      _$CommentStateData;

  List<CommentModel> get comments => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CommentStateDataCopyWith<CommentStateData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CommentStateLoadingCopyWith<$Res> {
  factory $CommentStateLoadingCopyWith(
          CommentStateLoading value, $Res Function(CommentStateLoading) then) =
      _$CommentStateLoadingCopyWithImpl<$Res>;
}

/// @nodoc
class _$CommentStateLoadingCopyWithImpl<$Res>
    extends _$CommentStateCopyWithImpl<$Res>
    implements $CommentStateLoadingCopyWith<$Res> {
  _$CommentStateLoadingCopyWithImpl(
      CommentStateLoading _value, $Res Function(CommentStateLoading) _then)
      : super(_value, (v) => _then(v as CommentStateLoading));

  @override
  CommentStateLoading get _value => super._value as CommentStateLoading;
}

/// @nodoc

class _$CommentStateLoading implements CommentStateLoading {
  const _$CommentStateLoading();

  @override
  String toString() {
    return 'CommentState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is CommentStateLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(List<CommentModel> comments) $default, {
    required TResult Function() loading,
    required TResult Function(dynamic error) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult Function(List<CommentModel> comments)? $default, {
    TResult Function()? loading,
    TResult Function(dynamic error)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(List<CommentModel> comments)? $default, {
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
    TResult Function(CommentStateData value) $default, {
    required TResult Function(CommentStateLoading value) loading,
    required TResult Function(CommentStateError value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult Function(CommentStateData value)? $default, {
    TResult Function(CommentStateLoading value)? loading,
    TResult Function(CommentStateError value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(CommentStateData value)? $default, {
    TResult Function(CommentStateLoading value)? loading,
    TResult Function(CommentStateError value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class CommentStateLoading implements CommentState {
  const factory CommentStateLoading() = _$CommentStateLoading;
}

/// @nodoc
abstract class $CommentStateErrorCopyWith<$Res> {
  factory $CommentStateErrorCopyWith(
          CommentStateError value, $Res Function(CommentStateError) then) =
      _$CommentStateErrorCopyWithImpl<$Res>;
  $Res call({dynamic error});
}

/// @nodoc
class _$CommentStateErrorCopyWithImpl<$Res>
    extends _$CommentStateCopyWithImpl<$Res>
    implements $CommentStateErrorCopyWith<$Res> {
  _$CommentStateErrorCopyWithImpl(
      CommentStateError _value, $Res Function(CommentStateError) _then)
      : super(_value, (v) => _then(v as CommentStateError));

  @override
  CommentStateError get _value => super._value as CommentStateError;

  @override
  $Res call({
    Object? error = freezed,
  }) {
    return _then(CommentStateError(
      error == freezed
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc

class _$CommentStateError implements CommentStateError {
  const _$CommentStateError(this.error);

  @override
  final dynamic error;

  @override
  String toString() {
    return 'CommentState.error(error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is CommentStateError &&
            (identical(other.error, error) ||
                const DeepCollectionEquality().equals(other.error, error)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(error);

  @JsonKey(ignore: true)
  @override
  $CommentStateErrorCopyWith<CommentStateError> get copyWith =>
      _$CommentStateErrorCopyWithImpl<CommentStateError>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(List<CommentModel> comments) $default, {
    required TResult Function() loading,
    required TResult Function(dynamic error) error,
  }) {
    return error(this.error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult Function(List<CommentModel> comments)? $default, {
    TResult Function()? loading,
    TResult Function(dynamic error)? error,
  }) {
    return error?.call(this.error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(List<CommentModel> comments)? $default, {
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
    TResult Function(CommentStateData value) $default, {
    required TResult Function(CommentStateLoading value) loading,
    required TResult Function(CommentStateError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult Function(CommentStateData value)? $default, {
    TResult Function(CommentStateLoading value)? loading,
    TResult Function(CommentStateError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(CommentStateData value)? $default, {
    TResult Function(CommentStateLoading value)? loading,
    TResult Function(CommentStateError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class CommentStateError implements CommentState {
  const factory CommentStateError(dynamic error) = _$CommentStateError;

  dynamic get error => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CommentStateErrorCopyWith<CommentStateError> get copyWith =>
      throw _privateConstructorUsedError;
}
