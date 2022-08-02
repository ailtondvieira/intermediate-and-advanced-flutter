
import 'package:flutter/material.dart';

import 'presenter/home/home_page.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.pink),
      home: const HomePage(),
    ),
  );
}
