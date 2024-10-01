import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import '../Provider/Provider.dart';
import '../THEMES/BasicTheme.dart';
import 'BusinessFirstPage.dart';
import 'CompanyEditPage.dart';
import 'ReviewAdmin.dart';

class BusinessCompanyDetails extends StatefulWidget {

  @override
  _BusinessCompanyDetailsState createState() => _BusinessCompanyDetailsState();
}

class _BusinessCompanyDetailsState extends State<BusinessCompanyDetails> {
  @override
  Widget build(BuildContext context) {

    final TimingProvider = Provider.of<AppDataProvider>(context);
    final textModel = Provider.of<AppDataProvider>(context);

    return DefaultTabController(
      length: 3, // Number of tabs
      child: Scaffold(
        body: Stack(
              children: [
                BackgroundImageContainer(context),
                Column(
                  children: [
                    // Profile Image and About section at the top
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        children: [
                          CircleAvatar(
                            radius: 60,
                            backgroundImage: AssetImage('assets/profile_image.jpg'),
                          ),
                          SizedBox(height: 12),
                          Text(
                            '${textModel.businessName}',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 8),
                          Align(
                            alignment: Alignment.topLeft,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10.0),
                              child: Text(
                                'Description',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blueGrey[800],
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Text(
                                '${textModel.businessDescription}',
                              style: TextStyle(fontSize: 16, color: Colors.black87),
                            ),
                          )
                        ],
                      ),
                    ),
                    TabBar(
                      indicatorColor: Colors.blue,
                      labelColor: Colors.blue,
                      tabs: [
                        Tab(text: "Overview", icon: Icon(Icons.info_outline, size: 24)),
                        Tab(text: "Service", icon: Icon(Icons.local_laundry_service, size: 24)),
                        Tab(text: "Review", icon: Icon(Icons.rate_review, size: 24)),
                      ],
                    ),

                    Expanded(
                      child: TabBarView(
                        children: [
                          SingleChildScrollView(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Business Information',
                                          style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.blueGrey[800],
                                          ),
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) => EditDetailsPagesss(
                                                ),
                                              ),
                                            );
                                          },
                                          child: Icon(
                                            Icons.edit,
                                            color: Colors.black,
                                            size: 24,
                                          ),
                                        ),
                                      ],
                                    ),
                                    // Business Information Cards
                                    _buildInfoCard(
                                        'Business Name', '${textModel.businessName}',
                                        Icons.business, Colors.teal),
                                    _buildInfoCard(
                                        'Address','${textModel.businessAddress}',
                                        Icons.location_on, Colors.blue),
                                    _buildInfoCard(
                                        'Year of Establishment', '${textModel.businessEstablishment}',
                                        Icons.date_range, Colors.deepOrange),
                                    _buildInfoCard(
                                        'Contact Number', '${textModel.userPhoneNumber}',
                                        Icons.phone, Colors.green),
                                    _buildInfoCard(
                                        'Alternative Contact','${textModel.businessAlternativeNumber1}',
                                        FontAwesomeIcons.mobile, Colors.purple),
                                    _buildInfoCard(
                                        'WhatsApp Number', '${textModel.businessWhatsappNumber}',
                                        FontAwesomeIcons.whatsapp, Colors.green),
                                    _buildInfoCard(
                                        'Email ID', '${textModel.businessEmailId}',
                                        Icons.email, Colors.redAccent),
                                    _buildInfoCard(
                                        'GST Number', '${textModel.businessGST}',
                                        Icons.credit_card, Colors.blueGrey),
                                    _buildInfoCard(
                                        'Website', '${textModel.businessWebsite}',
                                        Icons.web, Colors.brown),
                                    _buildInfoCard(
                                        'Instagram', '${textModel.businessInstagram}',
                                        FontAwesomeIcons.instagram, Colors.pink),
                                    _buildInfoCard(
                                        'Facebook', '${textModel.businessFacebook}',
                                        FontAwesomeIcons.facebook, Colors.indigo),
                                    _buildInfoCard(
                                        'YouTube', '${textModel.businessYoutube}',
                                        FontAwesomeIcons.youtube, Colors.red),
                                    _buildInfoCard(
                                        'Twitter', '${textModel.businessTwitter}',
                                        FontAwesomeIcons.twitter, Colors.lightBlue),

                                    // Timing Section
                                    Padding(
                                      padding: const EdgeInsets.symmetric(vertical: 20.0),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        children: [
                                          _buildTimeCard('Start Time', TimingProvider.startTime, Colors.teal),
                                          _buildTimeCard('End Time', TimingProvider.endTime, Colors.redAccent),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ServiceDetails(),
                          ReviewPage(),
                        ],
                      ),
                    ),
                  ],
                ),
                Positioned(
                  top: 20,
                  left: 20,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>BusinessFirstPage()));
                    },
                    child: Icon(
                      Icons.arrow_back,
                      color: Colors.black,
                      size: 24,
                    ),
                  ),
                ),
              ]
          ),

      ),
    );
  }


  Widget _buildInfoCard(String label, String value, IconData icon, Color iconColor) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: EdgeInsets.all(18),
        child: Row(
          children: [
            CircleAvatar(
              backgroundColor: iconColor.withOpacity(0.1),
              radius: 30,
              child: Icon(icon, color: iconColor, size: 30),
            ),
            SizedBox(width: 20),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    label,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  SizedBox(height: 5),
                  Text(
                    value,
                    style: TextStyle(color: Colors.grey[600], fontSize: 14),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTimeCard(String label, String time, Color color) {
    return Container(
      width: 160,
      height: 120,
      margin: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            offset: Offset(0, 4),
            blurRadius: 6,
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              label,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: color,
              ),
            ),
            SizedBox(height: 10),
            Text(
              time,
              style: TextStyle(fontSize: 16, color: Colors.grey[800]),
            ),
          ],
        ),
      ),
    );
  }

}

