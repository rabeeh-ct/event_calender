import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../di/di.dart';

setupApp() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  // setupNotification();
  DependencyInjection.init();
  // await GetStorage.init();
}