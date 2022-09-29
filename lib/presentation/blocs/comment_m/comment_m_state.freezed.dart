// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'comment_m_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$CommentMStateTearOff {
  const _$CommentMStateTearOff();

  CommentMStateData<ItemType> call<ItemType>(
      RequestUpdateModel<ItemType> requestUpdate) {
    return CommentMStateData<ItemType>(
      requestUpdate,
    );
  }
}

/// @nodoc
const $CommentMState = _$CommentMStateTearOff();

/// @nodoc
mixin _$CommentMState<ItemType> {
  RequestUpdateModel<ItemType> get requestUpdate =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CommentMStateCopyWith<ItemType, CommentMState<ItemType>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CommentMStateCopyWith<ItemType, $Res> {
  factory $CommentMStateCopyWith(CommentMState<ItemType> value,
          $Res Function(CommentMState<ItemType>) then) =
      _$CommentMStateCopyWithImpl<ItemType, $Res>;
  $Res call({RequestUpdateModel<ItemType> requestUpdate});
}

/// @nodoc
class _$CommentMStateCopyWithImpl<ItemType, $Res>
    implements $CommentMStateCopyWith<ItemType, $Res> {
  _$CommentMStateCopyWithImpl(this._value, this._then);

  final CommentMState<ItemType> _value;
  // ignore: unused_field
  final $Res Function(CommentMState<ItemType>) _then;

  @override
  $Res call({
    Object? requestUpdate = freezed,
  }) {
    return _then(_value.copyWith(
      requestUpdate: requestUpdate == freezed
          ? _value.requestUpdate
          : requestUpdate // ignore: cast_nullable_to_non_nullable
              as RequestUpdateModel<ItemType>,
    ));
  }
}

/// @nodoc
abstract class $CommentMStateDataCopyWith<ItemType, $Res>
    implements $CommentMStateCopyWith<ItemType, $Res> {
  factory $CommentMStateDataCopyWith(CommentMStateData<ItemType> value,
          $Res Function(CommentMStateData<ItemType>) then) =
      _$CommentMStateDataCopyWithImpl<ItemType, $Res>;
  @override
  $Res call({RequestUpdateModel<ItemType> requestUpdate});
}

/// @nodoc
class _$CommentMStateDataCopyWithImpl<ItemType, $Res>
    extends _$CommentMStateCopyWithImpl<ItemType, $Res>
    implements $CommentMStateDataCopyWith<ItemType, $Res> {
  _$CommentMStateDataCopyWithImpl(CommentMStateData<ItemType> _value,
      $Res Function(CommentMStateData<ItemType>) _then)
      : super(_value, (v) => _then(v as CommentMStateData<ItemType>));

  @override
  CommentMStateData<ItemType> get _value =>
      super._value as CommentMStateData<ItemType>;

  @override
  $Res call({
    Object? requestUpdate = freezed,
  }) {
    return _then(CommentMStateData<ItemType>(
      requestUpdate == freezed
          ? _value.requestUpdate
          : requestUpdate // ignore: cast_nullable_to_non_nullable
              as RequestUpdateModel<ItemType>,
    ));
  }
}

/// @nodoc

class _$CommentMStateData<ItemType> implements CommentMStateData<ItemType> {
  const _$CommentMStateData(this.requestUpdate);

  @override
  final RequestUpdateModel<ItemType> requestUpdate;

  @override
  String toString() {
    return 'CommentMState<$ItemType>(requestUpdate: $requestUpdate)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is CommentMStateData<ItemType> &&
            (identical(other.requestUpdate, requestUpdate) ||
                const DeepCollectionEquality()
                    .equals(other.requestUpdate, requestUpdate)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(requestUpdate);

  @JsonKey(ignore: true)
  @override
  $CommentMStateDataCopyWith<ItemType, CommentMStateData<ItemType>>
      get copyWith => _$CommentMStateDataCopyWithImpl<ItemType,
          CommentMStateData<ItemType>>(this, _$identity);
}

abstract class CommentMStateData<ItemType> implements CommentMState<ItemType> {
  const factory CommentMStateData(RequestUpdateModel<ItemType> requestUpdate) =
      _$CommentMStateData<ItemType>;

  @override
  RequestUpdateModel<ItemType> get requestUpdate =>
      throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  $CommentMStateDataCopyWith<ItemType, CommentMStateData<ItemType>>
      get copyWith => throw _privateConstructorUsedError;
}
