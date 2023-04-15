import 'dart:ui';
import 'package:flutter/material.dart';

class ColorConstant {
  static Color black9007f = fromHex('#7f000000');

  static Color black9004c = fromHex('#4c000000');

  static Color red700 = fromHex('#e32424');

  static Color blueGray600 = fromHex('#4e588d');

  static Color gray300 = fromHex('#e3e2e2');

  static Color gray100 = fromHex('#f7f7f7');

  static Color teal300 = fromHex('#2eb9b8');

  static Color black90099 = fromHex('#99000000');

  static Color black900 = fromHex('#000000');

  static Color teal30066 = fromHex('#662eb9b8');

  static Color bluegray400 = fromHex('#888888');

  static Color blueGray900 = fromHex('#282a2c');

  static Color whiteA700 = fromHex('#ffffff');

  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }
}
