import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import '../../modules/auth_module/bloc/authentication_bloc.dart';
import '../../modules/auth_module/data/authentication/authentication_local_datasource.dart';
import '../const.dart';
import '../style/colors.dart';
import '../style/fonts.dart';
import '../utils/service_locator.dart';

class ServerException extends Equatable implements Exception {
  final String? message;
  final bool showSnackbar;
  // bool isBottomSheetOpened = false;

  _showSubscriptionEndBottomSheet() {
    if (!isBottomSheetOpened) {
      isBottomSheetOpened = true;
      showModalBottomSheet(
        isDismissible: false,
        useSafeArea: true,
        useRootNavigator: true,
        context: navigatorKey.currentContext!,
        builder: (context) {
          return BottomSheet(
            onClosing: () {
              context.canPop() ? context.pop() : null;
              isBottomSheetOpened = false;
              sl<AuthenticationBloc>().add(LoggedOut());
            },
            builder: (BuildContext context) {
              return PopScope(
                onPopInvokedWithResult: (bool, dynamic) {
                  context.canPop() ? context.pop() : null;
                  isBottomSheetOpened = false;
                  sl<AuthenticationBloc>().add(LoggedOut());
                },
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(
                        height: 5.h,
                      ),
                      SvgPicture.asset(
                        "",
                        height: 70,
                        width: 70,
                        color: Colors.blue,
                      ),
                      // Checkmark icon
                      // Icon(
                      //   Icons.check_circle,
                      //   size: 70,
                      //   color: Colors.blue,
                      // ),
                      const SizedBox(height: 16.0),
                      // Success message text
                      Text(
                        'تم انتهاء فترة التجربة',
                        style: CustomTextStyle.regular_14,
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 8.0),
                      Text(
                        'سيتم إرسال طريقة الاشتراك في البريد الإلكتروني',
                        style: CustomTextStyle.regular_14
                            .copyWith(color: AppColors.greyColor),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 16.0),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 10.0),
                        child: SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () {
                              context.canPop() ? context.pop() : null;
                              isBottomSheetOpened = false;
                              // sl<AuthenticationBloc>().add(LoggedOut());
                            },
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.blue,
                                padding: const EdgeInsets.all(15)),
                            child: Text('تسجيل الخروج',
                                style: CustomTextStyle.semiBold_14
                                    .copyWith(color: Colors.white)),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 5.h,
                      )
                    ],
                  ),
                ),
              );
            },
          );
        },
      );
    }
  }

  _showNetworkErrorBottomSheet() {
    print("building connection bottom sheet");
    if (!isBottomSheetOpened) {
      isBottomSheetOpened = true;
      showModalBottomSheet(
        isDismissible: false,
        useSafeArea: true,
        useRootNavigator: true,
        context: navigatorKey.currentContext!,
        builder: (context) {
          return BottomSheet(
            onClosing: () {
              isBottomSheetOpened = false;
            },
            builder: (BuildContext context) {
              return PopScope(
                onPopInvokedWithResult: (bool, dynamic) {
                  print("closing");
                  isBottomSheetOpened = false;
                },
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(20),
                        child: SvgPicture.asset(""),
                      ),
                      Text(
                        'لقد فقدت الاتصال بالإنترنت',
                        // style: Theme.of(context).textTheme.headline6,
                        textAlign: TextAlign.center,
                        style: CustomTextStyle.semiBold_16,
                      ),
                      SizedBox(
                        height: 14,
                      ),
                      Text(
                        'لا يوجد اتصال بالإنترنت. تحقق من اتصال بالإنترنت.',
                        textAlign: TextAlign.center,
                        style: CustomTextStyle.regular_16,
                      ),
                      const SizedBox(height: 45),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            backgroundColor: Colors.blue,
                          ),
                          // onPressed: onRetry,
                          onPressed: () {
                            context.pop();
                            isBottomSheetOpened = false;

                            latestFunctionCalled?.call();
                          },
                          child: Text(
                            'جرب مرة اخرى',
                            style: CustomTextStyle.semiBold_14
                                .copyWith(color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      );
    }
  }

  ServerException([this.message, this.showSnackbar = true]) {
    if (showSnackbar && rootScaffoldKey.currentState != null) {
      // rootScaffoldKey.currentState!
      //     .showSnackBar(SnackBar(content: Text(message!)));
    }
  }

  @override
  List<Object?> get props => [message, showSnackbar];

  @override
  String toString() {
    return '$message';
  }
}

class FetchDataException extends ServerException {
  FetchDataException([message])
      : super(message ?? "Error During Communication");
}

class BadRequestException extends ServerException {
  BadRequestException([message]) : super(message ?? "Bad Request", false) {

    if (rootScaffoldKey.currentState != null) {
      rootScaffoldKey.currentState!
          .showSnackBar(SnackBar(content: Center(child: Text(message!))));
    }
  }

}

class UnauthorizedException extends ServerException {
  UnauthorizedException([message]) : super(message ?? "Unauthorized") {
    sl<BaseUserLocalDataSource>().deleteUserToken().then((value) {
      sl<AuthenticationBloc>().add(AppStarted());
    });
    if (rootScaffoldKey.currentState != null) {
      rootScaffoldKey.currentState!
          .showSnackBar(SnackBar(content: Center(child: Text(message!))));
    }
  }
}

class ForbiddenException extends ServerException {
  ForbiddenException([message])
      : super(message ?? "This action is unauthorized") {
    print("ForbiddenException $message");
    if (message == 'false') {
      _showSubscriptionEndBottomSheet();
    }
  }
}

class NotFoundException extends ServerException {
  NotFoundException([message]) : super(message ?? "Page Not Found", false);
}

class MethodNotAllowedException extends ServerException {
  MethodNotAllowedException([message]) : super(message ?? "Method Not Allowed");
}

class TooManyRequestsException extends ServerException {
  TooManyRequestsException([message]) : super(message ?? "Too Many Requests");
}

class UnprocessableEntityException extends ServerException {
  UnprocessableEntityException([message, errors])
      : super(message ?? "Unprocessable Entity");

// Additional handling for the 'errors' property can be added here if needed
}

class InternalServerErrorException extends ServerException {
  InternalServerErrorException([message])
      : super(message ?? "Internal Server Error");
}

class NoInternetConnectionException extends ServerException {
  NoInternetConnectionException([message])
      : super(message ?? "No Internet Connection") {
    _showNetworkErrorBottomSheet();
  }
}

class CacheException implements Exception {}
