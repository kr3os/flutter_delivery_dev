import 'package:delivery_app/global/services/auth/auth_service.dart';
import 'package:flutter/material.dart';

import 'package:delivery_app/components/my_button.dart';
import 'package:delivery_app/components/my_textfield.dart';

class RegisterScreen extends StatefulWidget {
  
  final void Function()? onTap;

  const RegisterScreen({
    super.key, 
    this.onTap
  });

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  /// Text editing controllers
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  // register method
  void register() async {
    /// get auth service
    final authService = AuthService();

    // check if passwords match - create user
    if (passwordController.text == confirmPasswordController.text) {
      // try creating user
      try {
        await authService.signUpWithEmailAndPassword(emailController.text, passwordController.text);
      } catch (err) {
        // display any errors
        showDialog(
          context: context, 
          builder: (context) => AlertDialog(
            title: Text(err.toString()),
          )
        );
      }
      // if password dont match -> show error
      showDialog(
        context: context, 
        builder: (context) => AlertDialog(
          title: Text("Passwords don't match"),
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
              color: Colors.green[200],
            ),
            /// message, app slogan
            
            Text(
              "Let's crete an account for you",
              style: TextStyle(
                fontSize: 16,
                color: Theme.of(context).colorScheme.inversePrimary
              ),
            ),

            /// Name texfield
            MyTextField(
              controller: nameController,
              hintText: 'Name',
              obscureText: false,
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

            /// password texfield
            MyTextField(
              controller: confirmPasswordController,
              hintText: 'Confirm Password',
              obscureText: true,
            ),
            
            /// Sign up button 
            MyButton(
              text: "Sign Up",
              onTap: register,
            ),

            const SizedBox(height: 20),


            /// Alrady a member? Login here
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Alrady a member?',
                  style: TextStyle(color: Theme.of(context).colorScheme.inversePrimary),
                ),
                
                const SizedBox(width: 20),
                
                GestureDetector(
                  onTap: widget.onTap,
                  child: Text(
                    'Login here',
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