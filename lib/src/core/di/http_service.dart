import 'package:alice/alice.dart';
import 'package:dio/dio.dart';
import 'package:ox_system_task/src/core/constants/app_constants.dart';

class HttpService {
  late Dio dio;

  static Alice alice = Alice(
    showNotification: true,
    showInspectorOnShake: false,
    darkTheme: false,
  );

  HttpService() {
    dio = Dio(
      BaseOptions(
        baseUrl:
            '${Constants.baseUrlPrefix}',
        connectTimeout: 5000,
        receiveTimeout: 5000,
        sendTimeout: 5000,
      ),
    )..interceptors.addAll(
        [
          LogInterceptor(
            request: false,
            requestHeader: false,
            responseHeader: false,
          ),
          alice.getDioInterceptor(),
        ],
      );
  }
}
