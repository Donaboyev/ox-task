// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AuthUserModel _$_$_AuthUserModelFromJson(Map<String, dynamic> json) {
  return _$_AuthUserModel(
    token: json['token'] as String,
    lifetime: json['lifetime'] as int,
    expiresAt: json['expires_at'] as String,
  );
}

Map<String, dynamic> _$_$_AuthUserModelToJson(_$_AuthUserModel instance) =>
    <String, dynamic>{
      'token': instance.token,
      'lifetime': instance.lifetime,
      'expires_at': instance.expiresAt,
    };
