import 'package:dio/dio.dart';
import '../utils/logger.dart';
import '../error/exceptions/server_exception.dart';
import 'api_endpoints.dart';

class DioClient {
  late final Dio _dio;

  DioClient() {
    _dio = Dio(
      BaseOptions(
        baseUrl: ApiEndpoints.baseUrl,
        connectTimeout: const Duration(seconds: 10),
        receiveTimeout: const Duration(seconds: 10),
        headers: {'Content-Type': 'application/json'},
      ),
    );

    _dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) {
        AppLogger().debug("➡️ [${options.method}] ${options.uri}");
        return handler.next(options);
      },
      onResponse: (response, handler) {
        AppLogger().info("✅ Response: ${response.statusCode} ${response.data}");
        return handler.next(response);
      },
      onError: (e, handler) {
        AppLogger().error("❌ Error: ${e.message}");
        return handler.next(e);
      },
    ));
  }

  Future<Response> get(String path, {Map<String, dynamic>? queryParameters}) async {
    try {
      return await _dio.get(path, queryParameters: queryParameters);
    } on DioException catch (e) {
      throw ServerException(message: e.message ?? "Unknown error", statusCode: e.response?.statusCode);
    }
  }

  Future<Response> post(String path, {dynamic data}) async {
    try {
      return await _dio.post(path, data: data);
    } on DioException catch (e) {
      throw ServerException(message: e.message ?? "Unknown error", statusCode: e.response?.statusCode);
    }
  }

  Future<Response> put(String path, {dynamic data}) async {
    try {
      return await _dio.put(path, data: data);
    } on DioException catch (e) {
      throw ServerException(message: e.message ?? "Unknown error", statusCode: e.response?.statusCode);
    }
  }

  Future<Response> delete(String path) async {
    try {
      return await _dio.delete(path);
    } on DioException catch (e) {
      throw ServerException(message: e.message ?? "Unknown error", statusCode: e.response?.statusCode);
    }
  }
}
