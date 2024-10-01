import 'package:flutter/material.dart';

class BusinessHelpCentre extends StatelessWidget {
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
    ],
    "Profile": [
      {
        "question": "How do I upload my company details?",
        "answer": "You can upload your company details in the profile section by selecting 'Upload Company Details'."
      },
      {
        "question": "How do I update my profile?",
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
    "Leads": [
      {
        "question": "How can I view leads, including today's leads and all service-based leads?",
        "answer": "You can view leads by navigating to the 'Leads' section where you can filter by date or service type."
      },
      {
        "question": "How do I select a company service on the lead page?",
        "answer": "On the lead page, you can select the company service from the dropdown menu to filter the leads accordingly."
      },
      {
        "question": "How do I download the leads in Excel format?",
        "answer": "To download the leads, click on the 'Download Excel' button in the leads section."
      },
      {
        "question": "How can I print the Excel sheet?",
        "answer": "You can print the Excel sheet by selecting the 'Print' option after downloading the file."
      },
    ],
    "Analytics & Reports": [
      {
        "question": "What is analytics, and how can I view service analytics?",
        "answer": "Analytics provides insights into your service performance, accessible in the 'Analytics' section of the app."
      },
      {
        "question": "What is a report, and how can I view reports about the service?",
        "answer": "Reports summarize your service data, which can be viewed in the 'Reports' section."
      },
      {
        "question": "How can I reach customers using advertisements?",
        "answer": "You can reach customers by creating and managing advertisements through the app's advertising feature."
      },
      {
        "question": "What are the basic details about the business page?",
        "answer": "The business page contains essential information about your services, contact details, and customer reviews."
      },
    ],
    "Logout & Account Management": [
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
        title: const Text(
          'App FAQs',
          style: TextStyle(fontFamily: 'Roboto', fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.teal,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: faqSections.entries.map((entry) {
          String sectionTitle = entry.key;
          List<Map<String, String>> faqList = entry.value;

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Section Title
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: Text(
                  sectionTitle,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                    color: Colors.teal,
                  ),
                ),
              ),
              // FAQ items
              ...faqList.map((faq) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 12.0),
                  child: GestureDetector(
                    onTap: () {
                      // Optionally, implement any action when the question is tapped
                    },
                    child: Container(
                      padding: const EdgeInsets.all(12.0),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.teal.withOpacity(0.5)),
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.white,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            faq["question"]!,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            faq["answer"]!,
                            style: const TextStyle(
                              fontSize: 16,
                              color: Colors.black54,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }).toList(),
              const Divider(thickness: 1, color: Colors.tealAccent),
            ],
          );
        }).toList(),
      ),
    );
  }
}
