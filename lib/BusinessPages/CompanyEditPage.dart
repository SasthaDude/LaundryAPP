import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'dart:io';
import 'package:provider/provider.dart';
import '../BusinessPages/BUSINESSCOMPANYDETAILS.dart';
import '../Provider/Provider.dart';

class EditDetailsPagesss extends StatefulWidget {
  @override
  _EditDetailsPagesssState createState() => _EditDetailsPagesssState();
}

class _EditDetailsPagesssState extends State<EditDetailsPagesss> {
  File? _profileImage;
  final TextEditingController _companyNameController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _establishmentYearController = TextEditingController();
  final TextEditingController _contactNumberController = TextEditingController();
  final TextEditingController _alternativeContactNumberController = TextEditingController();
  final TextEditingController _whatsappNumberController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _gstNumberController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _websiteController = TextEditingController();
  final TextEditingController _instagramController = TextEditingController();
  final TextEditingController _facebookController = TextEditingController();
  final TextEditingController _youtubeController = TextEditingController();
  final TextEditingController _twitterController = TextEditingController();

  @override
  void initState() {
    super.initState();
    final EditingProvider = Provider.of<AppDataProvider>(context, listen: false);
    _companyNameController.text = EditingProvider.businessName ?? '';
    _addressController.text = EditingProvider.businessAddress ?? '';
    _establishmentYearController.text = EditingProvider.businessEstablishment ?? '';
    _contactNumberController.text = EditingProvider.businessPhoneNumber ?? '';
    _alternativeContactNumberController.text = EditingProvider.businessAlternativeNumber1 ?? '';
    _whatsappNumberController.text = EditingProvider.businessWhatsappNumber ?? '';
    _emailController.text = EditingProvider.businessEmailId ?? '';
    _gstNumberController.text = EditingProvider.businessGST ?? '';
    _descriptionController.text = EditingProvider.businessDescription ?? '';
    _websiteController.text = EditingProvider.businessWebsite ?? '';
    _instagramController.text = EditingProvider.businessInstagram ?? '';
    _facebookController.text = EditingProvider.businessFacebook ?? '';
    _youtubeController.text = EditingProvider.businessYoutube ?? '';
    _twitterController.text = EditingProvider.businessTwitter ?? '';
  }

  Future<void> _selectTime(BuildContext context, bool isStartTime) async {
    final provider = Provider.of<AppDataProvider>(context, listen: false);
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: isStartTime
          ? _convertStringToTimeOfDay(provider.startTime)
          : _convertStringToTimeOfDay(provider.endTime),
    );

