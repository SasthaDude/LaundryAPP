import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';
import '../Provider/Provider.dart';
import '../THEMES/BasicTheme.dart';
import 'BUSINESSCOMPANYDETAILS.dart';
import 'BUsinessReport.dart';
import 'BusinessAnalysis.dart';
import 'BusinessLeads.dart';


class BusinessFirstPage extends StatefulWidget {
  const BusinessFirstPage({super.key});

  @override
  State<BusinessFirstPage> createState() => _BusinessFirstPageState();
}

class _BusinessFirstPageState extends State<BusinessFirstPage> {

  @override
  Widget build(BuildContext context) {

    final textModel = Provider.of<AppDataProvider>(context);

    final screenWidth = MediaQuery.of(context).size.width;
    double responsiveHeight(BuildContext context, double baseHeight) {
      return baseHeight * MediaQuery.of(context).size.height / 812; // 812 is a reference height (like iPhone X height)
    }

    return SafeArea(
      child: Scaffold(
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

              // ListTile(
              //   leading: Icon(Icons.person),
              //   title: Text(
              //     'Profile',
              //     style: TextStyle(fontSize: 18 ),
              //   ),
              //   onTap: () {
              //     Navigator.push(context,
              //         MaterialPageRoute(builder: (context)=>BusinessProfileScreen()));
              //   },
              // ),
              ListTile(
                leading: Icon(Icons.add_box_outlined),
                title: Text(
                  'Help Center',
                  style: TextStyle(fontSize: 18),
                ),
                onTap: () {
                },
              ),
              ListTile(
                leading: Icon(Icons.settings),
                title: Text(
                  'Settings',
                  style: TextStyle(fontSize: 18),
                ),
                onTap: () {
                },
              ),
              ListTile(
                leading: Icon(Icons.touch_app_outlined),
                title: Text(
                  'About app',
                  style: TextStyle(fontSize: 18),
                ),
                onTap: () {
                },
              ),
              ListTile(
                leading: Icon(Icons.share),
                title: Text("Share",style: TextStyle(fontSize: 18 )
                ),
                onTap: (){
                  Share.share('Check out this app: https://play.google.com/store/apps/details?id=com.google.android.gm&pcampaignid=web_share');
                },

              ),
              ListTile(
                leading: Icon(Icons.assignment_ind_outlined),
                title: Text(
                  'Log out',
                  style: TextStyle(fontSize: 18 ),
                ),
                onTap: () {},
              ),
            ],
          ),
        ),
        appBar: AppBar(
          title: Text(
            "LAUND",
            style: appName(context),
          ),
          toolbarHeight: responsiveHeight(context, 70), // Adjust the toolbar height
        ),
        body: Stack(
          children: [
            BackgroundImageContainer(context),

            SingleChildScrollView(
              child: Column(
                //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(height: 30,),
                  GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>BusinessCompanyDetails()));
                    },
                    child: Card(
                      elevation: 10,
                      color: Colors.grey.withOpacity(0.7),
                      child: Container(
                        height: 120,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(

                        ),
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Card(
                                elevation: 10,
                                child: Container(
                                  height: 100,
                                  width: 100,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      border: Border.all(color: Colors.blue),
                                      color: Colors.white
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: 10,),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text('${textModel.businessName}',
                                style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 24),),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 40,),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("My Business",style: TextStyle(color: Colors.black,fontSize: 25,fontWeight: FontWeight.w600),),
                  ),
                  SizedBox(height: 30,),
                  GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>BusinessLeads()));
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 130,
                        width: 500,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(),
                            color: Colors.grey.withOpacity(0.7)
                        ),
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(18.0),
                              child: Container(
                                height: 80,
                                width: 80,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    image: DecorationImage(
                                        fit: BoxFit.fill,
                                        image: NetworkImage("data:image/jpeg;base64,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")
                                    )
                                ),
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(right: 20,top:8 ),
                                  child: Text("Leads", softWrap: true,
                                    maxLines: 3, // Adjust this value based on how many lines you want
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(fontSize: 24,fontWeight: FontWeight.w600,color: Colors.black),),
                                ),
                                Text("To view leads", softWrap: true,
                                  maxLines: 3, // Adjust this value based on how many lines you want
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600,color: Colors.black),),

                              ],
                            )
                          ],
                        ),
                      ),

                    ),
                  ),
                  GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>BusinessAnalysis()));
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 130,
                        width: 500,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(),
                            color: Colors.grey.withOpacity(0.7)

                        ),
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(18.0),
                              child: Container(
                                height: 80,
                                width: 80,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    image: DecorationImage(
                                        fit: BoxFit.fill,
                                        image: NetworkImage("https://cdn-icons-png.flaticon.com/512/6104/6104564.png")
                                    )
                                ),
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(right: 20,top: 8),
                                  child: Text("Analatics", softWrap: true,
                                    maxLines: 3, // Adjust this value based on how many lines you want
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(fontSize: 24,fontWeight: FontWeight.w600,color: Colors.black),),
                                ),
                                Text("Analysis your leads", softWrap: true,
                                  maxLines: 3, // Adjust this value based on how many lines you want
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600,color: Colors.black),),

                              ],
                            )
                          ],
                        ),
                      ),

                    ),
                  ),
                  GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>BusinessReport()));
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 130,
                        width: 500,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(),
                            color: Colors.grey.withOpacity(0.7)

                        ),
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(18.0),
                              child: Container(
                                height: 80,
                                width: 80,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    image: DecorationImage(
                                        fit: BoxFit.fill,
                                        image: NetworkImage("data:image/png;base64,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")
                                    )
                                ),
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(right: 20,top: 8),
                                  child: Text("Reports", softWrap: true,
                                    maxLines: 3, // Adjust this value based on how many lines you want
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(fontSize: 24,fontWeight: FontWeight.w600,color: Colors.black),),
                                ),
                                Text("See all your reports", softWrap: true,
                                  maxLines: 3, // Adjust this value based on how many lines you want
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600,color: Colors.black),),

                              ],
                            )
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
