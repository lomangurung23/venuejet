import 'package:firebase_auth/firebase_auth.dart'; // Import firebase_auth
import 'package:flutter/material.dart';
import 'package:venuejet/user_auth/firebase_auth_implementation/firebase_auth_services.dart';//Import firebase_auth_services
import 'login_page.dart'; // Import login page


class SignUpPage extends StatelessWidget {
   SignUpPage({Key? key}) : super(key: key);

  final FirebaseAuthService _auth = FirebaseAuthService();
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

   void _signUp(BuildContext context) async {
     String userName = _userNameController.text.trim();
     String email = _emailController.text.trim();
     String password = _passwordController.text.trim();

     if (userName.isEmpty || email.isEmpty || password.isEmpty) {
       showValidationDialog(context, 'All fields are required.');
       return;
     }

     try {
       User? user = await _auth.signupWithEmailAndPassword(email, password, userName);

       if (user != null) {
         // Sign-up successful, show success message and then navigate to the login page
         showValidationDialog(context, 'Sign-up Successful for ${user.email}', () {
           Navigator.pushReplacement(
             context,
             MaterialPageRoute(builder: (context) => LoginPage()),
           );
         });
       } else {
         // Handle sign-up failure
         showValidationDialog(context, 'Sign-up failed. Please try again.');
       }
     } catch (e) {
       // Handle firebase errors
       showValidationDialog(context, 'An error occurred: $e');
     }
   }

// Show Validation Dialog
   void showValidationDialog(BuildContext context, String message, [Function? onSuccess]) {
     showDialog(
       context: context,
       builder: (BuildContext context) {
         return AlertDialog(
           title: Text('Message'),
           content: Text(message),
           actions: <Widget>[
             TextButton(
               onPressed: () {
                 Navigator.of(context).pop();
                 if (onSuccess != null) {
                   onSuccess();
                 }
               },
               child: Text('OK'),
             ),
           ],
         );
       },
     );
   }

   @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/Login-Screen-Design.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          padding: EdgeInsets.only(
            left: 120.0,
            right: 40.0,
            top: 40.0,
            bottom: 20.0,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Create an Account',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.indigo,
                ),
              ),
              SizedBox(height: 20.0),
              TextField(
                controller: _userNameController,
                decoration: InputDecoration(
                  labelText: 'User Name',
                  prefixIcon: Icon(Icons.person),
                ),
              ),
              SizedBox(height: 10.0),
              TextField(
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: 'Email',
                  prefixIcon: Icon(Icons.email),
                ),
              ),
              SizedBox(height: 10.0),
              TextField(
                controller: _passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Password',
                  prefixIcon: Icon(Icons.lock),
                ),
              ),
              SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: () => _signUp(context),
                style: ElevatedButton.styleFrom(
                  primary: Colors.blue,
                ),
                child: Text('Sign Up'),
              ),
              SizedBox(height: 10.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Already have an account?'),
                  TextButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => LoginPage()), //navigate to login page
                      );
                    },
                    style: TextButton.styleFrom(
                      primary: Colors.indigo,
                    ),
                    child: Text('Login.'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
