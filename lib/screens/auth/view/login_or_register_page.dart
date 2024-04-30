
import 'package:flutter/material.dart';

import 'package:delivery_app/screens/auth/view/login_screen.dart';
import 'package:delivery_app/screens/auth/view/register_screen.dart';

class LoginOrRegister extends StatefulWidget {
  const LoginOrRegister({super.key});

  @override
  State<LoginOrRegister> createState() => _LoginOrRegisterState();
}

class _LoginOrRegisterState extends State<LoginOrRegister> {

  /// Initally, show login page
  bool showLoginPage = true;

  /// toggle betwen login and register page 
  void togglePages() {
    setState(() {
      showLoginPage = !showLoginPage;
    });
  }


  @override
  Widget build(BuildContext context) {
    if (showLoginPage) {
      return LoginScreen(onTap: togglePages);
    } else {
      return RegisterScreen(onTap: togglePages);
    }
  }
}