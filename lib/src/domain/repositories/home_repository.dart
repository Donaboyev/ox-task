import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:ox_system_task/src/core/constants/app_constants.dart';
import 'package:ox_system_task/src/core/di/api_result.dart';
import 'package:ox_system_task/src/core/di/http_service.dart';
import 'package:ox_system_task/src/core/di/injection_extension.dart';
import 'package:ox_system_task/src/core/di/network_exceptions.dart';
import 'package:ox_system_task/src/data/models/auth/auth_user_model.dart';
import 'package:ox_system_task/src/data/models/home/product_model.dart';

class HomeRepository {
  static Future<ApiResult<ProductModel>> fetchProducts({
    required String subdomain,
    int? size,
    int? page,
  }) async {
    print('====================> fetch products function');
    final queryParams = {
      'page': page ?? 1,
      'size': size ?? 12,
    };
    final data = {
      '_username': 'oxapi',
      '_password': 'oxapi123123',
      '_subdomain': subdomain
    };
    print('====================> query params $queryParams');
    try {
      print('====================> inside try');
      print('====================> subdomain: $subdomain');
      print('====================> post fix: ${Constants.baseUrlPostfix}');
      print('====================> security key: ${Constants.securityKey}');
      final response = await inject<HttpService>().homeDio.get(
            '$subdomain${Constants.baseUrlPostfix}/market-api/57/collection-products',
            options: Options(
              headers: {
                'security-key': Constants.securityKey,
              },
              contentType: Headers.formUrlEncodedContentType,
            ),
            queryParameters: queryParams,
          );
      return ApiResult.success(
        data: ProductModel.fromJson(response.data),
      );
    } catch (e) {
      print('==================> error: $e');
      print(NetworkExceptions.getDioException(e));
      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }
}
