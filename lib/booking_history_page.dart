import 'package:cloud_firestore/cloud_firestore.dart'; //// Import the FirebaseFirestore package to interact with Firebase Cloud Firestore
import 'package:firebase_auth/firebase_auth.dart'; //import firebase_auth
import 'package:flutter/material.dart';
import 'edit_booking_page.dart'; //import edit booking history page


class BookingHistoryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Booking History'),
      ),
      body: BookingList(),
    );
  }
}

class BookingList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Stream to listen for changes in the 'bookings' collection for the current user.
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance
          .collection('bookings')
          .where('userId', isEqualTo: FirebaseAuth.instance.currentUser?.uid)
          .snapshots(),
      builder: (context, snapshot) {
        // Handling different connection states.
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        // Displaying a message when there is no booking data.
        if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
          return Center(
            child: Text(
              'No booking history!',
              style: TextStyle(
                fontSize: 15,
              ),
            ),
          );
        }
        // Extracting booking data from the snapshot.
        List<Map<String, dynamic>> bookingData = snapshot.data!.docs.map((doc) {
          return {
            'bookingId': doc.id,
            'venueName': doc['venueName'],
            'date': doc['date'],
            'timeFrom': doc['timeFrom'],
            'timeTo': doc['timeTo'],
          };
        }).toList();
        // Displaying a list of booking items.
        return ListView.builder(
          itemCount: bookingData.length,
          itemBuilder: (context, index) {
            return _buildBookingItem(
              bookingData[index]['bookingId'] ?? '',
              bookingData[index]['venueName'] ?? '',
              bookingData[index]['date'] ?? '',
              bookingData[index]['timeFrom'] ?? '',
              bookingData[index]['timeTo'] ?? '',
              context,
            );
          },
        );
      },
    );
  }
  // Widget to build an individual booking item.
  Widget _buildBookingItem(
      String bookingId,
      String venueName,
      String date,
      String timeFrom,
      String timeTo,
      BuildContext context,
      ) {
    return Card(
      elevation: 5,
      margin: EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Venue: $venueName',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text('Date: $date'),
            Text('Time From: $timeFrom'),
            Text('Time To: $timeTo'),
          ],
        ),
        onTap: () {
          // Pass booking details to BookingPage
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => BookingPage(
                bookingId: bookingId,
                venueName: venueName,
                date: date,
                timeFrom: timeFrom,
                timeTo: timeTo,
              ),
            ),
          );
        },
      ),
    );
  }
}
// StatefulWidget for the Booking Details Page.
class BookingPage extends StatefulWidget {
  // Properties for booking details.
  final String bookingId;
  final String venueName;
  final String date;
  final String timeFrom;
  final String timeTo;
  final bool isEditing;
// Constructor for BookingPage.
  BookingPage({
    required this.bookingId,
    required this.venueName,
    required this.date,
    required this.timeFrom,
    required this.timeTo,
    this.isEditing = false,
  });

  @override
  _BookingPageState createState() => _BookingPageState();
}

// State class for the BookingPage.
class _BookingPageState extends State<BookingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Booking Details'), //Title text
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Venue: ${widget.venueName}',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.indigoAccent,
              ),
            ),
            SizedBox(height: 8),
            Text('Date: ${widget.date}',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.grey,
                )),
            SizedBox(height: 8),
            Text('Time From: ${widget.timeFrom}',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.grey,
                )),
            SizedBox(height: 8),
            Text('Time To: ${widget.timeTo}',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.grey,
                )),
            Divider(height: 20, thickness: 2), // divider line
            ElevatedButton(
              onPressed: () => _deleteBooking(),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.redAccent,
              ),
              child: Text(
                'Delete Booking',
                style: TextStyle(color: Colors.white),
              ),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                // Navigate to the EditBookingPage with the current booking details
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => EditBookingPage(
                      bookingId: widget.bookingId,
                      initialVenueName: widget.venueName,
                      initialDate: widget.date,
                      initialTimeFrom: widget.timeFrom,
                      initialTimeTo: widget.timeTo,
                    ),
                  ),
                );
              },
              child: Text(
                'Edit Booking',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
// Delete Booking function
  void _deleteBooking() async {
    try {
      User? user = FirebaseAuth.instance.currentUser;

      if (user != null) {
        CollectionReference bookings =
        FirebaseFirestore.instance.collection('bookings');

        // Delete the booking with the specified bookingId
        await bookings.doc(widget.bookingId).delete();

        // Show a dialog indicating successful deletion
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Booking Deleted'),
              content: Text('Your booking has been deleted!'),
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
        );}
    } catch (e) {
      print('Error deleting booking: $e');

      // Show an error dialog if deletion fails
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Error'),
            content: Text(
              'An error occurred while deleting the booking. Please try again.',
            ),
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


