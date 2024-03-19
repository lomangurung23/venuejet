import 'package:firebase_auth/firebase_auth.dart'; // Import firebase_auth
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart'; // Import Google_sign_in
import 'onboardingscreen.dart'; // Import onboarding screen
import 'sign_up.dart'; // Import signup page

class LoginPage extends StatelessWidget {
  LoginPage({Key? key});

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Future<void> _login(BuildContext context) async {
    String email = emailController.text.trim();
    String password = passwordController.text.trim();

    if (email.isEmpty || password.isEmpty) {
      showValidationDialog(context, 'All fields are required.');
      return;
    }

    try {
      // sign in with email and password
      UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      // User Credential will contain user, if login is successful
      User? user = userCredential.user;

      if (user != null) {
        // Login successful, navigate to the onboarding screen
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => OnboardingScreen()),
        );
      } else {
        // If login failure
        showValidationDialog(context, 'Login failed. Please check your email and password.');
      }
    } catch (e) {
      // Handles firebase errors
      showValidationDialog(context, 'An error occurred: $e');
    }
  }
// validation dialog
  void showValidationDialog(BuildContext context, String message) {
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
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }
  //Google Sign_in
  Future<void> _signInWithGoogle(BuildContext context) async {
    try {
      final GoogleSignIn _googleSignIn = GoogleSignIn();
      await _googleSignIn.signOut(); // Sign out before signing in

      final GoogleSignInAccount? googleSignInAccount = await _googleSignIn.signIn();
      if (googleSignInAccount == null) {
        return; // User canceled the Google sign-in
      }
      final GoogleSignInAuthentication googleSignInAuthentication =
      await googleSignInAccount.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );
      UserCredential userCredential = await FirebaseAuth.instance.signInWithCredential(credential);
      User? user = userCredential.user;
      if (user != null) {
        // Google sign-in successful, navigate to the onboarding screen
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => OnboardingScreen()),
        );
      }
    } catch (e) {
      // Handles the sign-in with Google account failure
      print('Error signing in with Google: $e');
    }
  }
// logout from google function
  void logout(BuildContext context) async {
    try {
      final GoogleSignIn googleSignIn = GoogleSignIn();
      await googleSignIn.signOut(); // Log out from Google

      await FirebaseAuth.instance.signOut(); // Log out from Firebase

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LoginPage()),
      );
    } catch (e) {
      print('Error during logout: $e');

    }
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
            top: 100.0,
            bottom: 50.0,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Login Here!',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.indigo,
                ),
              ),
              SizedBox(height: 20.0),
              TextField(
                controller: emailController,
                decoration: InputDecoration(
                  labelText: 'Email',
                  prefixIcon: Icon(Icons.email),
                ),
              ),
              SizedBox(height: 10.0),
              TextField(
                controller: passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Password',
                  prefixIcon: Icon(Icons.lock),
                ),
              ),
              SizedBox(height: 0.0),
              Align(
                alignment: Alignment.bottomRight,
                child: TextButton(
                  onPressed: () {
                  },
                  style: TextButton.styleFrom(
                    primary: Colors.indigo,
                  ),
                  child: Text('Forgot Password?'),
                ),
              ),
              SizedBox(height: 0.0),
              ElevatedButton(
                onPressed: () => _login(context),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueAccent,
                ),
                child: Text('Login'),
              ),
              SizedBox(height: 10.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 10.0),
                      child: Divider(
                        color: Colors.black,
                        thickness: 1.0,
                      ),
                    ),
                  ),
                  Text('Or'),
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 10.0),
                      child: Divider(
                        color: Colors.black,
                        thickness: 1.0,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 5.0),
              ElevatedButton(
                onPressed: () => _signInWithGoogle(context),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueAccent,
                ),
                child: Text('Sign In with Google'),
              ),
              SizedBox(height: 5.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't have an account?",
                    style: TextStyle(color: Colors.black),
                  ),
                  TextButton(
                    onPressed: () {
                      // Navigate to the registration page
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SignUpPage()),
                      );
                    },
                    style: TextButton.styleFrom(
                      primary: Colors.indigo,
                    ),
                    child: Text('Sign Up.'),
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

