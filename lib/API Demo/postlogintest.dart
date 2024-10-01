

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class LoginPostTest extends StatefulWidget {
  const LoginPostTest({super.key});

  @override
  State<LoginPostTest> createState() => _LoginPostTestState();
}

class _LoginPostTestState extends State<LoginPostTest> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  Future<bool>? _success;

  Future<bool> testLoginPost(String nameController,
      String emailController,
      String phoneController,
      String passwordController,
      String confirmPasswordController) async {
    try {
      var postLoginRes = await http.post(
        //Uri.parse("http://your-local-ip:5503/Laund/laundpost"),
        Uri.parse("http://localhost:5503/User/loginpost"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=utf-8',
        },
        body: jsonEncode(<String, dynamic>{
          "name": nameController,
          "phonenumber": phoneController,
          "email": emailController,
          "password": passwordController,
          "confirmpassword": confirmPasswordController,
          "_id": "66d2c06d8b6bc6468b66fdd2",
          "__v": 0
        }),
      );
      if (postLoginRes.statusCode == 200) {
        return jsonDecode(postLoginRes.body)["success"];
      } else {
        return false;
      }
    } catch (e) {
      print("Error: $e");
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          height: 500,
          width: 300,
          padding: EdgeInsets.all(16.0),
          child: _success == null ? buildColumn() : BuildFutureBuilder(),
        ),
      ),
    );
  }

  Column buildColumn() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        TextFormField(
          decoration: InputDecoration(hintText: "Name"),
          controller: nameController,
        ),
        TextFormField(
          decoration: InputDecoration(hintText: "Phone"),
          controller: phoneController,
        ),
        TextFormField(
          decoration: InputDecoration(hintText: "Email"),
          controller: emailController,
        ),
        TextFormField(
          decoration: InputDecoration(hintText: "password"),
          controller: passwordController,
        ),
        TextFormField(
          decoration: InputDecoration(hintText: "confirm password"),
          controller: confirmPasswordController,
        ),
        ElevatedButton(
          onPressed: () {
            setState(() {
              _success = testLoginPost(
                nameController.text,
                emailController.text,
                phoneController.text,
                passwordController.text,
                confirmPasswordController.text,
              );
            });
          },
          child: Text("Save"),
        ),
      ],
    );
  }


  FutureBuilder BuildFutureBuilder(){
    return FutureBuilder(
        future: _success,
        builder: (BuildContext context, snapshot){
          if(snapshot.hasData){
            return Text("added successfully");
          } else if(snapshot.hasError){
            return Text("error");
          }  return CircularProgressIndicator();
        }
    );
  }
}
