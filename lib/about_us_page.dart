import 'package:flutter/material.dart';

class AboutUsPage extends StatelessWidget {
  const AboutUsPage({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About Us'), //Title text
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 16),
            Text(
              'Welcome to Venue Jet',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.indigo
              ),
            ),
            SizedBox(height: 16),
            Text(
              'About Us:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.blueAccent
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Venue Jet is your one-stop solution for finding the perfect venues for your events and gatherings. Whether it\'s a wedding, conference, or a villa retreat, we have a diverse range of venues to suit your needs.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Text(
              'Our Mission:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.blueAccent
              ),
            ),
            SizedBox(height: 8),
            Text(
              'At Venue Jet, our mission is to simplify the venue booking process, making it easy for users to discover and book venues that match their preferences. We strive to provide a seamless and enjoyable experience for all our users.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Text(
              'Contact Us:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.blueAccent
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Have questions or feedback?\nReach out to us at info@venuejet.com',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
