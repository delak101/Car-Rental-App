import 'package:car_rental_app/screens/Home/car_home_screen.dart';
import 'package:car_rental_app/screens/Home/signup.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  // Form state variables
  String email = ''; // To store email input
  String password = ''; // To store password input
  bool rememberMe = false; // Remember Me checkbox state

  // Hardcoded login credentials
  final String validEmail = 'user@example.com';
  final String validPassword = '123456';

  void _signIn() {
    // Debug log for submitted values
    debugPrint("Email: $email");
    debugPrint("Password: $password");
    debugPrint("Remember Me: $rememberMe");

    // Check credentials
    if (email == validEmail && password == validPassword) {
      // Navigate to CarHomeScreen
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const CarHomeScreen()),
      );
    } else {
      // Show error snackbar
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Invalid email or password.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF40ac9c),
      appBar: AppBar(
        title: const Text('Sign In'),
        centerTitle: true,
        backgroundColor: const Color(0xFF203e5a),
      ),
      body: SingleChildScrollView(
        // Make the page scrollable
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Logo and Title
            Center(
              child: Column(
                children: [
                  Image.asset(
                    'Images/bentley.png',
                    height: 100,
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Sign in to Car Rental',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // Email Field
            TextFormField(
              decoration: const InputDecoration(
                hintText: 'Email',
                prefixIcon: Icon(Icons.email),
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                setState(() {
                  email = value; // Store email value directly
                });
                debugPrint("Email input: $email");
              },
            ),
            const SizedBox(height: 16),

            // Password Field
            TextFormField(
              obscureText: true,
              decoration: const InputDecoration(
                hintText: 'Password',
                prefixIcon: Icon(Icons.lock),
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                setState(() {
                  password = value; // Store password value directly
                });
                debugPrint("Password input: $password");
              },
            ),
            const SizedBox(height: 16),

            // Remember Me Checkbox
            Row(
              children: [
                Checkbox(
                  value: rememberMe,
                  onChanged: (value) {
                    setState(() {
                      rememberMe = value!; // Update rememberMe state
                    });
                    debugPrint("Remember Me: $rememberMe");
                  },
                ),
                const Text('Remember Me'),
              ],
            ),
            const SizedBox(height: 16),

            // Sign In Button
            ElevatedButton(
              onPressed: _signIn,
              child: const Center(child: Text('Sign In')),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const signup()),
                );
                //debugPrint('Navigated to Sign-Up Page');
              },
              child: const Center(child: Text('Sign Up')),
            ),

            // Navigation to Sign-Up
          ],
        ),
      ),
    );
  }
}
