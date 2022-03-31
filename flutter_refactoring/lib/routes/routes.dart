import 'package:flutter_refactoring/pages/profile.page.dart';
import 'package:flutter_refactoring/pages/home.page.dart';
import 'package:flutter_refactoring/pages/login.page.dart';

class RoutesCustom {
  static initialRoute() => '/login';

  static feature() {
    return {
      '/login': (context) => const LoginPage(),
      '/profile': (context) => const ProfilePage(),
      '/home': (context) => const HomePage(),
    };
  }
}
