import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart'; //import Carousel slider
import 'booking_page.dart'; // import booking page

class VenueDetailPage extends StatefulWidget {

  final Map<String, String> selectedVenue;

  const VenueDetailPage({Key? key, required this.selectedVenue}) : super(key: key);

  @override
  State<VenueDetailPage> createState() => _VenueDetailPageState();
}

class _VenueDetailPageState extends State<VenueDetailPage> {

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
  List<String> venue4 = [
    'assets/images/gh1.jpeg',
    'assets/images/gh2.jpeg',
    'assets/images/gh3.jpeg',
    'assets/images/gh4.jpeg',
    'assets/images/gh5.jpeg',
  ];
  List<String> venue5 = [
    'assets/images/hs1.jpg',
    'assets/images/hs2.jpg',
    'assets/images/hs3.jpg',
    'assets/images/hs4.jpg',
  ];
  List<String> venue6 = [
    'assets/images/Ar1.jpeg',
    'assets/images/Ar2.jpeg',
    'assets/images/Ar3.jpeg',
    'assets/images/Ar4.jpeg',
  ];
  List<String> venue7 = [
    'assets/images/hcv1.jpeg',
    'assets/images/hcv2.jpeg',
  ];
  List<String> venue8 = [
    'assets/images/tsk1.jpg',
    'assets/images/tsk2.jpg',
    'assets/images/tsk3.jpg',
    'assets/images/tsk4.jpg',
  ];
  List<String> venue9 = [
    'assets/images/hyny0.jpeg',
    'assets/images/hyny1.jpeg',
    'assets/images/hyny2.jpeg',
    'assets/images/hyny3.jpeg',
    'assets/images/hyny4.jpeg'
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
    'Grand Hotel': {
      'location': 'Tahachal, 12872 Kathmandu, Nepal',
      'phone': '977-01-4700694/ 4701483',
      'email': 'kathmandugrandhotel@gmail.com'
    },
    'Hotel Shanker': {
      'location': 'HOTEL SHANKER KATHMANDU, NEPAL',
      'phone': '+977-1-4410151',
      'email': 'kathmanduhotelsnk@gmail.com'
    },
    'Alice Reception': {
      'location': 'ALICE RECEPTIONS, KATHMANDU, NEPAL',
      'phone': '+977-9801236940/9801236941',
      'email': 'info@alicereceptions.com'
    },
    'Hotel Country Villa': {
      'location': 'Address Nagarkot (Mandan-Deupur, Kavre), Nepal',
      'phone': '+977 - 1 - 6680127/28',
      'email': 'reservation@hotelcountryvilla.com'
    },
    'The Soaltee Kathmandu': {
      'location': 'Post Box 97, Tahachal, Kathmandu, Nepal',
      'phone': '+977 1 4273999',
      'email': 'res.ktm@soaltee.com or shl@soaltee.com'
    },
    'Hotel Yak & Yeti': {
      'location': 'Durbar Marg Kathmandu, Nepal 44600',
      'phone': '+977 1-424-8999',
      'email': 'reservation@yakandyeti.com.np'
    },
  };

