import 'package:flutter/material.dart';
import 'package:pr2/app_router.dart';
import 'package:pr2/common/url_page.dart';
import 'package:pr2/core/db/data_base_helper.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DataBaseHelper.instance.init();
  Provider.debugCheckInvalidValueType = null;
  runApp(App());
}

class App extends StatelessWidget {
  App({Key? key}) : super(key: key);
  final AppRouter router = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        progressIndicatorTheme: const ProgressIndicatorThemeData(
          color: Color(0xff8f93ea),
        ),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: Color(0xff8f93ea),
        ),
      ),
      themeMode: ThemeMode.light,
      initialRoute: UrlPage.signIn,
      onGenerateRoute: router.generateRouter,
    );
  }
}
