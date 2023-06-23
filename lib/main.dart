import 'package:flutter/material.dart';
import 'package:imc_calculo/Home.dart';
import 'package:imc_calculo/color_schemes.g.dart';

void main() {
  runApp(MaterialApp(
    home: Home(),
    debugShowCheckedModeBanner: false,
    theme: ThemeData(useMaterial3: true, colorScheme: lightColorScheme),
  ));
}