import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';// import carousel slider
import 'booking_page.dart';// import booking page


class FeaturedVenuePage extends StatelessWidget {
  final Map<String, String> selectedVenue;

  FeaturedVenuePage.FeaturedVenues({required this.selectedVenue});

  // Glimpses of the Venue images
  List<String> venue1 = [
    'assets/images/Heritage1.jpeg',
    'assets/images/Heritage2.jpeg',
    'assets/images/Heritage3.jpeg',
  ];
  List<String> venue2 = [
    'assets/images/teh1.jpeg',
    'assets/images/teh2.jpg',
    'assets/images/teh3.jpg',
    'assets/images/teh4.jpg',
  ];

  List<String> venue3 = [
    'assets/images/ha5.jpg',
    'assets/images/ha1.jpg',
    'assets/images/ha2.jpg',
    'assets/images/ha3.jpg',
    'assets/images/ha4.jpg',
  ];

  // Contact information for each venue
  Map<String, Map<String, String>> contactInfo = {
    'Heritage Garden': {
      'location': 'Sanepa, LALITPUR, NEPAL',
      'phone': '9849398917',
      'email': 'heritagegarden2016@gmail.com',
    },
    'The Everest Hotel': {
      'location': 'NEW BANESHWOR, KATHMANDU, NEPAL',
      'phone': '977-1-4780100',
      'email': 'sales@theeveresthotel.com',
    },
    'The Annapurna Hotel': {
      'location': 'Durbar Marg, Kathmandu 14229 Nepal',
      'phone': '+977-1- 4221711',
      'email': 'info@annapurna.com.np',
    },
  };

  @override
  Widget build(BuildContext context) {
    String venueDescription = '';

    // Check the selected venue and set the description accordingly
    if (selectedVenue['name'] == 'Heritage Garden') {
      venueDescription =
      'Heritage Garden is a conventional lobby with various administrations adaptable for any sort of occasion.Heritage Garden is situated at Sanepa, Lalitpur-2 (Old Gyanodaya School Premises). It has turned into an excellent choice to lead any of the private and social functions in Heritage Garden due to its nice rich imaginative anteroom lobby, convenient dining space, open bar, and adequate parking spot for 100 or more vehicles. Next to this, the intriguing food and mixed drink menu that HERITAGE GARDEN is offering are astounding what is enough of demonstrating us totally not the same as other existing event organizations and catering services in the country.';
    } else if (selectedVenue['name'] == 'The Everest Hotel') {
      venueDescription =
      'Regardless of whether you are searching for a relaxation lodging in Kathmandu, booking an occasion with your family, companions, and journey to Pashupatinath Temple, or even business inn, The Everest Hotel Kathmandu, hotel deals, offer and stay packages are organized to give you the best worth, address you every need and make recollections that will keep going for a lifetime.The Everest Hotel Kathmandu, hotel deals, offer and stay packages are curated to give you the best value, meet your every need and create memories that will last for a lifetime.';
    } else if (selectedVenue['name'] == 'The Annapurna Hotel') {
      venueDescription =
      'Located in Durbar Marg, Kathmandu premier street, 5-star Hotel Annapurna has a long history of excellence in the hospitality industry. Established in 1965 and named after Annapurna, the Goddess of Abundance, the Hotel provides the finest personal service and facilities in Nepal\'s fabled emerald valley, and its cultural, political and commercial capital. The Hotel has a total of 151 recently renovated Deluxe and Heritage guestrooms, including 5 suites, equipped with modern amenities such as the latest flat screen TV. The Hotel is also famous for its popular eating outlets. The Coffee Shop, Chinese restaurant, the Arniko Room, Ghar-e-Kabab - the Juneli Bar, the Hotel is entirely Wi-Fi enabled. With extensive banquet and conferencing'
          ' facilities, one of the largest hotel swimming pools, well-equipped gym, business center and the most prestigious shopping arcade.';
    }

    // Glimpse images based on the selected venue
    List<String> glimpseImages = [];
    if (selectedVenue['name'] == 'Heritage Garden') {
      glimpseImages = venue1;
    } else if (selectedVenue['name'] == 'The Everest Hotel') {
      glimpseImages = venue2;
    } else if (selectedVenue['name'] == 'The Annapurna Hotel') {
      glimpseImages = venue3;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Featured Venue'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Card(
          elevation: 8.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Image for the selected venue
                Container(
                  height: 200,
                  width: double.infinity,
                  child: ClipRRect(
                    borderRadius: BorderRadius.vertical(top: Radius.circular(15.0)),
                    child: Image.asset(
                      selectedVenue['imagePath'] ?? 'assets/images/default.jpg',//default image path
                      fit: BoxFit.cover,
                    ),
                  ),
                ),

                SizedBox(height: 16),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        selectedVenue['name'] ?? '',
                        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 8),
                      Text(
                        'Description: $venueDescription',
                        style: TextStyle(fontSize: 18),
                      ),
                      SizedBox(height: 16),

                      // Glimpse of the Venue
                      Text(
                        'Glimpse of the Venue',
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      // Carousel Slider for Glimpses
                      CarouselSlider(
                        options: CarouselOptions(
                          height: 200.0,
                          viewportFraction: 1.0,
                          enlargeCenterPage: false,
                          autoPlay: true,
                        ),
                        items: glimpseImages.map((imagePath) {
                          return Builder(
                            builder: (BuildContext context) {
                              return Container(
                                width: MediaQuery.of(context).size.width,
                                margin: EdgeInsets.symmetric(horizontal: 5.0),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(15.0),
                                  child: Image.asset(
                                    imagePath,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              );
                            },
                          );
                        }).toList(),
                      ),
                      SizedBox(height: 20),

                      // Contact Information
                      Text(
                        'Contact Information',
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Row(
                        children: [
                          Icon(Icons.location_on, color: Colors.blueAccent,size: 30),
                          SizedBox(height:50,width: 10),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Location:', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                              Text(contactInfo[selectedVenue['name']]!['location'] ?? '', style: TextStyle(fontSize: 12)),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 8),
                      Row(
                        children: [
                          Icon(Icons.phone, color: Colors.blueAccent,size: 30),
                          SizedBox(width: 8),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Phone:', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                              Text(contactInfo[selectedVenue['name']]!['phone'] ?? '', style: TextStyle(fontSize: 12)),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 8),
                      Row(
                        children: [
                          Icon(Icons.email, color: Colors.blueAccent,size: 30),
                          SizedBox(width: 8),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Email:', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                              Text(contactInfo[selectedVenue['name']]!['email'] ?? '', style: TextStyle(fontSize: 12)),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 20),

                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => BookingPage(
                              initialVenueName: selectedVenue['name'] ?? '',
                            )),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.indigo,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Text(
                            'Book Now',
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                      ),

                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
