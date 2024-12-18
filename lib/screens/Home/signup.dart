import 'package:flutter/material.dart';

class signup extends StatefulWidget {
  const signup({super.key});

  @override
  _signupState createState() => _signupState();
}

class _signupState extends State<signup> {
  // Form State
  String email = ''; // To store email input
  String password = ''; // To store password input
  String notes = ''; // To store notes input
  String phone = '';

  String gender = 'Male'; // Default gender
  String status = 'Single'; // Default status
  double age = 18; // Default age
  bool receiveNotifications = false; // Notification preference
  bool agreeToTerms = false; // Terms agreement

  final _formKey = GlobalKey<FormState>();

  void _submitForm() {
    if (_formKey.currentState!.validate() && agreeToTerms) {
      // Debug log for submitted values
      debugPrint("=== Form Submitted ===");
      debugPrint("Email: $email");
      debugPrint("Password: $password");
      debugPrint("Gender: $gender");
      debugPrint("Status: $status");
      debugPrint("Age: ${age.toInt()}");
      debugPrint("Receive Notifications: $receiveNotifications");
      debugPrint("Agree to Terms: $agreeToTerms");
      debugPrint("Notes: $notes");

      // Success message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Form submitted successfully!')),
      );
    } else if (!agreeToTerms) {
      // Error if terms are not agreed
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('You must agree to the terms and conditions.')),
      );
    } else {
      // General error for invalid fields
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please fill in all required fields.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF40ac9c),
      appBar: AppBar(
        title: Text('Sign Up'),
        centerTitle: true,
        backgroundColor: const Color(0xFF203e5a),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Column(
                  children: [
                    Image.asset(
                      'Images/bentley.png', // Replace with your image URL
                      height: 100,
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Sign up with Car Rental!',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),

              // Email Field
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'Email',
                  prefixIcon: Icon(Icons.email),
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  }
                  if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                    return 'Please enter a valid email';
                  }
                  email = value; // Store email value directly
                  return null;
                },
              ),
              SizedBox(height: 16),

              // Password Field
              TextFormField(
                obscureText: true,
                decoration: InputDecoration(
                  hintText: 'Password',
                  prefixIcon: Icon(Icons.lock),
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your password';
                  }
                  if (value.length < 6) {
                    return 'Password must be at least 6 characters';
                  }
                  password = value; // Store password value directly
                  return null;
                },
              ),
              SizedBox(height: 16),
              TextFormField(
                obscureText: true,
                decoration: InputDecoration(
                  hintText: 'Confirm Password',
                  prefixIcon: Icon(Icons.lock),
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please renter your password';
                  }
                  if (value.length < 6) {
                    return 'Password must be at least 6 characters';
                  }
                  password = value; // Store password value directly
                  return null;
                },
              ),
              SizedBox(height: 16),
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'Phone Number',
                  prefixIcon: Icon(Icons.phone),
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your Phone Number';
                  }
                  phone = value; // Store Phone value directly
                  return null;
                },
              ),
              SizedBox(height: 16),

              SizedBox(height: 16),

              // Gender Radio Buttons
              Text('Gender:'),
              Row(
                children: [
                  Expanded(
                    child: RadioListTile(
                      title: Text('Male'),
                      value: 'Male',
                      groupValue: gender,
                      onChanged: (value) {
                        setState(() {
                          gender = value!;
                        });
                      },
                    ),
                  ),
                  Expanded(
                    child: RadioListTile(
                      title: Text('Female'),
                      value: 'Female',
                      groupValue: gender,
                      onChanged: (value) {
                        setState(() {
                          gender = value!;
                        });
                      },
                    ),
                  ),
                ],
              ),

              // Age Slider
              Text('Age: ${age.toInt()}'),
              Slider(
                value: age,
                min: 18,
                max: 100,
                divisions: 82,
                label: age.toInt().toString(),
                onChanged: (value) {
                  setState(() {
                    age = value;
                  });
                },
              ),
              SizedBox(height: 16),

              SizedBox(height: 16),

              // Terms Agreement Checkbox
              Row(
                children: [
                  Checkbox(
                    value: agreeToTerms,
                    onChanged: (value) {
                      setState(() {
                        agreeToTerms = value!;
                      });
                    },
                  ),
                  Expanded(
                    child: Text('I agree to the Terms and Conditions'),
                  ),
                ],
              ),

              SizedBox(height: 16),

              // Submit Button
              ElevatedButton(
                onPressed: _submitForm,
                child: Center(child: Text('Sign Up')),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
