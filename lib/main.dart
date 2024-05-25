import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'presentation/routes/route_constants.dart';
import 'presentation/routes/routes.dart';
import 'presentation/theme/theme.dart';
import 'utils/setup_app.dart';

void main() async {
  await setupApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Reminder',
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.dark,
      darkTheme: ThemeData.dark(
        useMaterial3: true,
      ).copyWith(
        colorScheme: ColorScheme.fromSeed(seedColor: primaryColor),
        scaffoldBackgroundColor: blackColor,
      ),
      initialRoute: RouteList.initial,
      routes: Routes.routes,
    );
  }
}
