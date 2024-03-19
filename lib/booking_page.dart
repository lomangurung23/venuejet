import 'package:cloud_firestore/cloud_firestore.dart';// Import the FirebaseFirestore package to interact with Firebase Cloud Firestore
import 'package:firebase_auth/firebase_auth.dart'; // // Importing the firebase_auth package for authentication.
import 'package:flutter/material.dart';

class BookingPage extends StatefulWidget {
  // Property for the initial venue name.
  final String initialVenueName;
  // Constructor for BookingPage.
  BookingPage({required this.initialVenueName});

  @override
  _BookingPageState createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage> {
  // Controller for the venue name text field.
  TextEditingController venueController = TextEditingController();
  // Variables to store selected date, time, event type, and venue.
  DateTime? selectedEventOn = DateTime.now();
  DateTime? selectedEventUntil = DateTime.now();
  TimeOfDay selectedTimeFrom = TimeOfDay.now();
  TimeOfDay selectedTimeTo = TimeOfDay.now();
  String selectedEventType = 'Celebration';
  String selectedVenue = '';


  @override
  void initState() {
    super.initState();
    // Setting the initial venue name to the controller
    venueController.text = widget.initialVenueName;
    // Setting the initial venue name to the state variable
    selectedVenue = widget.initialVenueName;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Book Your Venue'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            padding: EdgeInsets.all(16),
            margin: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Event Booking',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 20),
                TextField(
                  controller: venueController,
                  decoration: InputDecoration(labelText: 'Venue Name'),
                  enabled: false,
                  onChanged: (value) {
                    setState(() {
                      selectedVenue = value;
                    });
                  },
                ),
                SizedBox(height: 20),
                buildDateTimePicker(
                  label: 'Event On',
                  selectedDate: selectedEventOn,
                  onDateChanged: _selectEventOnDate,
                ),
                SizedBox(height: 20),
                buildDateTimePicker(
                  label: 'Event Until',
                  selectedDate: selectedEventUntil,
                  onDateChanged: _selectEventUntilDate,
                ),
                SizedBox(height: 20),
                buildTimePicker(
                  label: 'Time From',
                  selectedTime: selectedTimeFrom,
                  onTimeChanged: _selectTimeFrom,
                ),
                SizedBox(height: 20),
                buildTimePicker(
                  label: 'Time To',
                  selectedTime: selectedTimeTo,
                  onTimeChanged: _selectTimeTo,
                ),
                SizedBox(height: 20),
                buildEventTypeDropdown(),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: () => _BookingConfirmation(),
                      child: Text('Confirm Booking'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
//Date Picker
  Widget buildDateTimePicker({
    required String label,
    required DateTime? selectedDate,
    required Function() onDateChanged,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label),
        InkWell(
          onTap: onDateChanged,
          child: Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(5),
            ),
            child: Text(
              selectedDate?.toLocal().toString().split(' ')[0] ?? 'Select Date',
              style: TextStyle(fontSize: 16),
            ),
          ),
        ),
      ],
    );
  }

//Time Picker
  Widget buildTimePicker({
    required String label,
    required TimeOfDay selectedTime,
    required Function() onTimeChanged,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label),
        InkWell(
          onTap: onTimeChanged,
          child: Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(5),
            ),
            child: Text(
              selectedTime.format(context),
              style: TextStyle(fontSize: 16),
            ),
          ),
        ),
      ],
    );
  }

//EVent type dropdown
  Widget buildEventTypeDropdown() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Event Type'),
        DropdownButton<String>(
          value: selectedEventType,
          onChanged: (String? newValue) {
            setState(() {
              selectedEventType = newValue ?? 'Celebration';
            });
          },
          //Items
          items: <String>[
            'Celebration',
            'Meeting',
            'Conference',
            'Wedding',
            'Other'
          ].map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ),
      ],
    );
  }

  // Function to select the event on date.
  Future<void> _selectEventOnDate() async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedEventOn ?? DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2101),
    );
    if (picked != null) {
      setState(() {
        selectedEventOn = picked;
      });
    }
  }
  // Function to select the event until date.
  Future<void> _selectEventUntilDate() async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedEventUntil ?? selectedEventOn ?? DateTime.now(),
      firstDate: selectedEventOn ?? DateTime.now(),
      lastDate: DateTime(2101),
    );
    if (picked != null) {
      setState(() {
        selectedEventUntil = picked;
      });
    }
  }

// Function to select the time from.
  Future<void> _selectTimeFrom() async {
    TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: selectedTimeFrom,
    );
    if (picked != null) {
      setState(() {
        selectedTimeFrom = picked;
      });
    }
  }
  // Function to select the time to.
  Future<void> _selectTimeTo() async {
    TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: selectedTimeTo,
    );
    if (picked != null) {
      setState(() {
        selectedTimeTo = picked;
      });
    }
  }
// Booking Confirmation Function
  void _BookingConfirmation() async {
    try {
      User? user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        CollectionReference bookings = FirebaseFirestore.instance.collection('bookings');

        // Checks if there are any overlapping bookings for the selected venue and date
        QuerySnapshot overlappingBookings = await bookings
            .where('venueName', isEqualTo: selectedVenue)
            .where('date', isEqualTo: selectedEventOn?.toLocal().toString().split(' ')[0] ?? '')
            .get();

        bool hasOverlap = overlappingBookings.docs.any((booking) {
          String existingTimeFrom = booking['timeFrom'];
          String existingTimeTo = booking['timeTo'];

          return isTimeRangeOverlap(
            existingTimeFrom,
            existingTimeTo,
            selectedTimeFrom.format(context),
            selectedTimeTo.format(context),
          );
        });

        if (hasOverlap) {
        }
        // Continue with the booking if the venue is available
        String newBookingId = FirebaseFirestore.instance.collection('bookings').doc().id;
        await bookings.doc(newBookingId).set({
          'userId': user.uid,
          'venueName': selectedVenue,
          'date': selectedEventOn?.toLocal().toString().split(' ')[0] ?? '',
          'eventUntil': selectedEventUntil?.toLocal().toString().split(' ')[0] ?? '',
          'timeFrom': selectedTimeFrom.format(context),
          'timeTo': selectedTimeTo.format(context),
          'eventType': selectedEventType,
        });
        // Dialog Box
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Booking Confirmed'),
              content: Text('Your booking has been confirmed!'),
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
      // Print for firebase error
      print('Error adding booking to Firestore: $e');

      // Display a message for same bookings
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Booking Failed'),
            content: Text('Sorry, this venue has already been booked for the selected date and time.'),
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
//  Checks if there is an overlap between an existing time range and a new time range.
  bool isTimeRangeOverlap(String existingTimeFrom, String existingTimeTo, String newTimeFrom, String newTimeTo) {
    DateTime existingFrom = DateTime.parse(existingTimeFrom);
    DateTime existingTo = DateTime.parse(existingTimeTo);
    DateTime newFrom = DateTime.parse(newTimeFrom);
    DateTime newTo = DateTime.parse(newTimeTo);

    return (newFrom.isBefore(existingTo) && newTo.isAfter(existingFrom)) ||
        (existingFrom.isBefore(newTo) && existingTo.isAfter(newFrom));
  }

}
