import 'package:cs_flutter/main.dart';
import 'package:cs_flutter/screens/login_screen.dart';
import 'package:cs_flutter/screens/signup_screen.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static const String home = '/';
  static const String login = '/login';
  static const String signup = '/signup';

  static Map<String, WidgetBuilder> define() {
    return {
      home: (context) {
        return MyHomePage();
      },
      login: (context) {
        return LoginScreen();
      },
    };
  }

  static onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case signup:
        {
          final value = settings.arguments as int; // Retrieve the value.
          return MaterialPageRoute(
              builder: (_) => SignupScreen(value)); // Pass it to BarPage.
        }
    }
  }

  static popUntilRoot(BuildContext context) {
    if (Navigator.of(context).canPop()) {
      Navigator.of(context).popUntil((route) => route.isFirst);
    }
  }
}
