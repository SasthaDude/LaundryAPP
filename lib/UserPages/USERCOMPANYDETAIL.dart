import 'dart:io';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:video_player/video_player.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:whatsapp_unilink/whatsapp_unilink.dart';


class userCompanyDetailsViewPage extends StatefulWidget {
  @override
  _userCompanyDetailsViewPageState createState() => _userCompanyDetailsViewPageState();
}

class _userCompanyDetailsViewPageState extends State<userCompanyDetailsViewPage> {
  bool isLiked = false;
  bool isDisliked = false;
  int selectedIndex = 0;
  List<Widget> tabs = [
    clientside(businessHours: {},),
    ReviewsTab(),
    ServicesTab(),
    PhotoVideosTab(),
  ];

  List<String> tabTitles = ["Overview", "Reviews", "Services", "Photos"];
  List<Map<String, dynamic>> businessHours = [];
  final String locationName = 'Ukkadam';
  final String contentToShare = 'Check out this amazing content!';


  void _openWhatsApp() async {
    final link = WhatsAppUnilink(
      phoneNumber: '919791520028',  // Replace with the phone number you want to chat with
      text: "Hello! How are you?",  // Initial message text
    );

    // Attempt to launch the WhatsApp link
    await launch('$link');
  }


  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: () {
          Navigator.pop(context);
        }, icon: Icon(Icons.arrow_back),),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 10.0, right: 10, left: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      'Stellar Dry Clean & Premium Laundry',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  IconButton(
                    icon: Icon(
                      isLiked ? Icons.thumb_up : Icons.thumb_up_off_alt,
                      color: isLiked ? Colors.blue : Colors.grey,
                    ),
                    onPressed: () {
                      setState(() {
                        isLiked = !isLiked;
                        if (isLiked) {
                          isDisliked = false;
                        }
                      });
                    },
                  ),
                  IconButton(
                    icon: Icon(
                      isDisliked ? Icons.thumb_down : Icons.thumb_down_off_alt,
                      color: isDisliked ? Colors.red : Colors.grey,
                    ),
                    onPressed: () {
                      setState(() {
                        isDisliked = !isDisliked;
                        if (isDisliked) {
                          isLiked = false;
                        }
                      });
                    },
                  ),
                ],
              ),
              SizedBox(height: 8),
              Row(
                children: [
                  RatingBarIndicator(
                    rating: 3.7,
                    itemBuilder: (context, index) => Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    itemCount: 5,
                    itemSize: 24.0,
                    direction: Axis.horizontal,
                  ),
                  SizedBox(width: 8),
                  Text('3.7', style: TextStyle(fontWeight: FontWeight.bold)),
                  SizedBox(width: 8),
                  Text('17 ratings'),
                ],
              ),
              SizedBox(height: 8),
              Text('Ramanathapuram, Coimbatore'),
              SizedBox(height: 8),
              Text('Laundry Services • 5 Years in Business'),
              SizedBox(height: 8),
              Text('97 enquiries answered'),
              SizedBox(height: 8),
              Row(
                children: [
                  Icon(Icons.access_time, color: Colors.green),
                  SizedBox(width: 4),
                  Text(
                    'Open Now: until 7:00 pm',
                    style: TextStyle(color: Colors.green),
                  ),
                ],
              ),

              Divider(height: 32, thickness: 1),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GestureDetector(
                    onTap: () => launchUrlString("tel:56542136"),
                    child: Column(
                      children: [
                        Icon(Icons.phone, color: Colors.blue,),
                        Text("Phone")
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: _openWhatsApp,

                    child: Column(
                      children: [
                        FaIcon(FontAwesomeIcons.whatsapp, color: Colors.green),
                        Text("Whatsapp")

                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap:() => launchUrlString('https://www.google.com/maps/dir/?api=1&origin=Current+Location&destination=${Uri.encodeComponent(locationName)}'),
                    child: Column(
                      children: [
                        Icon(Icons.directions, color: Colors.blue),
                        Text("Direction")
                      ],
                    ),
                  ),
                  Column(
                    children: [
                      IconButton(
                        icon: Icon(Icons.share, color: Colors.blue),
                        onPressed: () {
                          // Replace the link with your actual app link
                          Share.share('Check out this app: https://play.google.com/store/apps/details?id=com.google.android.gm&pcampaignid=web_share');
                        },
                      ),
                      Text("Share")

                    ],
                  ),
                ],
              ),
              SizedBox(height: 8),
              Divider(height: 32, thickness: 1),
              // Custom Tab Bar
              Container(
                height: 50,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: List.generate(tabTitles.length, (index) {
                    return buildTabItem(index, tabTitles[index]);
                  }),
                ),
              ),
              SizedBox(height: 16),
              tabs[selectedIndex],
            ],
          ),
        ),
      ),    );
  }

  Widget buildTabItem(int index, String title) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIndex = index;
        });
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: selectedIndex == index ? Colors.blue : Colors.transparent,
          borderRadius: BorderRadius.circular(25),
        ),
        child: Text(
          title,
          style: TextStyle(
            color: selectedIndex == index ? Colors.white : Colors.blue,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

}

class clientside extends StatefulWidget {
  final Map<String, Map<String, String>> businessHours;

  const clientside({Key? key, required this.businessHours}) : super(key: key);

  @override
  State<clientside> createState() => _clientsideState();
}

class _clientsideState extends State<clientside> {
  final String address = "123 Main Street, Ramanathapuram, Coimbatore";
  final String googleMapsUrl =
      "https://www.google.com/maps/search/?api=1&query=123+Main+Street,+Ramanathapuram,+Coimbatore";

  // Selected date and time variables
  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedStartTime = TimeOfDay.now();
  TimeOfDay selectedEndTime = TimeOfDay.now();

  // Business hours list
  List<Map<String, String>> businessHours = [];

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (pickedDate != null && pickedDate != selectedDate) {
      setState(() {
        selectedDate = pickedDate;
      });
    }
  }



  @override
  Widget build(BuildContext context) {
    // Define the days of the week
    final List<String> days = [
      'Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday'
    ];

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Business Summary',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
          Text(
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce commodo libero ac justo facilisis ultricies.',
            style: TextStyle(fontSize: 16),
          ),
          SizedBox(height: 16),
          Text(
            'Address',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
          Text(
            address,
            style: TextStyle(fontSize: 16),
          ),
          SizedBox(height: 8),
          Text(
            'Business Hours',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
          Container(
            height: 400,
            child: ListView(
              children: days.map((day) {
                final hours = widget.businessHours[day];
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4.0),
                  child: ListTile(
                    title: Text(
                      "$day: ${hours != null ? "${hours['open']} - ${hours['close']}" : "Closed"}",
                      style: const TextStyle(fontSize: 18),
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}


class ReviewsTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: Text('John Doe'),
          subtitle: Text('Great service, highly recommend!'),
          trailing: RatingBarIndicator(
            rating: 4.5,
            itemBuilder: (context, index) => Icon(
              Icons.star,
              color: Colors.amber,
            ),
            itemCount: 5,
            itemSize: 20.0,
            direction: Axis.horizontal,
          ),
        ),
        ListTile(
          title: Text('Jane Smith'),
          subtitle: Text('Reasonable prices and friendly staff.'),
          trailing: RatingBarIndicator(
            rating: 4.0,
            itemBuilder: (context, index) => Icon(
              Icons.star,
              color: Colors.amber,
            ),
            itemCount: 5,
            itemSize: 20.0,
            direction: Axis.horizontal,
          ),
        ),
      ],
    );
  }
}

class ServicesTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListTile(
          title: Text('Dry Cleaning'),
          subtitle: Text('High-quality dry cleaning for your garments.'),
        ),
        ListTile(
          title: Text('Laundry'),
          subtitle: Text('Complete laundry services including wash and fold.'),
        ),
        ListTile(
          title: Text('Alterations'),
          subtitle: Text('Expert alterations and tailoring services.'),
        ),
      ],
    );
  }
}

class PhotoVideosTab extends StatefulWidget {
  const PhotoVideosTab({super.key});

  @override
  State<PhotoVideosTab> createState() => _PhotoVideosTabState();
}

class _PhotoVideosTabState extends State<PhotoVideosTab> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 200,
      color: Colors.red,
    );
  }
}