    if (picked != null) {
      final formattedTime = _formatTimeOfDay(picked);
      if (isStartTime) {
        provider.setStartTime(formattedTime);
      } else {
        provider.setEndTime(formattedTime);
      }
    }
  }

  String _formatTimeOfDay(TimeOfDay time) {
    final period = time.period == DayPeriod.am ? "AM" : "PM";
    final hour = time.hourOfPeriod == 0 ? 12 : time.hourOfPeriod;
    final minute = time.minute.toString().padLeft(2, '0');
    return "$hour:$minute $period";
  }

  TimeOfDay _convertStringToTimeOfDay(String timeStr) {
    final parts = timeStr.split(" ");
    final timeParts = parts[0].split(":");
    final hour = int.parse(timeParts[0]) % 12;
    final minute = int.parse(timeParts[1]);
    final isPm = parts[1] == "PM";
    return TimeOfDay(hour: isPm ? hour + 12 : hour, minute: minute);
  }

  @override
  Widget build(BuildContext context) {
    final Timingprovider = Provider.of<AppDataProvider>(context);
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.lightBlue.shade50,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back),
          color: Colors.black,
        ),
        title: Text('Edit Profile'),
        backgroundColor: Colors.blue,
        elevation: 0,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.lightBlue.shade50, Colors.lightBlue.shade100],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(screenWidth * 0.05), // Responsive padding
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: CircleAvatar(
                    radius: screenWidth * 0.15, // Responsive radius
                    backgroundImage: _profileImage != null
                        ? FileImage(_profileImage!)
                        : AssetImage('assets/business_logo.png') as ImageProvider,
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: Icon(
                        Icons.camera_alt,
                        color: Colors.white,
                        size: 30,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                _buildTextField(_companyNameController, 'Company Name', false, Icons.business, FontAwesomeIcons.faceAngry),
                SizedBox(height: 20),
                _buildTextField(_addressController, 'Address', false, Icons.location_on, FontAwesomeIcons.facebook),
                SizedBox(height: 20),
                _buildTextField(_establishmentYearController, 'Year of Establishment', false, Icons.date_range, FontAwesomeIcons.faceAngry),
                SizedBox(height: 20),
                _buildTextField(_contactNumberController, 'Contact Number', false, Icons.phone, FontAwesomeIcons.faceAngry),
                SizedBox(height: 20),
                _buildTextField(_alternativeContactNumberController, 'Alternative Contact Number', true, Icons.phone, FontAwesomeIcons.mobile),
                SizedBox(height: 20),
                _buildTextField(_whatsappNumberController, 'WhatsApp Number', true, Icons.phone, FontAwesomeIcons.whatsapp),
                SizedBox(height: 20),
                _buildTextField(_emailController, 'Email ID', false, Icons.email, FontAwesomeIcons.faceAngry),
                SizedBox(height: 20),
                _buildTextField(_gstNumberController, 'GST Number', false, Icons.credit_card, FontAwesomeIcons.faceAngry),
                SizedBox(height: 20),
                _buildTextField(_descriptionController, 'Description', false, Icons.description, FontAwesomeIcons.faceAngry, maxLines: 3),
                SizedBox(height: 20),
                _buildTextField(_websiteController, 'Website', false, Icons.web, FontAwesomeIcons.faceAngry),
                SizedBox(height: 20),
                _buildTextField(_instagramController, 'Instagram', true, Icons.web, FontAwesomeIcons.instagram),
                SizedBox(height: 20),
                _buildTextField(_facebookController, 'Facebook', true, Icons.web, FontAwesomeIcons.facebook),
                SizedBox(height: 20),
                _buildTextField(_youtubeController, 'Youtube', true, Icons.web, FontAwesomeIcons.youtube),
                SizedBox(height: 20),
                _buildTextField(_twitterController, 'Twitter', true, Icons.web, FontAwesomeIcons.twitter),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildTimeSelector("Start Time", Timingprovider.startTime, () => _selectTime(context, true)),
                    _buildTimeSelector("End Time", Timingprovider.endTime, () => _selectTime(context, false)),
                  ],
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(
                      onPressed: () => Navigator.pop(context),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.grey[300],
                        padding: EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                      ),
                      child: Text('Cancel', style: TextStyle(color: Colors.black)),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Provider.of<AppDataProvider>(context, listen: false).updateBusinessName(_companyNameController.text);
                        Provider.of<AppDataProvider>(context, listen: false).updateBusinessAddress(_addressController.text);
                        Provider.of<AppDataProvider>(context, listen: false).updateEstablishment(_establishmentYearController.text);
                        Provider.of<AppDataProvider>(context, listen: false).updateBusinessPhoneNumber(_contactNumberController.text);
                        Provider.of<AppDataProvider>(context, listen: false).updateAlternativeNumber1(_alternativeContactNumberController.text);
                        Provider.of<AppDataProvider>(context, listen: false).updateWhatsAppNumber(_whatsappNumberController.text);
                        Provider.of<AppDataProvider>(context, listen: false).updateBusinessEmailId(_emailController.text);
                        Provider.of<AppDataProvider>(context, listen: false).updateBusinessGST(_gstNumberController.text);
                        Provider.of<AppDataProvider>(context, listen: false).updateBusinessDescription(_descriptionController.text);
                        Provider.of<AppDataProvider>(context, listen: false).updateBusinessWebsite(_websiteController.text);
                        Provider.of<AppDataProvider>(context, listen: false).updateBusinessInstagram(_instagramController.text);
                        Provider.of<AppDataProvider>(context, listen: false).updateBusinessFacebook(_facebookController.text);
                        Provider.of<AppDataProvider>(context, listen: false).updateBusinessYoutube(_youtubeController.text);
                        Provider.of<AppDataProvider>(context, listen: false).updateBusinessTwitter(_twitterController.text);
                        Navigator.push(context, MaterialPageRoute(builder: (context) => BusinessCompanyDetails()));
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        padding: EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                      ),
                      child: Text('Save Changes', style: TextStyle(color: Colors.white)),
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

  Widget _buildTextField(TextEditingController controller, String label, bool useFaIcon, IconData iconData, IconData faIconData, {int maxLines = 1}) {
    return TextFormField(
      controller: controller,
      maxLines: maxLines,
      decoration: InputDecoration(
        fillColor: Colors.white,
        filled: true,
        hintText: label,
        prefixIcon: Padding(
          padding: const EdgeInsets.all(8.0),
          child: useFaIcon ? FaIcon(faIconData, color: Colors.blue) : Icon(iconData, color: Colors.blue),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }

  Widget _buildTimeSelector(String label, String selectedTime, VoidCallback onTimeTap) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.teal),
            ),
            SizedBox(height: 10),
            GestureDetector(
              onTap: onTimeTap,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(15),
                ),
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                child: Text(
                  selectedTime,
                  style: TextStyle(fontSize: 16, color: Colors.teal),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
