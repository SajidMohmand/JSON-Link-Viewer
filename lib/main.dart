import 'package:flutter/material.dart';
import 'package:flutter_json_view/flutter_json_view.dart';

import 'home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
