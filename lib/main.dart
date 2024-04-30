import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:delivery_app/firebase_options.dart';

import 'package:delivery_app/global/models/restaurant.dart';
import 'package:delivery_app/global/themes/theme_provider.dart';

import 'package:delivery_app/screens/app/app_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(
    MultiProvider(providers: [
      /// Theme Provider
      ChangeNotifierProvider(
        create: (context) => ThemeProvider()),
      /// Restaurant Provider
      ChangeNotifierProvider(
        create: (context) => Restaurant()),
     ],
      child: const MyApp()
    ),
  );
}


