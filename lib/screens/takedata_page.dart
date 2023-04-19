//import 'dart:html';
//import 'dart:js';

import 'package:homzy1/auth.dart';
import 'package:flutter/material.dart';
import 'package:homzy1/screens/home_screen.dart';
import 'package:homzy1/utils.dart';
import 'dart:io';

import 'package:provider/provider.dart';
import 'package:homzy1/req_model.dart';
class LocationScreen extends StatefulWidget {
 // final String work;
   LocationScreen(
       //required this.work
       );
  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  File? image;

  final addressController = TextEditingController();
  final pinController = TextEditingController();
  final descController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    addressController.dispose();
    descController.dispose();
    pinController.dispose();
  }


  // for selecting image


  @override
  Widget build(BuildContext context) {

    void storeData({
      required int work
    }
    ) async {
      final ap = Provider.of<AuthProvider>(context, listen: false);
      ReqModel reqModel = ReqModel(
        userName: ap.userModel.name,
        desc: descController.text.trim(),
        address: addressController.text.trim(),
        pin: pinController.text.trim(),
        reqPic:" ",
        createdAt: "",
        userPhoneNumber: ap.userModel.phoneNumber,
        userUid:ap.userModel.uid,
        work: "fg",
        userPic: ap.userModel.profilePic
      );

      if (image != null) {
        print("111");
        ap.saveReqToFirebase(
          context: context,

          reqModel: reqModel,
          reqPic: image!,
          onSuccess: () {
print("asdf1");

                    Navigator.pushAndRemoveUntil(
                    context,

                    MaterialPageRoute(
                      builder: (context) => const HomeScreen(),
                    ),
                        (route) => false);
print("asdfhlk ks");

          },
        );
      } else {
        print("df");
        showSnackBar(context, "Please upload your profile photo");
      }
    }


    void selectImage() async {
      image = await pickImage(context);
      setState(() {});
    }
    return Scaffold(
      appBar: AppBar(
        title: Text('Enter Address Details'),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: 16.0),
              Text(
                'Enter Full Address :',
                style: TextStyle(fontSize: 16.0),
              ),
              SizedBox(height: 8.0),
              TextField(
                maxLines: 3,
                controller: addressController,
                decoration: InputDecoration(
                  hintText: 'Enter Full Address',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16.0),
              Text(
                'Enter PIN Code',
                style: TextStyle(fontSize: 16.0),
              ),
              SizedBox(height: 8.0),
              TextField(
                controller: pinController,
                decoration: InputDecoration(
                  hintText: 'PIN Code',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16.0),
              Text(
                'Problem Description:',
                style: TextStyle(fontSize: 16.0),
              ),
              SizedBox(height: 8.0),
              TextField(
                maxLines: 3,
                controller: descController,
                decoration: InputDecoration(
                  hintText: 'Enter Description',
                  border: OutlineInputBorder(),

                ),
              ),
              SizedBox(height: 16.0),
              Row(
                children: <Widget>[
                  ElevatedButton(
                    onPressed: () {
                      selectImage();
                    },
                    child: Text('Upload Image'),
                  ),
                  SizedBox(width: 16.0),
                  Expanded(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: image == null
                          ? Container(
                        width: 80,
                        height: 80,
                        decoration: BoxDecoration(
                          color: Color(0xFFC5C6d0),
                        ),
                        child: Icon(Icons.home, size: 40),
                      )
                          : Container(
                        width: 200,
                        height: 200,
                        child: Image.file(
                          image!,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              SizedBox(height: 16.0),
              Row(
                children: <Widget>[
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        print(addressController);
                        storeData(work: 1);
                      },
                      child: Text('Submit'),
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
}




