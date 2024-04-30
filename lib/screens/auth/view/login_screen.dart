
import 'package:delivery_app/global/services/auth/auth_service.dart';
import 'package:flutter/material.dart';

import 'package:delivery_app/components/my_textfield.dart';
import 'package:delivery_app/components/my_button.dart';

import 'package:delivery_app/screens/home/home_core.dart';

class LoginScreen extends StatefulWidget {

  final void Function()? onTap;

  const LoginScreen({
    super.key,
    required this.onTap
  });

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  /// Text editing controllers
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  /// Login method
  void login() async {
    /// fill out auth here...
    final authService = AuthService();

      // Try sign in
      try {
        await authService.signInWithEmailAndPassword(emailController.text, passwordController.text);
      } catch (err) {
        // display any errors
        showDialog(
          context: context, 
          builder: (context) => AlertDialog(
            backgroundColor: Theme.of(context).colorScheme.background,
            title: Text(err.toString()),
          )
        );
      
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            /// Logo
            Icon(
              Icons.lock_open_rounded,
              size: 100,
              color: Theme.of(context).colorScheme.inversePrimary,
            ),
            /// message, app slogan
            
            Text(
              'Food Delivery App',
              style: TextStyle(
                fontSize: 16,
                color: Theme.of(context).colorScheme.inversePrimary
              ),
            ),
        
            const SizedBox(height: 20),
        
            /// password texfield
            MyTextField(
              controller: emailController,
              hintText: 'E-Mail',
              obscureText: false,
            ),

            const SizedBox(height: 20),
            
            /// password texfield
            MyTextField(
              controller: passwordController,
              hintText: 'Password',
              obscureText: true,
            ),
            
            const SizedBox(height: 20),
            
            /// sign in button 
            MyButton(
              text: "Sign In",
              onTap: login,
            ),

            const SizedBox(height: 20),


            /// not a meber? rtegister now
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Not a member?',
                  style: TextStyle(color: Theme.of(context).colorScheme.inversePrimary),
                ),
                
                const SizedBox(width: 20),
                
                GestureDetector(
                  onTap: widget.onTap,
                  child: Text(
                    'Register now',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.inversePrimary,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}