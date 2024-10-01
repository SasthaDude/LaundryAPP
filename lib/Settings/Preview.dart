// import 'package:flutter/material.dart';
//
// class LaundryPreviewPage extends StatelessWidget {
//   final List<String> imgList = [
//     'assets/laund.jpg',
//     'assets/pic.png',
//     'assets/laund.jpg',
//     'assets/laund.jpg',
//     'assets/laund.jpg',
//     'assets/laund.jpg',
//
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         children: [
//           // Content Section
//           Container(
//             padding: EdgeInsets.all(20.0),
//             color: Colors.blueAccent,
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   "Laundry App Preview",
//                   style: TextStyle(
//                     fontSize: 28.0,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.white,
//                   ),
//                 ),
//                 SizedBox(height: 10.0),
//                 Text(
//                   "Experience how your customers will interact with our easy-to-use, modern interface. This preview showcases the app's key features and design.",
//                   style: TextStyle(
//                     fontSize: 18.0,
//                     color: Colors.white.withOpacity(0.9),
//                   ),
//                 ),
//                 SizedBox(height: 20.0),
//               ],
//             ),
//           ),
//
//           // GridView of images
//           Expanded(
//             child: GridView.builder(
//               padding: EdgeInsets.only(right: 40, left: 40, top: 10),
//               gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                 crossAxisCount: 1, // Number of columns
//                 crossAxisSpacing: 10.0,
//                 mainAxisSpacing: 10.0,
//                 childAspectRatio: .6, // Adjust to control image aspect ratio
//               ),
//               itemCount: imgList.length,
//               itemBuilder: (context, index) {
//                 return Container(
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(8.0),
//                     boxShadow: [
//                       BoxShadow(
//                         color: Colors.black.withOpacity(0.2),
//                         blurRadius: 5.0,
//                         offset: Offset(0, 3),
//                       ),
//                     ],
//                   ),
//                   child: ClipRRect(
//                     borderRadius: BorderRadius.circular(8.0),
//                     child: Image.asset(
//                       imgList[index],
//                       fit: BoxFit.cover,
//                     ),
//                   ),
//                 );
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
//
//
//



import 'package:flutter/material.dart';
import 'dart:ui';

class LaundryPreviewPage extends StatelessWidget {
  final List<String> imgList = [
    'assets/laund.jpg',
    'assets/pic.png',
    'assets/laund.jpg',
    'assets/laund.jpg',
    'assets/laund.jpg',
    'assets/laund.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Content Section
          Container(
            padding: EdgeInsets.all(20.0),
            color: Colors.blueAccent,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Laund App Preview",
                  style: TextStyle(
                    fontSize: 28.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 10.0),
                Text(
                  "Experience how your customers will interact with our easy-to-use, modern interface. This preview showcases the app's key features and design.",
                  style: TextStyle(
                    fontSize: 18.0,
                    color: Colors.white.withOpacity(0.9),
                  ),
                ),
                SizedBox(height: 20.0),
              ],
            ),
          ),

          // GridView of images
          Expanded(
            child: GridView.builder(
              padding: EdgeInsets.only(right: 40, left: 40, top: 10),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1, // Number of columns
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 10.0,
                childAspectRatio: .6, // Adjust to control image aspect ratio
              ),
              itemCount: imgList.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    _showImagePreview(context, index);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          blurRadius: 5.0,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.asset(
                        imgList[index],
                        fit: BoxFit.cover,
                      ),
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

  void _showImagePreview(BuildContext context, int initialIndex) {
    showDialog(
      context: context,
      barrierColor: Colors.black.withOpacity(0.5),
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: Colors.transparent,
          child: Stack(
            children: [
              PageView.builder(
                controller: PageController(initialPage: initialIndex),
                itemCount: imgList.length,
                itemBuilder: (context, index) {
                  return Center(
                    child: Image.asset(
                      imgList[index],
                      fit: BoxFit.contain,
                    ),
                  );
                },
              ),
              Positioned(
                top: 20.0,
                right: 20.0,
                child: IconButton(
                  icon: Icon(Icons.close, color: Colors.white, size: 30.0),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

