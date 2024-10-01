// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';
//
// class RegistrationPage extends StatefulWidget {
//   @override
//   _RegistrationPageState createState() => _RegistrationPageState();
// }
//
// class _RegistrationPageState extends State<RegistrationPage> {
//   final GlobalKey<FormState> formKey = GlobalKey<FormState>();
//   final Map<String, String> detailsData = {
//     'name': '',
//     'phone': '',
//     'email': '',
//     'address': '',
//     'pincode': '',
//     'gender': '',
//     'dob': '',
//     'password': '',
//   };
//
//   final RegExp nameRegEx = RegExp(r'^[a-zA-Z\s]+$');
//   final RegExp phoneRegEx = RegExp(r'^[0-9]{10}$');
//   final RegExp emailRegEx = RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
//   final RegExp pincodeRegEx = RegExp(r'^[0-9]{6}$');
//   final RegExp genderRegEx = RegExp(r'^(Male|Female|Other)$');
//   final RegExp dobRegEx = RegExp(r'^\d{4}-\d{2}-\d{2}$');
//   final RegExp passwordRegEx = RegExp(r'(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[A-Za-z\d@$!%*?&]{8,}');
//
//   void registerSubmit() async {
//     if (formKey.currentState?.validate() == true) {
//       formKey.currentState?.save();
//       SharedPreferences prefs = await SharedPreferences.getInstance();
//       prefs.setString('name', detailsData['name']!);
//       prefs.setString('phone', detailsData['phone']!);
//       prefs.setString('email', detailsData['email']!);
//       prefs.setString('address', detailsData['address']!);
//       prefs.setString('pincode', detailsData['pincode']!);
//       prefs.setString('gender', detailsData['gender']!);
//       prefs.setString('dob', detailsData['dob']!);
//       prefs.setString('password', detailsData['password']!);
//
//       // Navigate to the login page
//       Navigator.pushReplacement(
//         context,
//         MaterialPageRoute(builder: (context) => LoginPage()),
//       );
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Registration')),
//       body: Padding(
//         padding: EdgeInsets.all(16.0),
//         child: Form(
//           key: formKey,
//           child: Column(
//             children: [
//               // Name
//               TextFormField(
//                 decoration: InputDecoration(labelText: 'Name'),
//                 validator: (value) {
//                   if (value == null || !nameRegEx.hasMatch(value)) {
//                     return 'Enter a valid name';
//                   }
//                   return null;
//                 },
//                 onSaved: (value) => detailsData['name'] = value!,
//               ),
//               // Phone Number
//               TextFormField(
//                 decoration: InputDecoration(labelText: 'Phone Number'),
//                 validator: (value) {
//                   if (value == null || !phoneRegEx.hasMatch(value)) {
//                     return 'Enter a valid phone number';
//                   }
//                   return null;
//                 },
//                 onSaved: (value) => detailsData['phone'] = value!,
//               ),
//               // Email
//               TextFormField(
//                 decoration: InputDecoration(labelText: 'Email'),
//                 validator: (value) {
//                   if (value == null || !emailRegEx.hasMatch(value)) {
//                     return 'Enter a valid email';
//                   }
//                   return null;
//                 },
//                 onSaved: (value) => detailsData['email'] = value!,
//               ),
//               // Address
//               TextFormField(
//                 decoration: InputDecoration(labelText: 'Address'),
//                 onSaved: (value) => detailsData['address'] = value!,
//               ),
//               // Pincode
//               TextFormField(
//                 decoration: InputDecoration(labelText: 'Pincode'),
//                 validator: (value) {
//                   if (value == null || !pincodeRegEx.hasMatch(value)) {
//                     return 'Enter a valid pincode';
//                   }
//                   return null;
//                 },
//                 onSaved: (value) => detailsData['pincode'] = value!,
//               ),
//               // Gender
//               TextFormField(
//                 decoration: InputDecoration(labelText: 'Gender (Male/Female/Other)'),
//                 validator: (value) {
//                   if (value == null || !genderRegEx.hasMatch(value)) {
//                     return 'Enter a valid gender (Male, Female, Other)';
//                   }
//                   return null;
//                 },
//                 onSaved: (value) => detailsData['gender'] = value!,
//               ),
//               // Date of Birth
//               TextFormField(
//                 decoration: InputDecoration(labelText: 'Date of Birth (yyyy-mm-dd)'),
//                 validator: (value) {
//                   if (value == null || !dobRegEx.hasMatch(value)) {
//                     return 'Enter a valid date of birth (yyyy-mm-dd)';
//                   }
//                   return null;
//                 },
//                 onSaved: (value) => detailsData['dob'] = value!,
//               ),
//               // Password
//               TextFormField(
//                 decoration: InputDecoration(labelText: 'Password'),
//                 obscureText: false,
//                 validator: (value) {
//                   if (value == null || !passwordRegEx.hasMatch(value)) {
//                     return 'Password must be at least 8 characters, include an uppercase letter, a lowercase letter, and a number';
//                   }
//                   return null;
//                 },
//                 onSaved: (value) => detailsData['password'] = value!,
//               ),
//               SizedBox(height: 20),
//               // Submit button
//               ElevatedButton(
//                 onPressed: registerSubmit,
//                 child: Text('Register'),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// class LoginPage extends StatefulWidget {
//   @override
//   _LoginPageState createState() => _LoginPageState();
// }
//
// class _LoginPageState extends State<LoginPage> {
//   final GlobalKey<FormState> formKey = GlobalKey<FormState>();
//   final Map<String, String> loginData = {
//     'email': '',
//     'password': '',
//   };
//
//   void loginSubmit() async {
//     if (formKey.currentState?.validate() == true) {
//       formKey.currentState?.save();
//       SharedPreferences prefs = await SharedPreferences.getInstance();
//
//       // Retrieve stored email and password
//       String? storedEmail = prefs.getString('email');
//       String? storedPassword = prefs.getString('password');
//
//       // Validate login credentials
//       if (loginData['email'] == storedEmail && loginData['password'] == storedPassword) {
//         Navigator.pushReplacement(
//           context,
//           MaterialPageRoute(builder: (context) => DetailsPage()),
//         );
//       } else {
//         ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Invalid email or password')));
//       }
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Login')),
//       body: Padding(
//         padding: EdgeInsets.all(16.0),
//         child: Form(
//           key: formKey,
//           child: Column(
//             children: [
//               // Email
//               TextFormField(
//                 decoration: InputDecoration(labelText: 'Email'),
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Enter your email';
//                   }
//                   return null;
//                 },
//                 onSaved: (value) => loginData['email'] = value!,
//               ),
//               // Password
//               TextFormField(
//                 decoration: InputDecoration(labelText: 'Password'),
//                 obscureText: true,
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Enter your password';
//                   }
//                   return null;
//                 },
//                 onSaved: (value) => loginData['password'] = value!,
//               ),
//               SizedBox(height: 20),
//               // Submit button
//               ElevatedButton(
//                 onPressed: loginSubmit,
//                 child: Text('Login'),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// // Details page to show saved data
// class DetailsPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Details')),
//       body: FutureBuilder<SharedPreferences>(
//         future: SharedPreferences.getInstance(),
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return Center(child: CircularProgressIndicator());
//           }
//
//           final prefs = snapshot.data!;
//           return DataTable(
//             columns: [
//               DataColumn(label: Text('Field')),
//               DataColumn(label: Text('Value')),
//             ],
//             rows: [
//               DataRow(
//                   cells: [
//                     DataCell(Text('Name')
//                     ),
//                     DataCell(
//                         Text(prefs.getString('name') ?? '')
//                     )
//                   ]
//               ),
//               DataRow(cells: [DataCell(Text('Phone')), DataCell(Text(prefs.getString('phone') ?? ''))]),
//               DataRow(cells: [DataCell(Text('Email')), DataCell(Text(prefs.getString('email') ?? ''))]),
//               DataRow(cells: [DataCell(Text('Address')), DataCell(Text(prefs.getString('address') ?? ''))]),
//               DataRow(cells: [DataCell(Text('Pincode')), DataCell(Text(prefs.getString('pincode') ?? ''))]),
//               DataRow(cells: [DataCell(Text('Gender')), DataCell(Text(prefs.getString('gender') ?? ''))]),
//               DataRow(cells: [DataCell(Text('Date of Birth')), DataCell(Text(prefs.getString('dob') ?? ''))]),
//             ],
//           );
//         },
//       ),
//     );
//   }
// }



