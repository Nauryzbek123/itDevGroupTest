// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i4;
import 'package:flutter/material.dart' as _i5;

import '../../screens/Auth/city_auth.dart' as _i3;
import '../../screens/Auth/phone_auth.dart' as _i1;
import '../../screens/Auth/sms_verif.dart' as _i2;

class AppRouter extends _i4.RootStackRouter {
  AppRouter([_i5.GlobalKey<_i5.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i4.PageFactory> pagesMap = {
    PhoneAuth.name: (routeData) {
      return _i4.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.PhoneAuth(),
      );
    },
    SmsVerification.name: (routeData) {
      return _i4.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i2.SmsVerification(),
      );
    },
    CityAuth.name: (routeData) {
      return _i4.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i3.CityAuth(),
      );
    },
  };

  @override
  List<_i4.RouteConfig> get routes => [
        _i4.RouteConfig(
          PhoneAuth.name,
          path: '/',
        ),
        _i4.RouteConfig(
          SmsVerification.name,
          path: '/sms',
        ),
        _i4.RouteConfig(
          CityAuth.name,
          path: '/city',
        ),
      ];
}

/// generated route for
/// [_i1.PhoneAuth]
class PhoneAuth extends _i4.PageRouteInfo<void> {
  const PhoneAuth()
      : super(
          PhoneAuth.name,
          path: '/',
        );

  static const String name = 'PhoneAuth';
}

/// generated route for
/// [_i2.SmsVerification]
class SmsVerification extends _i4.PageRouteInfo<void> {
  const SmsVerification()
      : super(
          SmsVerification.name,
          path: '/sms',
        );

  static const String name = 'SmsVerification';
}

/// generated route for
/// [_i3.CityAuth]
class CityAuth extends _i4.PageRouteInfo<void> {
  const CityAuth()
      : super(
          CityAuth.name,
          path: '/city',
        );

  static const String name = 'CityAuth';
}
