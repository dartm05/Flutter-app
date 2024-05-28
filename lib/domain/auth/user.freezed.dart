// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$DomainUser {
  UniqueId get id => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DomainUserCopyWith<DomainUser> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DomainUserCopyWith<$Res> {
  factory $DomainUserCopyWith(
          DomainUser value, $Res Function(DomainUser) then) =
      _$DomainUserCopyWithImpl<$Res, DomainUser>;
  @useResult
  $Res call({UniqueId id});
}

/// @nodoc
class _$DomainUserCopyWithImpl<$Res, $Val extends DomainUser>
    implements $DomainUserCopyWith<$Res> {
  _$DomainUserCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as UniqueId,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DomainUserImplCopyWith<$Res>
    implements $DomainUserCopyWith<$Res> {
  factory _$$DomainUserImplCopyWith(
          _$DomainUserImpl value, $Res Function(_$DomainUserImpl) then) =
      __$$DomainUserImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({UniqueId id});
}

/// @nodoc
class __$$DomainUserImplCopyWithImpl<$Res>
    extends _$DomainUserCopyWithImpl<$Res, _$DomainUserImpl>
    implements _$$DomainUserImplCopyWith<$Res> {
  __$$DomainUserImplCopyWithImpl(
      _$DomainUserImpl _value, $Res Function(_$DomainUserImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
  }) {
    return _then(_$DomainUserImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as UniqueId,
    ));
  }
}

/// @nodoc

class _$DomainUserImpl implements _DomainUser {
  _$DomainUserImpl({required this.id});

  @override
  final UniqueId id;

  @override
  String toString() {
    return 'DomainUser(id: $id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DomainUserImpl &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DomainUserImplCopyWith<_$DomainUserImpl> get copyWith =>
      __$$DomainUserImplCopyWithImpl<_$DomainUserImpl>(this, _$identity);
}

abstract class _DomainUser implements DomainUser {
  factory _DomainUser({required final UniqueId id}) = _$DomainUserImpl;

  @override
  UniqueId get id;
  @override
  @JsonKey(ignore: true)
  _$$DomainUserImplCopyWith<_$DomainUserImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
