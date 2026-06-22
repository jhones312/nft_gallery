import 'package:dio/dio.dart';

import '../constants/api_constants.dart';
import 'api_key_interceptor.dart';

/// Shared Dio instance configured for Moralis Web3 Data API calls.
///
/// Centralizing Dio here ensures consistent timeouts, headers, and interceptors
/// across every repository in the app.
class DioClient {
  DioClient._();

  static Dio? _instance;

  static Dio get instance {
    _instance ??= _createDio();
    return _instance!;
  }

  /// Allows tests or flavor-specific builds to inject a custom Dio instance.
  static void overrideForTesting(Dio dio) {
    _instance = dio;
  }

  static Dio _createDio() {
    final dio = Dio(
      BaseOptions(
        baseUrl: ApiConstants.moralisBaseUrl,
        connectTimeout: const Duration(seconds: 15),
        receiveTimeout: const Duration(seconds: 20),
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json',
        },
      ),
    );

    dio.interceptors.add(ApiKeyInterceptor());
    dio.interceptors.add(
      LogInterceptor(
        requestBody: false,
        responseBody: false,
        logPrint: (obj) {
          // Swap for debugPrint in development if needed.
          assert(() {
            // ignore: avoid_print
            print('[Dio] $obj');
            return true;
          }());
        },
      ),
    );

    return dio;
  }
}
