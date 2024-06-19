import 'package:auto_route/auto_route.dart';
import 'package:test_proj/src/features/screens/Auth/city_auth.dart';
import 'package:test_proj/src/features/screens/Auth/phone_auth.dart';
import 'package:test_proj/src/features/screens/Auth/sms_verif.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(page: PhoneAuth, path: '/', initial: true),
    AutoRoute(page: SmsVerification, path: '/sms'),
    AutoRoute(page: CityAuth, path: '/city'),
  ],
)
class $AppRouter {}