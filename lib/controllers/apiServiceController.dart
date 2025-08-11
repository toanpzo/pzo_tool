import 'package:dio/dio.dart';

class ApiService {
  static final ApiService _instance = ApiService._internal();
  factory ApiService({String? baseUrl}) {
    if (baseUrl != null) {
      _instance.setBaseUrl(baseUrl);
    }
    return _instance;
  }

  late Dio _dio;

  ApiService._internal() {
    _dio = Dio();
  }

  /// Getter for current baseUrl
  String get baseUrl => _dio.options.baseUrl;

  /// Reset all options when setting a new baseUrl
  void setBaseUrl(String baseUrl) {
    _dio.options = BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
      headers: {
        'Content-Type': 'application/json',
      },
    );
  }

  /// Set token (after login)
  void setToken(String token) {
    _dio.options.headers['Authorization'] = 'Bearer $token';
  }

  /// GET
  Future<Response> get(String endpoint,
      {Map<String, dynamic>? queryParams}) async {
    try {
      return await _dio.get(endpoint, queryParameters: queryParams);
    } catch (e) {
      throw _handleError(e);
    }
  }

  /// POST
  Future<Response> post(String endpoint, {dynamic data}) async {
    try {
      return await _dio.post(endpoint, data: data);
    } catch (e) {
      throw _handleError(e);
    }
  }

  /// PATCH
  Future<Response> patch(String endpoint, {dynamic data}) async {
    try {
      return await _dio.patch(endpoint, data: data);
    } catch (e) {
      throw _handleError(e);
    }
  }

  /// DELETE
  Future<Response> delete(String endpoint, {dynamic data}) async {
    try {
      return await _dio.delete(endpoint, data: data);
    } catch (e) {
      throw _handleError(e);
    }
  }

  /// Handle errors
  String _handleError(dynamic error) {
    if (error is DioException) {
      if (error.type == DioExceptionType.connectionTimeout) {
        return 'Connection timeout!';
      } else if (error.type == DioExceptionType.receiveTimeout) {
        return 'Receive timeout!';
      } else if (error.response != null) {
        return 'Error ${error.response?.statusCode}: ${error.response?.data}';
      } else {
        return 'Unexpected error: ${error.message}';
      }
    }
    return 'Unknown error!';
  }
}
