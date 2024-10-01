import 'dart:math';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

import '../LoginSignup/BusinessLoginSingnup/BUSINESS LOGIN SIGNUP.dart';
import '../LoginSignup/USER LOGIN SIGNUP/userloginsignup.dart';

class Welcome extends StatefulWidget {
  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();

    // Initialize the video player with an asset video
    _controller = VideoPlayerController.asset('assets/newBackgroundVideo.mp4')
      ..initialize().then((_) {
        setState(() {}); // Ensures the first frame is shown after initialization
      })
      ..setLooping(true) // Set looping to true to run continuously
      ..setPlaybackSpeed(0.7) // Set playback speed (0.8 means 80% of normal speed)
      ..play(); // Auto-play the video
  }

  @override
  Widget build(BuildContext context) {
    // Get screen size
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            ///------------picture background-------------------///
            // Container(
            //   decoration: BoxDecoration(
            //     image: DecorationImage(
            //       image: AssetImage('assets/backgroundPicture.jpeg'),
            //       fit: BoxFit.cover,
            //     ),
            //   ),
            //   child: BackdropFilter(
            //     filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
            //     child: Container(
            //       color: Colors.black.withOpacity(0.4),
            //     ),
            //   ),
            // ),
            ///------------video background--------------///
            if (_controller.value.isInitialized)
              Positioned.fill(
                child: FittedBox(
                  fit: BoxFit.cover,
                  child: SizedBox(
                    width: _controller.value.size?.width ?? 0,
                    height: _controller.value.size?.height ?? 0,
                    child: Transform(
                        alignment: Alignment.center,
                        transform: Matrix4.rotationX(pi), // Rotate 180 degrees to flip upside down
                        child: VideoPlayer(_controller)),
                  ),
                ),
              ),
            Positioned.fill(
              child: Container(
                color: Colors.black.withOpacity(0.3), // Optional overlay color to dim the blurred video
              ),
            ),
            ///---------------------------------------///
            Center(
              child: Column(
                //crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "WELCOME TO",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: screenHeight * 0.04, // Responsive text size
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      letterSpacing: 14,
                      shadows: [
                        Shadow(
                          color: Colors.black.withOpacity(0.2),
                          offset: Offset(0, 4),
                          blurRadius: 10,
                        ),
                      ],
                    ),
                  ),
                  Text(
                    "LAUND",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: screenHeight * 0.08, // Responsive text size
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      letterSpacing: 2,
                      shadows: [
                        Shadow(
                          color: Colors.black.withOpacity(0.2),
                          offset: Offset(0, 4),
                          blurRadius: 10,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.03), // Responsive spacing
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Image.asset(
                      'assets/laundry.png',
                      height: screenHeight * 0.4, // Responsive image height
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.05), // Responsive spacing
                  Text(
                    "Choose your profile",
                    style: TextStyle(
                      fontSize: screenHeight * 0.02, // Responsive text size
                      fontWeight: FontWeight.w300,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.03), // Responsive spacing
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => UserLoginSignup()),
                        );
                      },
                      child: Container(
                        height: screenHeight * 0.07, // Responsive height
                        width: screenWidth * 0.7, // Responsive width
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          gradient: LinearGradient(
                            colors: [Colors.white, Colors.white70],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.2),
                              spreadRadius: 3,
                              blurRadius: 10,
                              offset: Offset(0, 4),
                            ),
                          ],
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.person, color: Colors.blueAccent, size: screenHeight * 0.03), // Responsive icon size
                            SizedBox(width: 10),
                            Text(
                              "User or Customer",
                              style: TextStyle(
                                fontSize: screenHeight * 0.025, // Responsive text size
                                fontWeight: FontWeight.bold,
                                color: Colors.blueAccent,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => BusinessLoginSignup()),
                        );
                      },
                      child: Container(
                        height: screenHeight * 0.07, // Responsive height
                        width: screenWidth * 0.7, // Responsive width
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          gradient: LinearGradient(
                            colors: [Colors.white, Colors.white70],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.2),
                              spreadRadius: 3,
                              blurRadius: 10,
                              offset: Offset(0, 4),
                            ),
                          ],
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.business, color: Colors.blueAccent, size: screenHeight * 0.03), // Responsive icon size
                            SizedBox(width: 10),
                            Text(
                              "Business",
                              style: TextStyle(
                                fontSize: screenHeight * 0.025, // Responsive text size
                                fontWeight: FontWeight.bold,
                                color: Colors.blueAccent,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}



