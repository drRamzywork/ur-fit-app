import 'dart:io';

import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:urfit/core/utils/pref_utils.dart';
// import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../../generated/locale_keys.g.dart';
import '../../modules/auth_module/data/authentication/authentication_local_datasource.dart';
import '../const.dart';
import '../utils/service_locator.dart';
import 'endpoints.dart';
import 'status_code.dart';
import '../error/exceptions.dart';

class DioServices {
  late Dio dio;

  DioServices() {
    init();
  }

  Future init() async {
    String? token = await sl<BaseUserLocalDataSource>().getUserToken();
    print("tokenmmmmmm : $token");
    // final deviceInfo = await getDeviceInfo();
    // print("Device Info: $deviceInfo");
    final local = PrefUtils().getLang();
    print(local);
    dio = Dio(
      BaseOptions(
        receiveDataWhenStatusError: true,
        baseUrl: EndPoints.baseUrl,
        headers: {
          'Accept': 'application/json',
          'Content-Type' : 'application/json',
          'Accept-Language': local,
          'Authorization': "Bearer $token",
        },
      ),
    )..interceptors
        .add(PrettyDioLogger(requestBody: true, requestHeader: true));
  }
  // Future<String> getDeviceInfo() async {
  //   String deviceDetails = '';
  //
  //   try {
  //     if (Platform.isAndroid) {
  //       final androidInfo = await deviceInfo.androidInfo;
  //       deviceDetails = 'CFNetwork/${androidInfo.version.release} Darwin/${androidInfo.version.sdkInt} (Android/${androidInfo.models} ${androidInfo.version.release})';
  //     } else if (Platform.isIOS) {
  //       final iosInfo = await deviceInfo.iosInfo;
  //       deviceDetails = 'CFNetwork/${iosInfo.systemVersion} Darwin/${iosInfo.systemVersion} (iPhone/${iosInfo.models} iOS/${iosInfo.systemVersion})';
  //     }
  //   } catch (e) {
  //     deviceDetails = 'Error retrieving device info: $e';
  //   }
  //
  //   return deviceDetails;
  // }

  Future<Response<T>> get<T>(String url,
      {Map<String, dynamic>? data, Map<String, dynamic>? parameter}) async {
    try {
      return await dio.get(
        url,
        data: data,
        queryParameters: parameter,
      );
    } on DioException catch (e) {
      throw _handleDioError(e);
      // _handleDioError(e);
      // if (exception is NoInternetConnectionException) {
      //
      //   _showNetworkErrorBottomSheet(rootScaffoldKey.currentContext!);
      // }
    } catch (e) {
      print("Error: $e");
      throw e;
    }
  }

  Future<Response<T>> update<T>(String url,
      {Map<String, dynamic>? data, Map<String, dynamic>? parameter}) async {
    try {
      return await dio.patch(url, data: data, queryParameters: parameter);
    } on DioException catch (e) {
      throw _handleDioError(e);
    } catch (e) {
      print("Error: $e");
      throw e;
    }
  }

  Future<Response<T>> post<T>(String url,
      {dynamic data, Map<String, dynamic>? parameter}) async {
    try {
      return await dio.post(url, data: data, queryParameters: parameter);
    } on DioException catch (e) {
      throw _handleDioError(e);
    } catch (e) {
      print("Error: $e");
      throw e;
    }
  }

  Future<Response<T>> delete<T>(String url,
      {Map<String, dynamic>? data, Map<String, dynamic>? parameter}) async {
    try {
      return await dio.delete(url, data: data, queryParameters: parameter);
    } on DioException catch (e) {
      throw _handleDioError(e);
    } catch (e) {
      print("Error: $e");
      throw e;
    }
  }

  Future<void> _showNetworkErrorBottomSheet(
    BuildContext context,
  ) async {
    await showModalBottomSheet(
      context: context,
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Network error occurred. Please try again.',
                // style: Theme.of(context).textTheme.headline6,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                // onPressed: onRetry,
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('Retry'),
              ),
            ],
          ),
        );
      },
    );
  }

  dynamic _handleDioError(DioException error) {
    print('object : ${error.type}');

    switch (error.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
      case DioExceptionType.connectionError:
        return NoInternetConnectionException();
      case DioExceptionType.unknown:
        // Handle network errors
        return _showNetworkErrorBottomSheet(
          rootScaffoldKey.currentContext!,
        );

      case DioExceptionType.cancel:
        // Handle request cancellation
        return ServerException("Request was canceled");

      case DioExceptionType.badResponse:
        switch (error.response?.statusCode) {
          case StatusCode.badRequest:
          case StatusCode.unprocessableEntity:
          case StatusCode.notAcceptable:
            var responseData = error.response?.data;
            print("responseData : $responseData");
            String? message = responseData['data'];
            Map<String, dynamic>? errors = responseData;

            List<String> emailErrors = errors?['email']?.cast<String>() ?? [];
            List<String> passwordErrors =
                errors?['password']?.cast<String>() ?? [];

            if (emailErrors.isNotEmpty) {
              if(emailErrors[0] == "validation.email") {
                return BadRequestException(LocaleKeys.emailMustBeValid.tr());
              }else {
                return BadRequestException(emailErrors[0]);
              }
            } else if (passwordErrors.isNotEmpty) {
              if(passwordErrors[0] == "validation.min.string") {
                return BadRequestException(LocaleKeys.passwordMustBeAtLeast6Characters.tr());
              }else {
                return BadRequestException(passwordErrors[0]);
              }
            } else {
              return BadRequestException(message ?? responseData['error']);
            }

          case StatusCode.unauthorized:
            var responseData = error.response?.data;
            print("responseData : $responseData");
            String? message = responseData['data'];
            return UnauthorizedException(message);

          case StatusCode.forbidden:
            return ForbiddenException(
                error.response?.data['isSubscribe'].toString());
          case StatusCode.notFound:
            return NotFoundException(error.response?.data['error']);

          case StatusCode.internalServerError:
            return InternalServerErrorException();

          default:
            return ServerException("Unexpected error occurred");
        }

      case DioExceptionType.badCertificate:
        return ServerException("Bad Certificate");

    }
  }
}

class RetryOnConnectionChangedInterceptor extends Interceptor {
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    // TODO: implement onError
  }
}
