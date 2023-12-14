import 'package:flutter/material.dart';

const List<Color> _colorThemes = [
  _customColor,
  Colors.blue,
  Colors.teal,
  Colors.green,
  Colors.yellow,
  Colors.orange,
  Colors.pink,
];
//! Para manejar los colores con hexadecimal hay que agregar primero 0XFF
const Color _customColor = Color(0XFF5C11D4);

// assert en el constructor para que valide datos
class AppTheme {
  int selectedColor = 0;
  AppTheme(this.selectedColor)
      : assert(selectedColor >= 0 && selectedColor < _colorThemes.length,
            "Colors must be between 0 and ${_colorThemes.length}");

  ThemeData getThemeData() {
    return ThemeData(colorSchemeSeed: _colorThemes[selectedColor]);
  }
}
