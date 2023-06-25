import 'package:flutter/material.dart';
import 'package:jizeeshop/components/my_textfield.dart';
import 'package:jizeeshop/components/my_button.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  // text editing controller
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  // sign user in method
  void signUserIn() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
          child: Center(
        child: Column(
          children: [
            const SizedBox(height: 25),
            //logo
            const Icon(
              Icons.shop,
              size: 100,
            ),

            const SizedBox(height: 25),

            // welcome
            Text(
              'Welcome to JiZeeShop',
              style: TextStyle(
                color: Colors.grey[700],
                fontSize: 16,
              ),
            ),

            const SizedBox(height: 10),

            // username
            MyTextField(
              controller: usernameController,
              hintText: 'Username',
              obscureText: false,
            ),

            const SizedBox(height: 10),

            // password
            MyTextField(
              controller: passwordController,
              hintText: 'Password',
              obscureText: true,
            ),

            const SizedBox(height: 10),

            // forgot password
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'Forgot Password',
                    style: TextStyle(color: Colors.grey[600]),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 25),

            // sign in button
            MyButton(
              onTap: signUserIn,
            ),

            const SizedBox(height: 25),
          ],
        ),
      )),
    );
  }
}
