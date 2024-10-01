import 'dart:math';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:whatsapp_unilink/whatsapp_unilink.dart';
import '../Settings/Settings.dart';
import '../THEMES/BasicTheme.dart';
import '../THEMES/DrawerTheme.dart';
import 'USERCOMPANYDETAIL.dart';
class UserFirstPage extends StatefulWidget {
  const UserFirstPage({super.key});

  @override
  State<UserFirstPage> createState() => _UserFirstPageState();
}
class _UserFirstPageState extends State<UserFirstPage> {

  List<int> _ratings = [];
  double _averageRating = 0.0;
  final _random = Random();

  void _addRating() {
    setState(() {
      // Simulate a new rating between 1 and 5
      int newRating = _random.nextInt(5) + 1;
      _ratings.add(newRating);
      _calculateAverage();
    });
  }

  void _calculateAverage() {
    if (_ratings.isNotEmpty) {
      _averageRating = _ratings.reduce((a, b) => a + b) / _ratings.length;
    } else {
      _averageRating = 0.0;
    }
  }

  final String locationName = 'Ukkadam';
 // final String contentToShare = 'Check out this amazing content!';

  @override
  void _openWhatsApp() async {
    final link = WhatsAppUnilink(
      phoneNumber: '919791520028',  // Replace with the phone number you want to chat with
      text: "Hello! How are you?",  // Initial message text
    );

    // Attempt to launch the WhatsApp link
    await launch('$link');
  }
  // void _shareContent() {
  //   // Use Share.share to share the content
  //   Share.share(contentToShare);
  // }
  final String contentToShare = 'Check out this amazing content!';

