import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yes_no_app/config/theme/app_theme.dart';
import 'package:yes_no_app/ui/providers/chat_provider.dart';
import 'package:yes_no_app/ui/screens/chat/chat_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      //! Instanciar los providers que vamos a usar
      providers: [ChangeNotifierProvider(create: (_) => ChatProvider())],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        //! Manejar el theme de la app
        theme: AppTheme(6).getThemeData(),
        title: 'Yes No App',
        home: const ChatScreen(),
      ),
    );
  }
}
