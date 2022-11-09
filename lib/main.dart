import 'package:flutter/material.dart';

import 'core/db/data_base_helper.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DataBaseHelper.instance.init();
  runApp(Container());
}
