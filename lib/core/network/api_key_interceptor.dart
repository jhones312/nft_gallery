import 'package:dio/dio.dart';

import '../constants/api_constants.dart';

/// Injects the Moralis API key into every outgoing request.
///
/// Interceptors keep auth concerns out of repositories — the data layer
/// only declares *what* to fetch; this class handles *how* to authenticate.
class ApiKeyInterceptor extends Interceptor {
  ApiKeyInterceptor({String? apiKey})
      : _apiKey = apiKey ?? ApiConstants.moralisApiKey;

  final String _apiKey;

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers[ApiConstants.apiKeyHeader] = _apiKey;
    handler.next(options);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    // Surface indexer-specific failures with clearer messages for the UI layer.
    if (err.response?.statusCode == 401) {
      handler.reject(
        err.copyWith(
          message:
              'Invalid API key. Set MORALIS_API_KEY via --dart-define or update ApiConstants.',
        ),
      );
      return;
    }
    handler.next(err);
  }
}
