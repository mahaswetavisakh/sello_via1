import 'dart:ui';

import 'package:flutter/material.dart';

class Const{
static const ScreenBg= BoxDecoration(
  gradient: LinearGradient(
    colors: [Colors.red, Colors.purple],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  ),
);

static const ButtonColour=LinearGradient(colors: [Colors.red, Colors.purple]);

static Color primaryColor=const Color(0xFFFA280C);
}