import 'dart:io';

import 'package:dio/dio.dart';
enum Crud { create, read, update, delete }


class ApiResult<T> {
  final T? data;
  final String? error;

  ApiResult.success(this.data) : error = null;
  ApiResult.failure(this.error) : data = null;

  bool get isSuccess => data != null;
}

class ApiService {
  static final ApiService _instance = ApiService._internal();
  factory ApiService({String? baseUrl}) {
    if (baseUrl != null) {
      _instance.setBaseUrl(baseUrl);
    }
    return _instance;
  }

  late Dio _dio;

  bool checkPermission(int permission,Crud crud){
     int bitMask = 1 << (3 - crud.index); 
    return (permission & bitMask) != 0;
  }

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




  Future<ApiResult<Response>> get(
      String endpoint, {
        Map<String, dynamic>? queryParams,
      }) async {
    try {
      if(!(await wakeup(60))) {
        return ApiResult.failure("Wakeup Sever Error");
      }
        final res = await _dio.get(endpoint, queryParameters: queryParams);
        return ApiResult.success(res);


    } catch (e) {
      return ApiResult.failure(_handleError(e));
    }
  }

  Future<ApiResult<Response>> post(
      String endpoint, {
        dynamic data,
        Map<String, dynamic>? queryParams,
      }) async {
    try {
      if(!(await wakeup(60))) {
        return ApiResult.failure("Wakeup Sever Error");
      }
      final res = await _dio.post(endpoint, data: data, queryParameters: queryParams);
      return ApiResult.success(res);
    } catch (e) {
      return ApiResult.failure(_handleError(e));
    }
  }

  Future<ApiResult<Response>> postMultipart(
      String endpoint,
      Map<String, dynamic> fields,
      File file, {
        String fileFieldName = "file",
        Map<String, dynamic>? queryParams,
      }) async {
    try {
      if (!(await wakeup(60))) {
        return ApiResult.failure("Wakeup Sever Error");
      }

      String fileName = file.path.split("/").last;

      final formData = FormData.fromMap({
        ...fields,
        fileFieldName: await MultipartFile.fromFile(
          file.path,
          filename: fileName,
        ),
      });

      final res = await _dio.post(
        endpoint,
        data: formData,
        queryParameters: queryParams,
      );

      return ApiResult.success(res);
    } catch (e) {
      return ApiResult.failure(_handleError(e));
    }
  }


  Future<ApiResult<Response>> patch(
      String endpoint, {
        dynamic data,
        Map<String, dynamic>? queryParams,
      }) async {
    try {
      if(!(await wakeup(60))) {
        return ApiResult.failure("Wakeup Sever Error");
      }
      final res = await _dio.patch(endpoint, data: data, queryParameters: queryParams);
      return ApiResult.success(res);
    } catch (e) {
      return ApiResult.failure(_handleError(e));
    }
  }

  Future<ApiResult<Response>> delete(
      String endpoint, {
        dynamic data,
        Map<String, dynamic>? queryParams,
      }) async {
    try {
      if(!(await wakeup(60))) {
        return ApiResult.failure("Wakeup Sever Error");
      }
      final res = await _dio.delete(endpoint, data: data, queryParameters: queryParams);
      return ApiResult.success(res);
    } catch (e) {
      return ApiResult.failure(_handleError(e));
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



  /// wakeup service
  Future<bool> wakeup(int timeout) async {
    final start = DateTime.now();

    while (true) {
      if (DateTime.now().difference(start) > Duration(seconds: timeout )) {
        print("⏰ Timeout sau timeout, service không wakeup được.");
        return false;
      }

      try {
        final response = await _dio
            .get(
          "",
          options: Options(receiveTimeout: Duration(seconds: timeout ), sendTimeout: Duration(seconds: timeout )),
        );

        if (response.statusCode == 200) {
          print("✅ Service woke up: ${response.data}");
          return true;
        } else {
          print("⚠️ Service trả về ${response.statusCode}, thử lại sau...");
        }
      } catch (e) {
        print("❌ Lỗi khi gọi service: $e");
      }
      await Future.delayed(const Duration(seconds: 5));
    }

  }

}

