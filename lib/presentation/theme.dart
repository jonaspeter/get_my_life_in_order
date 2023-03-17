import 'package:flutter/material.dart';

final _scheme = ColorScheme.fromSeed(seedColor: const Color(0xFFD44FB3));

final _textTheme = TextTheme(
  titleLarge: TextStyle(fontFamily: "Mulish", fontWeight: FontWeight.bold, fontSize: 22),
  titleMedium: TextStyle(fontFamily: "Mulish", fontWeight: FontWeight.bold, fontSize: 16),
);

final ThemeData theme = ThemeData(
    colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFFD44FB3)),
    cardColor: _scheme.primaryContainer,
    textTheme: _textTheme);
