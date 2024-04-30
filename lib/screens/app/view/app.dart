import 'package:delivery_app/global/services/auth/auth_gate.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:delivery_app/global/themes/theme_provider.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: const AuthGate(),
      theme: Provider.of<ThemeProvider>(context).themeData,
      // home: CustomBottomNavWidget(),
    );
  }
}