Map<String, IconData> serviceIcons = {
  'Washing': Icons.local_laundry_service,
  'Wash & Fold': Icons.local_laundry_service,
  'Dry Cleaning': Icons.cleaning_services,
  'Ironing': Icons.iron,
  'Folding': Icons.folder,
  'Stain Removal': Icons.local_laundry_service,
  'Household Cleaning': Icons.home,
  'Curtain Cleaning': Icons.window,
  'Carpet Cleaning': Icons.car_rental,
  'Express Service': Icons.flash_on,
  'Steam Press': Icons.local_laundry_service,
  'Blanket Cleaning': Icons.blind,
  'Leather Cleaning': Icons.dry_cleaning,
};

class ServiceDetails extends StatefulWidget {
  @override
  _ServiceDetailsState createState() => _ServiceDetailsState();
}

class _ServiceDetailsState extends State<ServiceDetails> {
  final List<String> _laundryServices = [
    'Washing',
    'Wash & Fold',
    'Dry Cleaning',
    'Ironing',
    'Folding',
    'Stain Removal',
    'Household Cleaning',
    'Curtain Cleaning',
    'Carpet Cleaning',
    'Express Service',
    'Steam Press',
    'Blanket Cleaning',
    'Leather Cleaning',
  ];

  List<bool> _selectedFlags = [];
  List<String> _selectedServices = [];

  @override
  void initState() {
    super.initState();
    _selectedFlags = List<bool>.filled(_laundryServices.length, false);
  }

  void _showMultiSelectDropdown() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setModalState) {
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Select Services',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Colors.blueAccent,
                    ),
                  ),
                  SizedBox(height: 16),
                  Expanded(
                    child: ListView.builder(
                      itemCount: _laundryServices.length,
                      itemBuilder: (context, index) {
                        return CheckboxListTile(
                          title: Text(_laundryServices[index]),
                          value: _selectedFlags[index],
                          onChanged: (bool? value) {
                            setModalState(() {
                              _selectedFlags[index] = value!;
                            });
                          },
                        );
                      },
                    ),
                  ),
                  SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context); // Close modal without saving
                        },
                        child: Text('Cancel'),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          _saveSelectedServices();
                          Navigator.pop(context); // Close modal after saving
                        },
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.white,
                          backgroundColor: Colors.blueAccent,
                        ),
                        child: Text('Save'),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  void _saveSelectedServices() {
    setState(() {
      _selectedServices = _laundryServices
          .asMap()
          .entries
          .where((entry) => _selectedFlags[entry.key])
          .map((entry) => entry.value)
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildServiceSelectionButton(),
          SizedBox(height: 20),
          if (_selectedServices.isNotEmpty)
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // Number of columns
                  crossAxisSpacing: 16.0, // Space between columns
                  mainAxisSpacing: 16.0, // Space between rows
                  childAspectRatio: 1.2, // Aspect ratio of each grid item
                ),
                itemCount: _selectedServices.length,
                itemBuilder: (context, index) {
                  final service = _selectedServices[index];
                  return Card(
                    elevation: 6.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [Colors.blueAccent.withOpacity(0.8), Colors.blueAccent],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            serviceIcons[service] ?? Icons.help_outline,
                            color: Colors.white,
                            size: 60.0,
                          ),
                          SizedBox(height: 8.0),
                          Text(
                            service,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildServiceSelectionButton() {
    return ElevatedButton(
      onPressed: _showMultiSelectDropdown,
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white,
        backgroundColor: Colors.blueAccent, // Text color
        padding: EdgeInsets.symmetric(vertical: 12, horizontal: 20),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0), // More rounded corners
        ),
        elevation: 5, // Subtle shadow
        shadowColor: Colors.black.withOpacity(0.2), // Shadow color
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.local_laundry_service, color: Colors.white, size: 28), // Larger icon
          SizedBox(width: 12), // Increased space between icon and text
          Text(
            'Select Services',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18, // Larger font size
              fontWeight: FontWeight.bold, // Bolder text
            ),
          ),
        ],
      ),
    );
  }

}




