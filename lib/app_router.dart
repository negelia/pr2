import 'package:pr2/common/url_page.dart';
import 'package:pr2/index.dart';
import 'package:flutter/material.dart';
import 'package:pr2/presentation/screen/auth/sing_in.dart';

class AppRouter {
  Route<dynamic>? generateRouter(RouteSettings settigns) {
    switch (settigns.name) {
      case UrlPage.signIn:
        {
          return MaterialPageRoute(builder: (_) => SignIn());
        }
      case UrlPage.signUp:
        {
          return MaterialPageRoute(builder: (_) => SignUp());
        }
      case UrlPage.admin:
        {
          return MaterialPageRoute(builder: (_) => HomeAdmin());
        }
      case UrlPage.client:
        {
          return MaterialPageRoute(builder: (_) => HomeClient());
        }
      default:
        {
          return null;
        }
    }
  }
}
