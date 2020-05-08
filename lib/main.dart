import 'package:blindwind/di/injector.dart';
import 'package:blindwind/ui/root_page.dart';
import 'package:flutter/material.dart';
import 'constants/base_constants.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Injector.configure(Flavor.DEBUG);
    return MaterialApp(
      title: 'Blind Wind',
      theme: ThemeData(
        primarySwatch: PRIMARY_SWATCH_COLOR,
      ),
      home: RootPage(),
    );
  }
}
