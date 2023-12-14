import 'package:flutter/material.dart';
import 'package:hello_world_app/src/screens/counter/counter_screen.dart';

void main(List<String> args) {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //!!Sacar el icono de Debug
      debugShowCheckedModeBanner: false,
      //!!ajustes de theme, en este caso cambio la paleta de colores
      theme: ThemeData(colorSchemeSeed: Colors.indigo),
      home: const CounterScreen(),
    );
  }
}
