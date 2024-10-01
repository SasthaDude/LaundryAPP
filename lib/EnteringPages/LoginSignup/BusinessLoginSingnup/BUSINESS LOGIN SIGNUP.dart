import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:video_player/video_player.dart';
import '../../../BusinessPages/BusinessFirstPage.dart';
import '../../../THEMES/LoginSignupTheme.dart';

class BusinessLoginSignup extends StatefulWidget {
  const BusinessLoginSignup({super.key});

  @override
  State<BusinessLoginSignup> createState() => _BusinessLoginSignupState();
}

class _BusinessLoginSignupState extends State<BusinessLoginSignup> {

  final TextEditingController signupEmailController = TextEditingController();
  final TextEditingController logInPhoneController = TextEditingController();
  final TextEditingController forgotPasswordEmailController = TextEditingController();
  final TextEditingController signupPasswordController = TextEditingController();
  final TextEditingController logInPasswordController = TextEditingController();
  final TextEditingController signupRePasswordController = TextEditingController();
  final GlobalKey<FormState> signUpFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> logInFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> forgotPasswordFormKey = GlobalKey<FormState>();
  bool signupIsPasswordVisible = false;
  bool logInIsPasswordVisible = false;
  bool signupIsRePasswordVisible = false;
  bool showPasswordReset = false;

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
    return SafeArea(
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(150.0),
            child: AppBar(
              flexibleSpace: FlexibleSpaceBar(
                background: Container(
                  height: 130,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: ButtonBackgroundColor,
                  ),
                  child: Center(
                    child: Text("Laund Business",
                     style: appbarThemeLOGINSIGNUP,
                     // style: TextStyle(fontSize: 40, color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ),
          ),
          body: Stack(
            children: [
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
              Column(
              children: [
                TabBar(
                  labelStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20
                  ),
                  unselectedLabelStyle: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold
                  ),
                  indicatorColor: Colors.black,
                  unselectedLabelColor: Colors.white,
                  labelColor: Colors.black,
                  indicatorSize: TabBarIndicatorSize.tab,
                  tabs: [
                    Tab(text: 'BUSINESS SIGNUP'),
                    Tab(text: 'BUSINESS LOGIN'),
                  ],
                ),
                Expanded(
                  child: TabBarView(
                    children: [
                      SignupTab(),
                      showPasswordReset ? forgotPasswordContainer() :
                      LoginTab(),
                    ],
                  ),
                ),
              ],
            ),
        ],
          ),
        ),
      ),
    );
  }

  Widget SignupTab() {
    return Form(
      key: signUpFormKey,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Text(
              "Create Account",
              style: PageHeadingThemeLOGINSIGNUP,
              //style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Card(
              elevation: 10,
              color: Colors.white,
              child: TextFormField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  prefixIcon: Padding(
                    padding: const EdgeInsets.only(top: 7, left: 8),
                    child: FaIcon(FontAwesomeIcons.building,),
                  ),
                  contentPadding: EdgeInsets.all(20),
                  filled: true,
                  fillColor: Colors.white,
                  hintText: "Company Name",
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Card(
              elevation: 10,
              color: Colors.white,
              child: TextFormField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  prefixIcon: Icon(Icons.phone),
                  contentPadding: EdgeInsets.all(20),
                  filled: true,
                  fillColor: Colors.white,
                  hintText: "Phone Number",
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Card(
              elevation: 10,
              color: Colors.white,
              child: TextFormField(
                controller: signupEmailController,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  prefixIcon: Icon(Icons.email_outlined),
                  contentPadding: EdgeInsets.all(20),
                  filled: true,
                  fillColor: Colors.white,
                  hintText: "Email ID",
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                    return 'Please enter a valid email';
                  }
                  return null;
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Card(
              elevation: 10,
              color: Colors.white,
              child: TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your password';
                  }
                  return null;
                },
                controller: signupPasswordController,
                obscureText: !signupIsPasswordVisible,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "Password",
                  prefixIcon: Icon(Icons.lock_outlined),
                  suffixIcon: IconButton(
                    icon: Icon(
                      signupIsPasswordVisible ? Icons.visibility : Icons.visibility_off,
                      color: Colors.black,
                    ),
                    onPressed: () {
                      setState(() {
                        signupIsPasswordVisible = !signupIsPasswordVisible;
                      });
                    },
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Card(
              elevation: 10,
              color: Colors.white,
              child: TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your password';
                  }
                  return null;
                },
                controller: signupRePasswordController,
                obscureText: !signupIsRePasswordVisible,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "Re-Enter Password",
                  prefixIcon: Icon(Icons.lock_outlined),
                  suffixIcon: IconButton(
                    icon: Icon(
                      signupIsRePasswordVisible ? Icons.visibility : Icons.visibility_off,
                      color: Colors.black,
                    ),
                    onPressed: () {
                      setState(() {
                        signupIsRePasswordVisible = !signupIsRePasswordVisible;
                      });
                    },
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () {
                if (signUpFormKey.currentState!.validate()) {
                 setState(() {
                   Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>BusinessFirstPage()));

                 });
                }
              },
              child: Container(
                height: 50,
                width: 350,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.8),
                      spreadRadius: 3,
                      blurRadius: 7,
                      offset: Offset(0, 2.6),
                    )
                  ],
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.blueAccent,
                ),
                child: Center(
                  child: Text(
                    "Join in Community",
                    style: ButtonTextThemeLOGINSIGNUP,
                    //style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500, color: Colors.white),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 15, bottom: 15, right: 50, left: 50),
            child: RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                children: [
                  TextSpan(
                    text: "By creating an account, you agree to ",
                   style: RichTextThemeLOGINSIGNUP1
                   // style: TextStyle(color: Colors.black),
                  ),
                  TextSpan(
                    text: "Terms of use ",
                      style: RichTextThemeLOGINSIGNUP2
                  ),
                  TextSpan(
                    text: "and ",
                      style: RichTextThemeLOGINSIGNUP1
                  ),
                  TextSpan(
                    text: "Privacy Policy ",
                      style: RichTextThemeLOGINSIGNUP2

                  ),
                ],
              ),
            ),
          ),

        ],
      ),
    );
  }

  Widget LoginTab() {
    return Form(
      key: logInFormKey,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Text(
              "Login to your Account",
              style: PageHeadingThemeLOGINSIGNUP,
              //style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Card(
              elevation: 10,
              color: Colors.white,
              child: TextFormField(
                controller: logInPhoneController,
                keyboardType: TextInputType.phone,
                maxLength: 10, // Limits the input to 10 digits
                decoration: InputDecoration(
                  counterText: '', // Hides the character counter text
                  border: InputBorder.none,
                  prefixIcon: Icon(Icons.phone_outlined),
                  // contentPadding: EdgeInsets.all(20),
                  // filled: true,
                  // fillColor: Colors.white,
                  hintText: "Phone Number",
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your phone number';
                  } else if (!RegExp(r'^\d{10}$').hasMatch(value)) {
                    return 'Please enter a valid 10-digit phone number';
                  }
                  return null;
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Card(
              elevation: 10,
              color: Colors.white,
              child: TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your password';
                  }
                  return null;
                },
                controller: logInPasswordController,
                obscureText: !logInIsPasswordVisible,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "Password",
                  prefixIcon: Icon(Icons.lock_outlined),
                  suffixIcon: IconButton(
                    icon: Icon(
                      logInIsPasswordVisible ? Icons.visibility : Icons.visibility_off,
                      color: Colors.black,
                    ),
                    onPressed: () {
                      setState(() {
                        logInIsPasswordVisible = !logInIsPasswordVisible;
                      });
                    },
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 35, top: 10, bottom: 20),
            child: Align(
              alignment: Alignment.bottomRight,
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    showPasswordReset = true;
                  });
                },
                child: Text(
                  "Forgot Password?",
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              if (logInFormKey.currentState!.validate()) {
                setState(() {
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>BusinessFirstPage()));
                });
              }
            },
            child: Container(
              height: 50,
              width: 350,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.8),
                    spreadRadius: 3,
                    blurRadius: 7,
                    offset: Offset(0, 2.6),
                  )
                ],
                borderRadius: BorderRadius.circular(30),
                color: Colors.blueAccent,
              ),
              child: Center(
                child: Text(
                  "Login",
                  style: ButtonTextThemeLOGINSIGNUP,
                  //style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500, color: Colors.white),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget forgotPasswordContainer() {
    return Column(
      children: [
        Row(
          children: [
            Center(
              child: IconButton(
                onPressed: () {
                  setState(() {
                    showPasswordReset = false;  // Hide password reset and show TabBarView
                  });
                }, icon: Icon(Icons.arrow_back),
              ),

            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text(
                "ENTER YOUR EMAIL",
                style: PageHeadingThemeLOGINSIGNUP,
                //style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Card(
            elevation: 10,
            color: Colors.white,
            child: TextFormField(
              controller: logInPhoneController,
              keyboardType: TextInputType.phone,
              maxLength: 10, // Limits the input to 10 digits
              decoration: InputDecoration(
                counterText: '', // Hides the character counter text
                border: InputBorder.none,
                prefixIcon: Icon(Icons.phone_outlined),
                // contentPadding: EdgeInsets.all(20),
                // filled: true,
                // fillColor: Colors.white,
                hintText: "Phone Number",
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your phone number';
                } else if (!RegExp(r'^\d{10}$').hasMatch(value)) {
                  return 'Please enter a valid 10-digit phone number';
                }
                return null;
              },
            ),
          ),
        ),
        SizedBox(height: 20),
        GestureDetector(
          onTap: () {
            setState(() {
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => BusinessFirstPage()));
            });
            // if (forgotPasswordFormKey.currentState!.validate()) {
            // }
          },
          child: Container(
            height: 50,
            width: 350,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.8),
                  spreadRadius: 3,
                  blurRadius: 7,
                  offset: Offset(0, 2.6),
                )
              ],
              borderRadius: BorderRadius.circular(30),
              color: Colors.blueAccent,
            ),
            child: Center(
              child: Text(
                "Send Code",
               style: ButtonTextThemeLOGINSIGNUP,
               // style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500, color: Colors.white),
              ),
            ),
          ),
        ),

      ],
    );
  }
}