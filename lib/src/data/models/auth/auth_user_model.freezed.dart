// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'auth_user_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AuthUserModel _$AuthUserModelFromJson(Map<String, dynamic> json) {
  return _AuthUserModel.fromJson(json);
}

/// @nodoc
class _$AuthUserModelTearOff {
  const _$AuthUserModelTearOff();

  _AuthUserModel call(
      {@JsonKey(name: 'token') required String token,
      @JsonKey(name: 'lifetime') required int lifetime,
      @JsonKey(name: 'expires_at') required String expiresAt}) {
    return _AuthUserModel(
      token: token,
      lifetime: lifetime,
      expiresAt: expiresAt,
    );
  }

  AuthUserModel fromJson(Map<String, Object> json) {
    return AuthUserModel.fromJson(json);
  }
}

/// @nodoc
const $AuthUserModel = _$AuthUserModelTearOff();

/// @nodoc
mixin _$AuthUserModel {
  @JsonKey(name: 'token')
  String get token => throw _privateConstructorUsedError;
  @JsonKey(name: 'lifetime')
  int get lifetime => throw _privateConstructorUsedError;
  @JsonKey(name: 'expires_at')
  String get expiresAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AuthUserModelCopyWith<AuthUserModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthUserModelCopyWith<$Res> {
  factory $AuthUserModelCopyWith(
          AuthUserModel value, $Res Function(AuthUserModel) then) =
      _$AuthUserModelCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'token') String token,
      @JsonKey(name: 'lifetime') int lifetime,
      @JsonKey(name: 'expires_at') String expiresAt});
}

/// @nodoc
class _$AuthUserModelCopyWithImpl<$Res>
    implements $AuthUserModelCopyWith<$Res> {
  _$AuthUserModelCopyWithImpl(this._value, this._then);

  final AuthUserModel _value;
  // ignore: unused_field
  final $Res Function(AuthUserModel) _then;

  @override
  $Res call({
    Object? token = freezed,
    Object? lifetime = freezed,
    Object? expiresAt = freezed,
  }) {
    return _then(_value.copyWith(
      token: token == freezed
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String,
      lifetime: lifetime == freezed
          ? _value.lifetime
          : lifetime // ignore: cast_nullable_to_non_nullable
              as int,
      expiresAt: expiresAt == freezed
          ? _value.expiresAt
          : expiresAt // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$AuthUserModelCopyWith<$Res>
    implements $AuthUserModelCopyWith<$Res> {
  factory _$AuthUserModelCopyWith(
          _AuthUserModel value, $Res Function(_AuthUserModel) then) =
      __$AuthUserModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'token') String token,
      @JsonKey(name: 'lifetime') int lifetime,
      @JsonKey(name: 'expires_at') String expiresAt});
}

/// @nodoc
class __$AuthUserModelCopyWithImpl<$Res>
    extends _$AuthUserModelCopyWithImpl<$Res>
    implements _$AuthUserModelCopyWith<$Res> {
  __$AuthUserModelCopyWithImpl(
      _AuthUserModel _value, $Res Function(_AuthUserModel) _then)
      : super(_value, (v) => _then(v as _AuthUserModel));

  @override
  _AuthUserModel get _value => super._value as _AuthUserModel;

  @override
  $Res call({
    Object? token = freezed,
    Object? lifetime = freezed,
    Object? expiresAt = freezed,
  }) {
    return _then(_AuthUserModel(
      token: token == freezed
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String,
      lifetime: lifetime == freezed
          ? _value.lifetime
          : lifetime // ignore: cast_nullable_to_non_nullable
              as int,
      expiresAt: expiresAt == freezed
          ? _value.expiresAt
          : expiresAt // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AuthUserModel with DiagnosticableTreeMixin implements _AuthUserModel {
  const _$_AuthUserModel(
      {@JsonKey(name: 'token') required this.token,
      @JsonKey(name: 'lifetime') required this.lifetime,
      @JsonKey(name: 'expires_at') required this.expiresAt});

  factory _$_AuthUserModel.fromJson(Map<String, dynamic> json) =>
      _$_$_AuthUserModelFromJson(json);

  @override
  @JsonKey(name: 'token')
  final String token;
  @override
  @JsonKey(name: 'lifetime')
  final int lifetime;
  @override
  @JsonKey(name: 'expires_at')
  final String expiresAt;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AuthUserModel(token: $token, lifetime: $lifetime, expiresAt: $expiresAt)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'AuthUserModel'))
      ..add(DiagnosticsProperty('token', token))
      ..add(DiagnosticsProperty('lifetime', lifetime))
      ..add(DiagnosticsProperty('expiresAt', expiresAt));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _AuthUserModel &&
            (identical(other.token, token) ||
                const DeepCollectionEquality().equals(other.token, token)) &&
            (identical(other.lifetime, lifetime) ||
                const DeepCollectionEquality()
                    .equals(other.lifetime, lifetime)) &&
            (identical(other.expiresAt, expiresAt) ||
                const DeepCollectionEquality()
                    .equals(other.expiresAt, expiresAt)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(token) ^
      const DeepCollectionEquality().hash(lifetime) ^
      const DeepCollectionEquality().hash(expiresAt);

  @JsonKey(ignore: true)
  @override
  _$AuthUserModelCopyWith<_AuthUserModel> get copyWith =>
      __$AuthUserModelCopyWithImpl<_AuthUserModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_AuthUserModelToJson(this);
  }
}

abstract class _AuthUserModel implements AuthUserModel {
  const factory _AuthUserModel(
          {@JsonKey(name: 'token') required String token,
          @JsonKey(name: 'lifetime') required int lifetime,
          @JsonKey(name: 'expires_at') required String expiresAt}) =
      _$_AuthUserModel;

  factory _AuthUserModel.fromJson(Map<String, dynamic> json) =
      _$_AuthUserModel.fromJson;

  @override
  @JsonKey(name: 'token')
  String get token => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'lifetime')
  int get lifetime => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'expires_at')
  String get expiresAt => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$AuthUserModelCopyWith<_AuthUserModel> get copyWith =>
      throw _privateConstructorUsedError;
}
