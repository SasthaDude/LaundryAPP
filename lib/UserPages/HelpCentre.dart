import 'package:flutter/material.dart';

class UserHelpCentre extends StatelessWidget {
  final Map<String, List<Map<String, String>>> faqSections = {
    "Sign Up & Login": [
      {
        "question": "How do I sign up for the app?",
        "answer": "To sign up, click on the 'Sign Up' button on the home screen and fill in the required details."
      },
      {
        "question": "What is the process to log in?",
        "answer": "To log in, enter your registered email and password on the login screen and click 'Log In'."
      },
      {
        "question": "How can I reset my password?",
        "answer": "If you forget your password, click on 'Forgot Password?' on the login screen and follow the instructions to reset it."
      },
      {
        "question": "How do I sign up using my Google account?",
        "answer": "You can sign up with Google by selecting the 'Sign up with Google' option and following the prompts."
      },
      {
        "question": "How do I sign up using my Facebook account?",
        "answer": "To sign up with Facebook, click on 'Sign up with Facebook' and log in with your Facebook credentials."
      },
    ],
    "Connecting with Business Persons": [
      {
        "question": "How can I search for nearby locations?",
        "answer": "Use the search bar on the home screen to enter your location and find nearby services."
      },
      {
        "question": "How can I connect with a businessperson via phone, WhatsApp, or location?",
        "answer": "You can connect by tapping on the contact options provided in the business profile to call or message via WhatsApp."
      },
      {
        "question": "How do I share the business card with my friends?",
        "answer": "Tap on the 'Share' button in the business card section to send it to your friends via your preferred app."
      },
    ],
    "Settings": [
      {
        "question": "How can I update my profile page?",
        "answer": "To update your profile, go to the profile section and click on 'Edit Profile' to make changes."
      },
      {
        "question": "How do I change the app theme?",
        "answer": "You can change the theme in the settings menu by selecting your preferred theme option."
      },
      {
        "question": "How can I change the language of the app?",
        "answer": "To change the language, go to settings and select 'Language' to choose your preferred option."
      },
      {
        "question": "What information can I find in the 'About Us' section?",
        "answer": "The 'About Us' section provides basic information about the app and its services."
      },
    ],
    "Account Management": [
      {
        "question": "How do I log out of the app?",
        "answer": "To log out, go to the settings menu and click on 'Log Out' at the bottom of the screen."
      },
      {
        "question": "How can I delete my account?",
        "answer": "To delete your account, go to settings and select 'Delete Account'. Follow the prompts to confirm."
      },
    ],
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('App FAQs', style: TextStyle(fontFamily: 'Roboto', fontWeight: FontWeight.bold)),
        backgroundColor: Colors.teal,
      ),
      body: ListView(
        children: faqSections.entries.map((entry) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  entry.key,
                  style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.teal),
                ),
              ),
              ...entry.value.map((faq) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        faq["question"]!,
                        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                      SizedBox(height: 4),
                      Text(
                        faq["answer"]!,
                        style: const TextStyle(fontSize: 16, color: Colors.black87),
                      ),
                      Divider(height: 20, thickness: 1, color: Colors.grey[300]),
                    ],
                  ),
                );
              }).toList(),
            ],
          );
        }).toList(),
      ),
    );
  }
}
