import 'package:cloud_firestore/cloud_firestore.dart'; // Import the FirebaseFirestore package to interact with Firebase Cloud Firestore
import 'package:firebase_auth/firebase_auth.dart'; // Import firebase_auth
import 'package:flutter/material.dart';

class EditBookingPage extends StatefulWidget {
  // Properties for initial booking details.
  final String bookingId;
  final String initialVenueName;
  final String initialDate;
  final String initialTimeFrom;
  final String initialTimeTo;

  // Constructor for EditBookingPage.
  EditBookingPage({
    required this.bookingId,
    required this.initialVenueName,
    required this.initialDate,
    required this.initialTimeFrom,
    required this.initialTimeTo,
  });

  @override
  _EditBookingPageState createState() => _EditBookingPageState();
}

class _EditBookingPageState extends State<EditBookingPage> {
  // TextEditingController for each input field.
  late TextEditingController venueNameController;
  late TextEditingController dateController;
  late TextEditingController timeFromController;
  late TextEditingController timeToController;

  @override
  void initState() {
    super.initState();
    // Initializing controllers with initial values.
    venueNameController = TextEditingController(text: widget.initialVenueName);
    dateController = TextEditingController(text: widget.initialDate);
    timeFromController = TextEditingController(text: widget.initialTimeFrom);
    timeToController = TextEditingController(text: widget.initialTimeTo);
  }

  @override
  void dispose() {
    // Disposing controllers to prevent memory leaks.
    venueNameController.dispose();
    dateController.dispose();
    timeFromController.dispose();
    timeToController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Booking'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: venueNameController,
              decoration: InputDecoration(labelText: 'Venue'),
              enabled: false,
            ),
            TextField(
              controller: dateController,
              decoration: InputDecoration(labelText: 'Date'),
            ),
            TextField(
              controller: timeFromController,
              decoration: InputDecoration(labelText: 'Time From'),
            ),
            TextField(
              controller: timeToController,
              decoration: InputDecoration(labelText: 'Time To'),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Save the edited booking details
                saveEditedBooking();
              },
              child: Text('Save Changes'),
            ),
          ],
        ),
      ),
    );
  }
// Function to save the edited booking details.
  void saveEditedBooking() async {
    try {
      User? user = FirebaseAuth.instance.currentUser;

      if (user != null) {
        CollectionReference bookings =
        FirebaseFirestore.instance.collection('bookings');

        // Update the booking details in Firestore.
        await bookings.doc(widget.bookingId).update({
          'venueName': venueNameController.text,
          'date': dateController.text,
          'timeFrom': timeFromController.text,
          'timeTo': timeToController.text,
        });
         // Dialog Box for successful booking update.
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Booking Updated'),
              content: Text('Your booking has been updated!'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('OK'),
                ),
              ],
            );
          },
        );
      }
    } catch (e) {
      print('Error updating booking in Firestore: $e'); // for handling firebase error incase
      // Dialog Box for error during update.
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Error'),
            content: Text(
                'An error occurred while updating the booking. Please try again.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }
}