  void _shareContent(contentToShare) {
    // Use Share.share to share the content
    Share.share('Check out this app: https://play.google.com/store/apps/details?id=com.google.android.gm&pcampaignid=web_share');
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      drawer: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              decoration: BoxDecoration(color: Colors.cyan),
              currentAccountPicture: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: const CircleAvatar(
                      radius: 80,
                      backgroundImage: NetworkImage(
                        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcToiRnzzyrDtkmRzlAvPPbh77E-Mvsk3brlxQ&s",
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 1,
                    right: -10,
                    child: IconButton(
                      onPressed: (){},
                      icon: Icon(
                        Icons.add_a_photo,
                        color: Colors.white,
                        size: 30,
                      ),
                    ),
                  ),
                ],
              ),
              accountName: Text(
                'alagan',
                style: TextStyle(fontSize: 20 ),
              ),
              accountEmail: Text(
                'alagan08@gmail.com',
                style: TextStyle(fontSize: 16 ),
              ),
            ),

            ListTile(
              leading: Icon(Icons.person),
              title: Text(
                'Profile',
               style: drawerOption(context),
               // style: TextStyle(fontSize: 18 ),
              ),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context)=>UserProfile()));
              },
            ),
            ListTile(
              leading: Icon(Icons.add_box_outlined),
              title: Text(
                'Help Center',
                  style: drawerOption(context),
                //style: TextStyle(fontSize: 18),
              ),
              onTap: () {
              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text(
                'Settings',
                  style: drawerOption(context),
                //style: TextStyle(fontSize: 18),
              ),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>Settings()));
              },
            ),
            ListTile(
              leading: Icon(Icons.touch_app_outlined),
              title: Text(
                'About app',
                  style: drawerOption(context),
               // style: TextStyle(fontSize: 18),
              ),
              onTap: () {
              },
            ),ListTile(
              leading: Icon(Icons.share),
              title: Text("Share",
                  style: drawerOption(context),
                  //style: TextStyle(fontSize: 18 )
              ),
              onTap: (){},

            ),

            ListTile(
              leading: Icon(Icons.assignment_ind_outlined),
              title: Text(
                'Log out',
                  style: drawerOption(context),
                //style: TextStyle(fontSize: 18 ),
              ),
              onTap: () {},
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            "LAUND",
            style: TextStyle(
              color: Colors.blue,
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      body: Stack(
        children: [
          BackgroundImageContainer(context),
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 8.0),
                    padding: EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Icon(Icons.location_on),
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: Container(
                            height: 50,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Colors.blueAccent,
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("FIND BEST LAUNDRY SHOP",
                                    style: TextStyle(
                                      fontSize: screenWidth * 0.035,
                                      color: Colors.white,
                                    )),
                                Text(
                                  "Near by",
                                  style: TextStyle(
                                    fontSize: screenWidth * 0.035,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                  GestureDetector(
                      onTap: (){
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context)=>userCompanyDetailsViewPage()));
                      },
                      child: _buildRatingContainer(screenWidth)),
                  _buildRatingContainer(screenWidth),
                  _buildRatingContainer(screenWidth),
                  _buildRatingContainer(screenWidth),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRatingContainer(double screenWidth) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: LinearGradient(
            colors: [Colors.white, Colors.grey.shade200],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              blurRadius: 12,
              offset: Offset(4, 4),
            ),
          ],
        ),
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Rating Icons or Logos
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(5, (index) {
                return Container(
                  height: screenWidth * 0.15,
                  width: screenWidth * 0.15,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        blurRadius: 8,
                        offset: Offset(2, 2),
                      ),
                    ],
                  ),
                  child: Icon(
                    Icons.star, // Customize this with icons/logos if necessary
                    color: Colors.blueAccent,
                    size: 28,
                  ),
                );
              }),
            ),
            // Spacing
            SizedBox(height: 20),
            // Company Name
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                "Company Name",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: screenWidth * 0.06,
                  color: Colors.black87,
                ),
              ),
            ),

            // Spacing
            SizedBox(height: 10),

            // Rating Row with Gradient Button
            Row(
              children: [
                Icon(
                  Icons.star,
                  color: Colors.yellow.shade700,
                  size: 28,
                ),
                SizedBox(width: 10),
                GestureDetector(
                  onTap: _addRating, // Add a new rating on tap
                  child: Container(
                    width: 60,
                    height: 30,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Colors.blue, Colors.lightBlueAccent],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(12.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.blueAccent.withOpacity(0.3),
                          blurRadius: 8,
                          offset: Offset(2, 2),
                        ),
                      ],
                    ),
                    child: Center(
                      child: Text(
                        _averageRating.toStringAsFixed(1), // Display the average rating
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 20),
                Text(
                  '${_ratings.length} Ratings',
                  style: TextStyle(fontSize: 16, color: Colors.grey.shade800),
                ),
              ],
            ),

            // Spacing
            SizedBox(height: 10),

            // Location Row
            Row(
              children: [
                Icon(Icons.location_on, color: Colors.redAccent),
                SizedBox(width: 5),
                Text(
                  "Cross Cut Road, Gamthipuram",
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey.shade700,
                  ),
                ),
              ],
            ),

            // Spacing
            SizedBox(height: 8),

            // Review Row
            Row(
              children: [
                Icon(
                  Icons.favorite,
                  color: Colors.red,
                ),
                SizedBox(width: 5),
                Flexible(
                  child: Text(
                    "Great service and neatly ironed clothes...",
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey.shade700,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),

            // Spacing
            SizedBox(height: 20),

            // Action Buttons Row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: () => launchUrlString("tel:56542136"),
                  child: Column(
                    children: [
                      Icon(
                        Icons.phone,
                        color: Colors.blue,
                        size: 30,
                      ),
                      Text(
                        "Phone",
                        style: TextStyle(fontSize: 12),
                      )
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: _openWhatsApp,
                  child: Column(
                    children: [
                      FaIcon(
                        FontAwesomeIcons.whatsapp,
                        color: Colors.green,
                        size: 30,
                      ),
                      Text(
                        "Whatsapp",
                        style: TextStyle(fontSize: 12),
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () => launchUrlString(
                      'https://www.google.com/maps/dir/?api=1&origin=Current+Location&destination=${Uri.encodeComponent(locationName)}'),
                  child: Column(
                    children: [
                      Icon(
                        Icons.directions,
                        color: Colors.blue,
                        size: 30,
                      ),
                      Text(
                        "Direction",
                        style: TextStyle(fontSize: 12),
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap:(){
                    _shareContent(contentToShare);
                  },
                  child: Column(
                    children: [
                      Icon(Icons.share, color: Colors.blue, size: 30,),
                       Text(
                        "Share",
                        style: TextStyle(fontSize: 12),
                      ),
                    ],
                  ),
                ),

              ],
            ),
          ],
        ),
      ),
    );
  }

}

class UserProfile extends StatelessWidget {
  const UserProfile({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(Icons.person),
                      SizedBox(width: 8),
                      Text(
                        "Profile page",
                        style: profileHeading(context),
                        //style: TextStyle(fontSize: screenWidth * 0.05),
                      ),
                    ],
                  ),
                  IconButton( onPressed: () {
                    Navigator.pop(context);
                  },
                    icon: Icon(Icons.cancel_outlined),),
                ],
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height/4,
                    width: screenWidth * 0.3,
                    decoration: BoxDecoration(
                      border: Border.all(),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Name",
                        style: fieldHeadingProfile(context),
                        ),
                        Card(
                          elevation: 10,
                          child: Container(
                            height: screenHeight * 0.05,
                            width: screenWidth*0.9,
                            decoration: BoxDecoration(

                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text("Name"),
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        Text("Mobile number",
                          style: fieldHeadingProfile(context),
                        ),
                        Card(
                          elevation: 10,
                          child: Container(
                            height: screenHeight * 0.05,
                            width: screenWidth*0.9,
                            decoration: BoxDecoration(

                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text("9876543210"),
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        Text("Email Id",
                          style: fieldHeadingProfile(context),
                        ),
                        Card(
                          elevation: 10,
                          child: Container(
                            height: screenHeight * 0.05,
                            width: screenWidth*0.9,
                            decoration: BoxDecoration(

                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text("abcd@gmail.com"),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Card(
                elevation: 10,
                child: Container(
                  height: screenHeight * 0.05,
                  width: screenWidth,
                  decoration: BoxDecoration(
                    border: Border.all(),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.location_on),
                      Text("Coimbatore tamil nadu")
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),
              Card(
                elevation: 10,
                child: Stack(
                  children: [
                    Container(
                      height: screenHeight * 0.25,
                      width: screenWidth,
                      decoration: BoxDecoration(),
                      child: Center(
                        child: Text(
                          "Change password",
                          style: TextStyle(fontSize: screenWidth * 0.05),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 2,
                      right: 2,
                      child: Icon(Icons.cancel_presentation_outlined, size: 30,),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Container(
                height: screenHeight * 0.2,
                width: screenWidth,
                decoration: BoxDecoration(
                  border: Border.all(),
                ),
                child: Center(child: Text("LAUND ad banner1", style: TextStyle(color: Colors.blueAccent, fontWeight: FontWeight.bold, fontSize: 24),)),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.map_outlined),
            label: "Map",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.article_outlined),
            label: "Blog",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag_outlined),
            label: "Store",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.request_page_outlined),
            label: "Request",
          ),
        ],
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}




// import 'dart:convert';
// import 'dart:ui';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:http/http.dart' as http;
// import 'package:flutter/material.dart';
// import 'package:share_plus/share_plus.dart';
// import 'package:url_launcher/url_launcher_string.dart';
//
// import '../UserPages/USERCOMPANYDETAIL.dart';
//
// class UserFirstPage extends StatefulWidget {
//   @override
//   _UserFirstPageState createState() => _UserFirstPageState();
// }
//
// class _UserFirstPageState extends State<UserFirstPage> {
//
//   String selectedService = '';
//
//   @override
//   void initState() {
//     super.initState();
//     _companies = fetchCompanies();
//     // Use this to call the dialog after the page has been rendered
//     WidgetsBinding.instance.addPostFrameCallback((_) {
//       _showServiceSelectionDialog();
//     });
//   }
//
//   void _showServiceSelectionDialog() {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return StatefulBuilder(
//           builder: (context, setState) {
//             return AlertDialog(
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(20.0),
//               ),
//               title: Text(
//                 "Choose a Service",
//                 style: TextStyle(
//                   fontSize: 22,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.blueAccent,
//                 ),
//                 textAlign: TextAlign.center,
//               ),
//               content: Column(
//                 mainAxisSize: MainAxisSize.min,
//                 children: <Widget>[
//                   Padding(
//                     padding: const EdgeInsets.symmetric(vertical: 8.0),
//                     child: _buildServiceOption(
//                       icon: Icons.local_laundry_service,
//                       serviceName: 'Washing',
//                       setState: setState,
//                     ),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.symmetric(vertical: 8.0),
//                     child: _buildServiceOption(
//                       icon: Icons.cleaning_services,
//                       serviceName: 'Dry Clean',
//                       setState: setState,
//                     ),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.symmetric(vertical: 8.0),
//                     child: _buildServiceOption(
//                       icon: Icons.iron,
//                       serviceName: 'Ironing',
//                       setState: setState,
//                     ),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.symmetric(vertical: 8.0),
//                     child: _buildServiceOption(
//                       icon: Icons.miscellaneous_services,
//                       serviceName: 'Others',
//                       setState: setState,
//                     ),
//                   ),
//                 ],
//               ),
//               actions: <Widget>[
//                 TextButton(
//                   style: TextButton.styleFrom(
//                     backgroundColor: Colors.blueAccent,
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                   ),
//                   child: Padding(
//                     padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20.0),
//                     child: Text(
//                       "Next",
//                       style: TextStyle(
//                         color: Colors.white,
//                         fontSize: 18,
//                       ),
//                     ),
//                   ),
//                   onPressed: () {
//                     if (selectedService.isNotEmpty) {
//                       // Close the popup and proceed
//                       Navigator.pop(context);
//                       // Additional logic can be added here after selection
//                     } else {
//                       // Show an alert if no service is selected
//                       ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//                         content: Text('Please select a service to proceed'),
//                       ));
//                     }
//                   },
//                 ),
//               ],
//             );
//           },
//         );
//       },
//     );
//   }
//
// // Helper widget to build service options
//
//   final String contentToShare = 'Check out this amazing content!';
//   late Future<List<Company>> _companies;
//
//   Future<List<Company>> fetchCompanies() async {
//     final response = await http.get(Uri.parse('http://localhost:5503/BusinessgetAllUsers'));
//
//     if (response.statusCode == 200) {
//       return detailCompanies(response.body);
//     } else {
//       throw Exception('Failed to load company details');
//     }
//   }
//
//   // @override
//   // void initState() {
//   //   super.initState();
//   //   _companies = fetchCompanies();
//   // }
//
//   @override
//   Widget build(BuildContext context) {
//     double screenWidth = MediaQuery.of(context).size.width;
//
//     return FutureBuilder<List<Company>>(
//       future: _companies,
//       builder: (context, snapshot) {
//         if (snapshot.connectionState == ConnectionState.waiting) {
//           return Center(child: CircularProgressIndicator());
//         } else if (snapshot.hasError) {
//           return Center(child: Text('Error: ${snapshot.error}'));
//         } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
//           return Center(child: Text('No company data available'));
//         } else {
//           List<Company> companies = snapshot.data!;
//
//           return Scaffold(
//             body: Stack(
//               children: [
//                 Container(
//                   decoration: BoxDecoration(
//                     image: DecorationImage(
//                       image: AssetImage('assets/backgroundPicture.jpeg'),
//                       fit: BoxFit.cover,
//                     ),
//                   ),
//                   child: BackdropFilter(
//                     filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
//                     child: Container(
//                       color: Colors.black.withOpacity(0.4),
//                     ),
//                   ),
//                 ),
//                 Column(
//                   children: [
//                     Container(
//                       margin: EdgeInsets.symmetric(vertical: 8.0),
//                       padding: EdgeInsets.all(8.0),
//                       child: Row(
//                         children: [
//                           Container(
//                             height: 50,
//                             width: 50,
//                             decoration: BoxDecoration(
//                               color: Colors.grey,
//                               borderRadius: BorderRadius.circular(5),
//                             ),
//                             child: Icon(Icons.location_on),
//                           ),
//                           SizedBox(width: 10),
//                           Expanded(
//                             child: Container(
//                               height: 50,
//                               decoration: BoxDecoration(
//                                 borderRadius: BorderRadius.circular(5),
//                                 color: Colors.blueAccent,
//                               ),
//                               child: Column(
//                                 mainAxisAlignment: MainAxisAlignment.center,
//                                 children: [
//                                   Text(
//                                     "FIND BEST LAUNDRY SHOP",
//                                     style: TextStyle(
//                                       fontSize: screenWidth * 0.035,
//                                       color: Colors.white,
//                                     ),
//                                   ),
//                                   Text(
//                                     "Near by",
//                                     style: TextStyle(
//                                       fontSize: screenWidth * 0.035,
//                                       color: Colors.white,
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                     Expanded(
//                       child: ListView.builder(
//                         itemCount: companies.length,
//                         itemBuilder: (context, index) {
//                           return Padding(
//                             padding: const EdgeInsets.all(8.0),
//                             child: GestureDetector(
//                               onTap: () {
//                                 Navigator.push(
//                                   context,
//                                   MaterialPageRoute(builder: (context) => userCompanyDetailsViewPage()),
//                                 );
//                               },
//                               child: _buildRatingContainer(companies[index], screenWidth),
//                             ),
//                           );
//                         },
//                       ),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           );
//         }
//       },
//     );
//   }
//
//   Widget _buildRatingContainer(Company company, double screenWidth) {
//     return Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: Container(
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(20),
//           gradient: LinearGradient(
//             colors: [Colors.white, Colors.grey.shade200],
//             begin: Alignment.topLeft,
//             end: Alignment.bottomRight,
//           ),
//           boxShadow: [
//             BoxShadow(
//               color: Colors.grey.withOpacity(0.3),
//               blurRadius: 12,
//               offset: Offset(4, 4),
//             ),
//           ],
//         ),
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             SizedBox(height: 20),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: List.generate(5, (index) {
//                 return Container(
//                   height: screenWidth * 0.15,
//                   width: screenWidth * 0.15,
//                   decoration: BoxDecoration(
//                     color: Colors.white,
//                     borderRadius: BorderRadius.circular(10),
//                     boxShadow: [
//                       BoxShadow(
//                         color: Colors.grey.withOpacity(0.2),
//                         blurRadius: 8,
//                         offset: Offset(2, 2),
//                       ),
//                     ],
//                   ),
//                   child: Icon(
//                     Icons.star,
//                     size: 28,
//                   ),
//                 );
//               }),
//             ),
//             SizedBox(height: 20),
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 8.0),
//               child: Text(
//                 '${company.companyName}',
//                 style: TextStyle(
//                   fontWeight: FontWeight.bold,
//                   fontSize: screenWidth * 0.06,
//                   color: Colors.black87,
//                 ),
//               ),
//             ),
//             SizedBox(height: 10),
//             Row(
//               children: [
//                 Icon(
//                   Icons.star,
//                   color: Colors.yellow.shade700,
//                   size: 28,
//                 ),
//                 SizedBox(width: 10),
//                 Container(
//                   width: 60,
//                   height: 30,
//                   decoration: BoxDecoration(
//                     gradient: LinearGradient(
//                       colors: [Colors.blue, Colors.lightBlueAccent],
//                       begin: Alignment.topLeft,
//                       end: Alignment.bottomRight,
//                     ),
//                     borderRadius: BorderRadius.circular(12.0),
//                     boxShadow: [
//                       BoxShadow(
//                         color: Colors.blueAccent.withOpacity(0.3),
//                         blurRadius: 8,
//                         offset: Offset(2, 2),
//                       ),
//                     ],
//                   ),
//                   child: Center(
//                     child: Text(
//                       '${company.averageOfRatings}',
//                       style: TextStyle(
//                         color: Colors.white,
//                         fontSize: 18,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                   ),
//                 ),
//                 SizedBox(width: 20),
//                 Text(
//                   '${company.numberOfRatings} Ratings',
//                   style: TextStyle(fontSize: 16, color: Colors.grey.shade800),
//                 ),
//               ],
//             ),
//             SizedBox(height: 10),
//             Row(
//               children: [
//                 Icon(Icons.location_on, color: Colors.redAccent),
//                 SizedBox(width: 5),
//                 Expanded(
//                   child: Text(
//                     '${company.address}',
//                     style: TextStyle(
//                       fontSize: 14,
//                       color: Colors.grey.shade700,
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//             SizedBox(height: 8),
//             Row(
//               children: [
//                 Icon(
//                   Icons.favorite,
//                   color: Colors.red,
//                 ),
//                 SizedBox(width: 5),
//                 Flexible(
//                   child: Text(
//                     '${company.numberOfRatings}',
//                     style: TextStyle(
//                       fontSize: 14,
//                       color: Colors.grey.shade700,
//                     ),
//                     overflow: TextOverflow.ellipsis,
//                   ),
//                 ),
//               ],
//             ),
//             SizedBox(height: 20),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceAround,
//               children: [
//                 GestureDetector(
//                   onTap: () => launchUrlString("tel:${company.phoneNumber}"),
//                   child: Column(
//                     children: [
//                       Icon(
//                         Icons.phone,
//                         color: Colors.blue,
//                         size: 30,
//                       ),
//                       Text(
//                         "Phone",
//                         style: TextStyle(fontSize: 12),
//                       ),
//                     ],
//                   ),
//                 ),
//                 GestureDetector(
//                   onTap: () => launchUrlString('https://wa.me/${company.whatsapp}'),
//                   child: Column(
//                     children: [
//                       FaIcon(
//                         FontAwesomeIcons.whatsapp,
//                         color: Colors.green,
//                         size: 30,
//                       ),
//                       Text(
//                         "Whatsapp",
//                         style: TextStyle(fontSize: 12),
//                       ),
//                     ],
//                   ),
//                 ),
//                 GestureDetector(
//                   onTap: () {
//                     if (company.address != null && company.address!.isNotEmpty) {
//                       launchUrlString(
//                           'https://www.google.com/maps/dir/?api=1&origin=Current+Location&destination=${Uri.encodeComponent(company.address!)}'
//                       );
//                     } else {
//                       print('Address is not available.');
//                     }
//                   },
//                   child: Column(
//                     children: [
//                       Icon(
//                         Icons.directions,
//                         color: Colors.blue,
//                         size: 30,
//                       ),
//                       Text(
//                         "Direction",
//                         style: TextStyle(fontSize: 12),
//                       ),
//                     ],
//                   ),
//                 ),
//                 GestureDetector(
//                   onTap: () {
//                     Share.share(contentToShare);
//                   },
//                   child: Column(
//                     children: [
//                       Icon(Icons.share, color: Colors.blue, size: 30),
//                       Text(
//                         "Share",
//                         style: TextStyle(fontSize: 12),
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//   Widget _buildServiceOption({
//     required IconData icon,
//     required String serviceName,
//     required void Function(void Function()) setState,
//   }) {
//     return ListTile(
//       tileColor: selectedService == serviceName ? Colors.blue[50] : Colors.white,
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(10),
//       ),
//       leading: Icon(icon, color: Colors.blueAccent),
//       title: Text(
//         serviceName,
//         style: TextStyle(
//           fontSize: 18,
//           fontWeight: FontWeight.w500,
//           color: Colors.black87,
//         ),
//       ),
//       trailing: Radio<String>(
//         value: serviceName,
//         groupValue: selectedService,
//         onChanged: (String? value) {
//           setState(() {
//             selectedService = value!;
//           });
//         },
//       ),
//     );
//   }
// }
//
// class Company {
//   final String? sId;
//   final String? companyName;
//   final String? phoneNumber;
//   final String? emailId;
//   final List<String>? services;
//   final String? createdAt;
//   final String? updatedAt;
//   final int? iV;
//   final String? about;
//   final String? accountType;
//   final String? address;
//   final int? alternativeNumber;
//   final String? description;
//   final String? endTime;
//   final String? facebook;
//   final String? gstNo;
//   final String? instagram;
//   final String? startTime;
//   final String? twitter;
//   final String? website;
//   final String? whatsapp;
//   final String? yearOfEstablishment;
//   final String? youtube;
//   final String? averageOfRatings;
//   final String? numberOfRatings;
//
//   Company({
//     required this.sId,
//     required this.companyName,
//     required this.phoneNumber,
//     required this.emailId,
//     required this.services,
//     required this.createdAt,
//     required this.updatedAt,
//     required this.iV,
//     required this.about,
//     required this.accountType,
//     required this.address,
//     required this.alternativeNumber,
//     required this.description,
//     required this.endTime,
//     required this.facebook,
//     required this.gstNo,
//     required this.instagram,
//     required this.startTime,
//     required this.twitter,
//     required this.website,
//     required this.whatsapp,
//     required this.yearOfEstablishment,
//     required this.youtube,
//     required this.averageOfRatings,
//     required this.numberOfRatings,
//   });
//
//   factory Company.fromJson(Map<String, dynamic> json) {
//     return Company(
//       sId: json['id'],
//       companyName: json['companyName'],
//       phoneNumber: json['phoneNumber'],
//       emailId: json['emailId'],
//       services: json['services'].cast<String>(),
//       createdAt: json['createdAt'],
//       updatedAt: json['updatedAt'],
//       iV: json['__v'],
//       about: json['about'],
//       accountType: json['accountType'],
//       address: json['address'],
//       alternativeNumber: json['alternativeNumber'],
//       description: json['description'],
//       endTime: json['endTime'],
//       facebook: json['facebook'],
//       gstNo: json['gstNo'],
//       instagram: json['instagram'],
//       startTime: json['startTime'],
//       twitter: json['twitter'],
//       website: json['website'],
//       whatsapp: json['whatsapp'],
//       yearOfEstablishment: json['yearOfEstablishment'],
//       youtube: json['youtube'],
//       averageOfRatings: json['averageOfRatings'],
//       numberOfRatings: json['numberOfRatings'],
//     );
//   }
// }
//
// List<Company> detailCompanies(String responseBody) {
//   final detailedCompany = json.decode(responseBody).cast<Map<String, dynamic>>();
//   return detailedCompany.map<Company>((json) => Company.fromJson(json)).toList();
// }
