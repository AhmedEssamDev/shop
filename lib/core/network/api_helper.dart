import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:shop/core/cache/cache_helper.dart';
import 'package:shop/core/cache/cache_keys.dart';
import 'package:shop/core/network/api_keys.dart';
import 'package:shop/core/network/api_response.dart';
import 'package:shop/core/network/end_points.dart';

class ApiHelper {
  static final Dio _dio = Dio(BaseOptions(baseUrl: EndPoints.baseUrl));
  static var logger = Logger();
  static Future init() async {
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          logger.d(options.headers.toString());
          logger.d(options.path.toString());
          return handler.next(options);
        },
        onResponse: (response, handler) {
          logger.d(response.data.toString());
          return handler.next(response);
        },
        onError: (DioException error, handler) async{
          logger.e(error.response?.data.toString());
          var errorResponse = error.response?.data as Map<String, dynamic>;
          try {
            if (errorResponse[ApiKeys.errMessage]
            .toString()
            .contains(ApiKeys.expiredToken)){
             var result = await _dio.post(
                EndPoints.refreshToken,
                options: Options(
                   headers: {
                    ApiKeys.authorization : 
                    'Bearer ${await CacheHelper.getValue(CacheKeys.refreshToken)}'
                   }
                )
                );
              var accessData = result.data as Map<String, dynamic>;
              await CacheHelper.setValue(CacheKeys.accessToken, accessData[CacheKeys.accessToken]);
              final options = error.requestOptions;
              if(options.data is FormData){
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
            }
          } catch (e) {
            logger.e(e.toString());
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
      var response = await _dio.get(endPoint, queryParameters: queryParams, options: Options(
        headers: {
          if(isAuthorized)'Authorization':
              'Bearer ${await CacheHelper.getValue(CacheKeys.accessToken)}'
        }
      ));
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
      var response = await _dio.post(
        endPoint,
        data: data == null
            ? null
            : isFormData
                ? FormData.fromMap(data)
                : data,
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
      var response = await _dio.put(
        endPoint,
        data: data == null
            ? null
            : isFormData
                ? FormData.fromMap(data)
                : data,
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
      var response = await _dio.delete(
        endPoint,
        data: data == null
            ? null
            : isFormData
                ? FormData.fromMap(data)
                : data,
      );
      return ApiResponse.fromResponse(response);
    } catch (e) {
      return ApiResponse.fromError(e);
    }
  }
}