  @override
  Widget build(BuildContext context) {
    String venueDescription = '';

    // Check selected venue and set the description accordingly to each venue
    if (widget.selectedVenue['name'] == 'Heritage Garden') {
      venueDescription =
      'Heritage Garden is a conventional lobby with various administrations adaptable for any sort of occasion.Heritage Garden is situated at Sanepa, Lalitpur-2 (Old Gyanodaya School Premises). It has turned into an excellent choice to lead any of the private and social functions in Heritage Garden due to its nice rich imaginative anteroom lobby, convenient dining space, open bar, and adequate parking spot for 100 or more vehicles. Next to this, the intriguing food and mixed drink menu that HERITAGE GARDEN is offering are astounding what is enough of demonstrating us totally not the same as other existing event organizations and catering services in the country.';
    } else if (widget.selectedVenue['name'] == 'The Everest Hotel') {
      venueDescription =
      'Regardless of whether you are searching for a relaxation lodging in Kathmandu, booking an occasion with your family, companions, and journey to Pashupatinath Temple, or even business inn, The Everest Hotel Kathmandu, hotel deals, offer and stay packages are organized to give you the best worth, address you every need and make recollections that will keep going for a lifetime.The Everest Hotel Kathmandu, hotel deals, offer and stay packages are curated to give you the best value, meet your every need and create memories that will last for a lifetime.';
    } else if (widget.selectedVenue['name'] == 'The Annapurna Hotel') {
      venueDescription =
      'Located in Durbar Marg, Kathmandu premier street, 5-star Hotel Annapurna has a long history of excellence in the hospitality industry. Established in 1965 and named after Annapurna, the Goddess of Abundance, the Hotel provides the finest personal service and facilities in Nepal\'s fabled emerald valley, and its cultural, political and commercial capital. The Hotel has a total of 151 recently renovated Deluxe and Heritage guestrooms, including 5 suites, equipped with modern amenities such as the latest flat screen TV. The Hotel is also famous for its popular eating outlets. The Coffee Shop, Chinese restaurant, the Arniko Room, Ghar-e-Kabab - the Juneli Bar, the Hotel is entirely Wi-Fi enabled. With extensive banquet and conferencing'
          ' facilities, one of the largest hotel swimming pools, '
          'well-equipped gym, business center and the most prestigious shopping arcade.';
    }
    else if (widget.selectedVenue['name'] == 'Grand Hotel') {
      venueDescription =
      'Situated in Kathmandu Valley, this hotel is 2 km from Civil Mall, '
          'QFX Cinema and Bhimsen Tower. It houses 4 dining options, an outdoor pool and a spa.'
          ' Wi-Fi is accessible for free in its public areas. At Aromates Bar, guests can relax with a drink, while admiring views of the Himalayan range and the Kathmandu Valley. Alternatively, Jharna Tea Lounge provides an assortment of tea time pastries, coffee and tea, and other refreshments.Grand Hotel provides meeting/banqueting amenities, a business centre and a tour desk. Laundry, currency exchange and car rental services are available.';
    }
    else if (widget.selectedVenue['name'] == 'Hotel Shanker') {
      venueDescription =
      'Hotel Shankar located in central capital Kathmandu is a heritage hotel, housed in a nineteenth-century royal palace within instant strolling distance to famous spots Thamel and Durbar Marg, ''Kathmandu tourist hubs.Regardless of whether you are arranging a basic one-day meeting, an intricate extended gathering, ''or a romantic wedding that you will value perpetually, you will observe that our spacious midtown ''Kathmandu offices offer everything to address your issues. Hotel Shankar, Kathmandu is the possible spot to have your occasion in the event that your needs are solace, custom, taste, and credibility.Between the recently remodeled Kailash - Mansarovar Hall and our great front lawn, you can easily have enormous occasions - - Weddings or Conferences for up to 1200 people.Hotel Shankar additionally has sufficient parking facilities to address your issues.The radiant Durbar Hall is an illustration of a common durbar found in Rana castles. It has a floor area of approximately 1811 square feet and is ideal for facilitating gatherings or conferences/meetings. The One-Eyed Hall is contiguous to the Durbar Hall.';
    }
    else if (widget.selectedVenue['name'] == 'Alice Reception') {
      venueDescription =
      'We sincerely welcome you all to Alice Receptions. We are devoted to getting sorted out your occasions effectively by furnishing a lovely environment with classy food. After the fruitful endeavor of Alice eatery, we chose to accompany a banquet service with various preferences and associations in delightful and bountiful premises here in Gairidhara.Alice Reception Main hall is Revas Ball Room which is 5000 sq. ft. in area. It can be set for theatre and table view.Dimensions :46 ft x 109ft (5000 sq ft.)Useful for: Meetings, Conference, Receptions, Seminar, Dining.Sano Hall is a combination hall for Revas Hall or Novia Hall. The Sano Hall has 2000 sq. ft. in Area.Dimensions: 28ft x 60ft (1680 sq ft.)Useful for: Small Meetings, SeminarTheatre view capacity: 120 PaxTable View capacity: 80 PaxFacilities: Movable Projector, Central A/C, 350 Car Parking';
    }
    else if (widget.selectedVenue['name'] == 'Hotel Country Villa') {
      venueDescription =
      'Hotel Country Villa is strategically placed on the top of Nagarkot hill, thus offering the best view of the spectacular show upfront. It encapsulates all the elements that set Nagarkot apart. It showcases nature at her best, and thereby catapults its dwellers to the romantic self and promises of a splendid stay.It is only 28 km from the international airport. The hotel area is vastly spacious; it is spread in 2.51 acre land. It is situated at 7,200 feet from the sea level. Here, you float with the clouds and can give audience to the drama unfolding the spectacle of the sunrise and the sunset from very close.Promises are not mere words when it comes to materializing the dreams people have with Hotel Country Villa. This is also because here nature is in alignment with human endeavors. Even if amidst nature bounty, modern amenities are plentiful. The local and the international tourists surrender themselves to the guilty pleasures on offer at Country Villa. From the architecture to the interior and the delectable cuisines everything has been prepared to surpass people’s expectation.Enjoy a family holiday or quality moments with friends, this holiday get-away is perfect for both.  The place is also ideal for hosting seminars or picnics. However, if your target is solitude, do not fret; the place molds itself according to your need.Your search for holistic rejuvenation rests here. It is everything a man needs to be transported to a place of bliss. You need to experience it to believe it!';
    }
    else if (widget.selectedVenue['name'] == 'The Soaltee Kathmandu') {
      venueDescription = 'Luxurious accommodation in Kathmandu is provided at The Soaltee Kathmandu, Kathmandu-Soaltee, spread over 12 acres of peaceful gardens.The Soaltee Kathmandu is 3 km from Swayambhunath Stupa Shrine and 4 km from the temples at Darbaar Square. It is 6 km from Pashupatinath Temple. Tribhuvan International Airport is 8 km away.The conference venue boasts an impressive array of facilities, making it an ideal choice for hosting a variety of events. With a total of 10 well-equipped meeting rooms, the venue offers a versatile space that spans 33,029 square feet. The meeting rooms can collectively accommodate up to 1,200 people, providing ample space for large gatherings or multiple concurrent sessions. Key personnel, including Sumati Shakya and Crown Meeting Direct, ensure seamless coordination and assistance throughout the event.';
    }
    else if (widget.selectedVenue['name'] == 'Hotel Yak & Yeti') {
      venueDescription = 'This conference venue is characterized by its intimate setting and comprehensive facilities, making it a prime choice for a variety of events. The venue features a single meeting room, generously spanning 14,308 square feet and accommodating up to 1,000 people. In addition to the meeting space, the venue offers a total exhibit area of 4,100 square feet, providing a dynamic backdrop for presentations and displays.Key personnel, led by Mila Rai, the Director of Sales and Marketing, contribute to the seamless organization and execution of events. The venue is well-equipped with essential meeting facilities, including A-V equipment, a business center, copier, personal computer, fax services, and administrative support. Attendees can stay connected with wireless internet access available in the meeting room. With a focus on both functionality and comfort, this venue is poised to meet the diverse needs of conferences and events, ensuring a successful and productive experience for all participants.';
    }

    // Glimpse images based on the selected venue
    List<String> glimpseImages = [];
    if (widget.selectedVenue['name'] == 'Heritage Garden') {
      glimpseImages = venue1;
    } else if (widget.selectedVenue['name'] == 'The Everest Hotel') {
      glimpseImages = venue2;
    } else if (widget.selectedVenue['name'] == 'The Annapurna Hotel') {
      glimpseImages = venue3;
    } else if (widget.selectedVenue['name'] == 'Grand Hotel') {
      glimpseImages = venue4;
    } else if (widget.selectedVenue['name'] == 'Hotel Shanker') {
      glimpseImages = venue5;
    } else if (widget.selectedVenue['name'] == 'Alice Reception') {
      glimpseImages = venue6;
    } else if (widget.selectedVenue['name'] == 'Hotel Country Villa') {
      glimpseImages = venue7;
    }else if (widget.selectedVenue['name'] == 'The Soaltee Kathmandu') {
      glimpseImages = venue8;
    }else if (widget.selectedVenue['name'] == 'Hotel Yak & Yeti') {
      glimpseImages = venue9;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Venue Detail'), //Title text
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
                    borderRadius: BorderRadius.vertical(
                        top: Radius.circular(15.0)),
                    child: Image.asset(
                      widget.selectedVenue['imagePath'] ??
                          'assets/images/default.jpg',
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
                        widget.selectedVenue['name'] ?? '',
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      // Favorite Button

                      SizedBox(height: 8),
                      Text(
                        'Description: $venueDescription',
                        style: TextStyle(fontSize: 18),
                      ),
                      SizedBox(height: 16),

                      // Glimpse of the Venue
                      Text(
                        'Glimpse of the Venue',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
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
                                width: MediaQuery
                                    .of(context)
                                    .size
                                    .width,
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
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Row(
                        children: [
                          Icon(Icons.location_on, color: Colors.blueAccent,
                              size: 30),
                          SizedBox(height: 50, width: 10),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Location:', style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold)),
                              Text(contactInfo[widget
                                  .selectedVenue['name']]!['location'] ?? '',
                                  style: TextStyle(fontSize: 12)),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 8),
                      Row(
                        children: [
                          Icon(Icons.phone, color: Colors.blueAccent, size: 30),
                          SizedBox(width: 8),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Phone:', style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold)),
                              Text(contactInfo[widget
                                  .selectedVenue['name']]!['phone'] ?? '',
                                  style: TextStyle(fontSize: 12)),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 8),
                      Row(
                        children: [
                          Icon(Icons.email, color: Colors.blueAccent, size: 30),
                          SizedBox(width: 8),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Email:', style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold)),
                              Text(contactInfo[widget
                                  .selectedVenue['name']]!['email'] ?? '',
                                  style: TextStyle(fontSize: 12)),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 20),

                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) =>
                                BookingPage(
                                  initialVenueName: widget
                                      .selectedVenue['name'] ?? '',
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

