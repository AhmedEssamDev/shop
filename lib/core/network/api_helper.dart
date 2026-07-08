import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:shop/core/cache/cache_helper.dart';
import 'package:shop/core/cache/cache_keys.dart';
import 'package:shop/core/network/api_keys.dart';
import 'package:shop/core/network/api_response.dart';
import 'package:shop/core/network/end_points.dart';
import 'package:shop/core/router/app_router.dart';
import 'package:shop/core/router/app_router_keys.dart';

class ApiHelper {
  static final Dio _dio = Dio(BaseOptions(baseUrl: EndPoints.baseUrl));
  static var logger = Logger();
  static Future init() async {
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          logger.d(options.headers.toString());
          logger.d(options.path.toString());
          if (options.headers != null) {
            logger.d("Headers: ${options.headers.toString()}");
          }
          return handler.next(options);
        },
        onResponse: (response, handler) {
          logger.d(response.data.toString());
          return handler.next(response);
        },
        onError: (DioException error, handler) async {
          logger.e(error.response?.data.toString());
          try {
            // تأكد إن الـ response data هو Map قبل ما نعمل cast
            final responseData = error.response?.data;
            if (responseData is! Map<String, dynamic>) {
              if (error.response?.statusCode == 401) {
                await CacheHelper.removeValue(CacheKeys.accessToken);
                AppRouter.appRouter.go(AppRouterKeys.authScreen);
              }
              return handler.next(error);
            }
            var errorResponse = responseData;
            if (errorResponse[ApiKeys.errMessage].toString().contains(
              ApiKeys.expiredToken,
            )) {
              var result = await _dio.post(
                EndPoints.refreshToken,
                options: Options(
                  headers: {
                    ApiKeys.authorization:
                        'Bearer ${await CacheHelper.getValue(CacheKeys.refreshToken)}',
                  },
                ),
              );
              var accessData = result.data as Map<String, dynamic>;
              await CacheHelper.setValue(
                CacheKeys.accessToken,
                accessData[CacheKeys.accessToken],
              );
              final options = error.requestOptions;
              if (options.data is FormData) {
                final oldFormData = options.data as FormData;
                final Map<String, dynamic> formMap = {};
                for (var entry in oldFormData.fields) {
                  formMap[entry.key] = entry.value;
                }
                for (var file in oldFormData.files) {
                  formMap[file.key] = file.value;
                }
                options.data = FormData.fromMap(formMap);
              }
              options.headers[ApiKeys.authorization] =
                  'Bearer ${CacheHelper.getValue(CacheKeys.accessToken) ?? ''}';
              final response = await _dio.fetch(options);
              return handler.resolve(response);
            } else if (error.response?.statusCode == 401) {
              await CacheHelper.removeValue(CacheKeys.accessToken);
              AppRouter.appRouter.go(AppRouterKeys.authScreen);
            }
          } catch (e) {
            logger.e(e.toString());
            await CacheHelper.removeValue(CacheKeys.accessToken);
            AppRouter.appRouter.go(AppRouterKeys.authScreen);
          }
          return handler.next(error);
        },
      ),
    );
  }

  Future<ApiResponse> getRequest({
    required String endPoint,
    Map<String, dynamic>? queryParams,
    bool isFormData = true,
    bool isAuthorized = true,
  }) async {
    try {
      // جيب الـ token الأول وتأكد إنه مش null
      final token = CacheHelper.getValue(CacheKeys.accessToken);
      var response = await _dio.get(
        endPoint,
        queryParameters: queryParams,
        options: Options(
          headers: {
            if (isAuthorized && token != null && token.toString().isNotEmpty)
              'Authorization': 'Bearer $token',
          },
        ),
      );
      return ApiResponse.fromResponse(response);
    } catch (e) {
      return ApiResponse.fromError(e);
    }
  }

  // post

  Future<ApiResponse> postRequest({
    required String endPoint,
    Map<String, dynamic>? data,
    bool isFormData = true,
    bool isAuthorized = true,
  }) async {
    try {
      final token = CacheHelper.getValue(CacheKeys.accessToken);
      var response = await _dio.post(
        endPoint,
        data: data == null
            ? null
            : isFormData
            ? FormData.fromMap(data)
            : data,
        options: Options(
          headers: {
            if (isAuthorized && token != null && token.toString().isNotEmpty)
              'Authorization': 'Bearer $token'
          },
        ),
      );
      return ApiResponse.fromResponse(response);
    } catch (e) {
      // ignore: avoid_print
      return ApiResponse.fromError(e);
    }
  }

  Future<ApiResponse> putRequest({
    required String endPoint,
    Map<String, dynamic>? data,
    bool isFormData = true,
    bool isAuthorized = true,
  }) async {
    try {
      final token = CacheHelper.getValue(CacheKeys.accessToken);
      var response = await _dio.put(
        endPoint,
        data: data == null
            ? null
            : isFormData
            ? FormData.fromMap(data)
            : data,
        options: Options(
          headers: {
            if (isAuthorized && token != null && token.toString().isNotEmpty)
              'Authorization': 'Bearer $token'
          },
        ),
      );
      return ApiResponse.fromResponse(response);
    } catch (e) {
      return ApiResponse.fromError(e);
    }
  }

  Future<ApiResponse> deleteRequest({
    required String endPoint,
    Map<String, dynamic>? data,
    bool isFormData = true,
    bool isAuthorized = true,
  }) async {
    try {
      final token = CacheHelper.getValue(CacheKeys.accessToken);
      var response = await _dio.delete(
        endPoint,
        data: data == null
            ? null
            : isFormData
            ? FormData.fromMap(data)
            : data,
        options: Options(
          headers: {
            if (isAuthorized && token != null && token.toString().isNotEmpty)
              'Authorization': 'Bearer $token'
          },
        ),
      );
      return ApiResponse.fromResponse(response);
    } catch (e) {
      return ApiResponse.fromError(e);
    }
  }
}
