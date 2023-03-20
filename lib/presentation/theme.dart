import 'package:flutter/material.dart';

final _scheme = ColorScheme.fromSeed(seedColor: const Color(0xFFD44FB3)).copyWith(
  primary: const Color(0xFFD44FB3),
  secondary: const Color(0xFF47B17B),
);

const _textTheme = TextTheme(
  titleLarge: TextStyle(fontFamily: "Mulish", fontWeight: FontWeight.bold, fontSize: 22),
  titleMedium: TextStyle(fontFamily: "Mulish", fontWeight: FontWeight.bold, fontSize: 16),
);

final ThemeData theme = ThemeData(
    fontFamily: "Mulish",
    colorScheme: _scheme,
    cardColor: _scheme.primaryContainer,
    textTheme: _textTheme);
