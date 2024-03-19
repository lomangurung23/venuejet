import 'package:firebase_auth/firebase_auth.dart'; //import firebase_auth
import 'package:flutter/material.dart';
import 'about_us_page.dart'; // import about us page
import 'login_page.dart'; //import login page
import 'booking_history_page.dart'; //import booking history page


class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key});

  @override
  Widget build(BuildContext context) {
    User? user = FirebaseAuth.instance.currentUser;
    return Scaffold(
      appBar: AppBar(
        title: Text('My Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Center(
              child: CircleAvatar(
                radius: 30,
                backgroundImage: AssetImage('assets/images/user_avatar.png'), //Profile Image
              ),
            ),
            SizedBox(height: 16),
            Center(
              child: Text(
                user?.email ?? '', // Using the null-aware operator to handle null user or email
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey
                ),
              ),
            ),

            _buildOvalButtonCard(
              'Booking History',
                  () {
                // Handle booking history button tap
                _navigateToBookingHistory(context);
              },
            ),
            _buildOvalButtonCard(
              'About Us',
                  () {
                // Handle booking history button tap
                _navigateToAboutUsPage(context);
              },
            ),
            _buildOvalButtonCard('Contact Us', 'Handle Contact Us button tap'),
            _buildOvalButtonCard('Follow us on Twitter', 'Handle Twitter button tap'),

            SizedBox(height: 15),
            ElevatedButton(
              onPressed: () async {
                // Show a confirmation dialog
                await _showLogoutConfirmationDialog(context);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueAccent,
              ),
              child: Text('Logout'),
            ),
          ],
        ),
      ),
    );
  }

  //  oval-shaped button card
  Widget _buildOvalButtonCard(dynamic buttonText, dynamic onTapAction) {
    return Card(
      elevation: 5,
      margin: EdgeInsets.all(15),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: ListTile(
        title: Text(
          buttonText,
          style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.indigo
          ),
        ),
        onTap: () {
          onTapAction();
        },
      ),
    );
  }

  //Function to show the logout confirmation dialog
  Future<void> _showLogoutConfirmationDialog(BuildContext context) async {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Logout Confirmation'),
          content: Text('Are you sure you want to logout?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () async {
                Navigator.of(context).pop(); // Close the dialog
                await _logoutAndNavigateToLoginPage(context);
                // Do not show validation dialog after logout
              },
              child: Text('Logout'),
            ),
          ],
        );
      },
    );
  }

  // Logout and navigate to login page
  Future<void> _logoutAndNavigateToLoginPage(BuildContext context) async {
    try {
      await FirebaseAuth.instance.signOut();
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginPage()));
    } catch (e) {
      print('Error during logout: $e');
      // Handle logout failure if needed
    }
  }

  // navigate to Booking History page
  void _navigateToBookingHistory(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => BookingHistoryPage(
    )));
  }

  //Navigate to About us page
  void _navigateToAboutUsPage(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => AboutUsPage()));
  }
}
