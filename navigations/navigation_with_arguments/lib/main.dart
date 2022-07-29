import 'package:flutter/material.dart';

import 'core/app_routes.dart';
import 'presenter/home_page.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.pink),
      initialRoute: HomePage.route,
      routes: appRoutes,
      onUnknownRoute: onUnknownRoute,
    ),
  );
}
