import 'package:dio/dio.dart';
import 'package:ox_system_task/src/core/constants/app_constants.dart';
import 'package:ox_system_task/src/core/di/api_result.dart';
import 'package:ox_system_task/src/core/di/http_service.dart';
import 'package:ox_system_task/src/core/di/injection_extension.dart';
import 'package:ox_system_task/src/core/di/network_exceptions.dart';
import 'package:ox_system_task/src/data/models/home/products_model.dart';

class HomeRepository {
  static Future<ApiResult<ProductsModel>> fetchProducts({
    required String subdomain,
    int? size,
    int? page,
  }) async {
    final queryParams = {
      'page': page ?? 1,
      'size': size ?? 12,
    };
    try {
      final response = await inject<HttpService>().dio.get(
            '$subdomain${Constants.baseUrlPostfix}/market-api/57/collection-products',
            options: Options(
              headers: {
                'security-key': Constants.securityKey,
                'Accept': '*/*',
                'Accept-Encoding': 'gzip, deflate, br',
                'Connection': 'keep-alive'
              },
              contentType: Headers.formUrlEncodedContentType,
            ),
            queryParameters: queryParams,
          );
      return ApiResult.success(
        data: ProductsModel.fromJson(response.data),
      );
    } catch (e) {
      print(NetworkExceptions.getDioException(e));
      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }
}
