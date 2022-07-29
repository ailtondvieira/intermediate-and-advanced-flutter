import 'package:flutter/material.dart';

import '../presenter/home_page.dart';
import '../presenter/notfound_page.dart';
import '../presenter/three_page.dart';
import '../presenter/two_page.dart';

var appRoutes = {
  HomePage.route: (context) => const HomePage(),
  TwoPage.route: (context) => const TwoPage(),
  ThreePage.route: (context) => const ThreePage(),
};

var onUnknownRoute = (context) {
  return MaterialPageRoute(
    builder: (context) {
      return const NotfoundPage();
    },
  );
};