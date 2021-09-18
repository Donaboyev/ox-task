import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'auth_user_model.freezed.dart';

part 'auth_user_model.g.dart';

@freezed
class AuthUserModel with _$AuthUserModel {
  const factory AuthUserModel({
    @JsonKey(name: 'token') required String token,
    @JsonKey(name: 'lifetime') required int lifetime,
    @JsonKey(name: 'expires_at') required String expiresAt,

  }) = _AuthUserModel;

  factory AuthUserModel.fromJson(Map<String, dynamic> json) =>
      _$AuthUserModelFromJson(json);
}
