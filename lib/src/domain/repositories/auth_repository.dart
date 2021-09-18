import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:ox_system_task/src/core/constants/app_constants.dart';
import 'package:ox_system_task/src/core/di/api_result.dart';
import 'package:ox_system_task/src/core/di/http_service.dart';
import 'package:ox_system_task/src/core/di/injection_extension.dart';
import 'package:ox_system_task/src/core/di/network_exceptions.dart';
import 'package:ox_system_task/src/data/models/auth/auth_user_model.dart';

class AuthRepository {
  static Future<ApiResult<AuthUserModel>> authUser(
    String username,
    String password,
    String subdomain,
  ) async {
    final data = {
      '_username': username,
      '_password': password,
      '_subdomain': subdomain
    };
    try {
      final response = await inject<HttpService>().dio.post(
            '$subdomain${Constants.baseUrlPostfix}/security/auth_check',
            options: Options(
              headers: {
                'security-key': Constants.securityKey
              },
              contentType: Headers.formUrlEncodedContentType,
            ),
            data: data,
          );
      return ApiResult.success(data: AuthUserModel.fromJson(response.data));
    } catch (e) {
      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }
}
