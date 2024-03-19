import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart'; // import introduction screen
import 'home_page.dart';  // Import Home page

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final introKey = GlobalKey<IntroductionScreenState>();

  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      key: introKey,
      pages: [
        PageViewModel(
          title: "Welcome to VenueJet",
          body: "Discover the perfect venues for your events!",
          image: _buildImage('assets/images/onboarding1.jpg'),
        ),
        PageViewModel(
          title: "Explore Featured Venues",
          body: "Find beautiful venues for weddings, conferences, and more.",
          image: _buildImage('assets/images/onboarding3.jpg'),
        ),
        PageViewModel(
          title: "Book Your Dream Venue",
          body: "Easily book your favorite venues for your special events.",
          image: _buildImage('assets/images/onboarding2.jpg'),
        ),
      ],
      onDone: () {
        // Navigate to the home page after onboarding screen
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => HomePage()),
        );
      },
      showSkipButton: true,
      skip: Text(
        "Skip",
        style: TextStyle(color: Colors.blueAccent),
      ),
      skipFlex: 0,
      nextFlex: 0,
      next: Icon(Icons.arrow_forward, color: Colors.blueAccent),
      done: Text(
        "Get Started",
        style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blueAccent),
      ),
      doneColor: Colors.transparent,
      skipColor: Colors.black,
      nextColor: Colors.blueAccent,
      dotsDecorator: DotsDecorator(
        size: Size(10.0, 10.0),
        color: Colors.blueAccent,
        activeColor: Colors.white,
        activeSize: Size(20.0, 10.0),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25.0)),
        ),
      ),
    );
  }

// Image
  Widget _buildImage(String assetName) {
    return Image.asset(
      assetName,
      width: 270,
    );
  }
}
