import 'package:flutter/material.dart';
//import 'package:homzy1/screens/respose.dart';
import 'package:flutter/material.dart';
import 'package:homzy1/auth.dart';
import 'package:homzy1/req_model.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:convert';
import 'dart:io';
import 'package:homzy1/booked_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:homzy1/req_model.dart';
import 'package:homzy1/utils.dart';
import 'package:flutter/material.dart';
import 'package:homzy1/user_model.dart';

import 'package:homzy1/screens/otp_screen.dart';
import 'package:homzy1/utils.dart';
import 'package:shared_preferences/shared_preferences.dart';
class bookedService extends StatefulWidget {
  @override
  _bookedServiceState createState() => _bookedServiceState();
}

class _bookedServiceState extends State<bookedService> {
  late FirebaseFirestore _firebaseFirestore;
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  //final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  @override
  void initState() {
    print("init");
    super.initState();
    _firebaseFirestore = FirebaseFirestore.instance;
  }

  @override
  Widget build(BuildContext context) {

    final ap = Provider.of<AuthProvider>(context,listen: false);
    return Scaffold(
      appBar: AppBar(
        title: Text('Booked Requests'),
      ),
      body: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
        stream: _firebaseFirestore.collection("moved").snapshots(),
        builder: (context, snapshot) {
          print("erro3r");
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
            print("6error");
          }

          if (snapshot.hasError) {
            return Center(child: Text("Error: ${snapshot.error}"));
          }
          print("err56or");
          print('Snapshot length: ${snapshot.data?.docs.length}');

          List<BookModel> reqList = [];







          for (final docSnapshot in snapshot.data!.docs) {
            print('reqList length: ${reqList.length}');

            print("error60r");
            final data = docSnapshot.data();
            print("error2345");

            if (data['userPhoneNumber'] == _firebaseAuth.currentUser!.phoneNumber) {
              final bookModel = BookModel.fromMap(data); // Instantiate a new BookModel object
              reqList.add(bookModel); // Add the new object to the reqList
            }
          }

          return ListView.builder(

            itemCount: reqList.length,
            itemBuilder: (context, index) {
             var userName= reqList[index].userName;
             var proPhoneNumber=reqList[index].proPhoneNumber;
            var proName=reqList[index].proName;
            var proPic=reqList[index].proPic;
            var work=reqList[index].work;
            var desc=reqList[index].desc;
            var reqPic=reqList[index].reqPic;
            var createdAt=reqList[index].createdAt;
              return   Container(
              padding: EdgeInsets.only(top: 30, left: 16, right: 16),
              child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              // IconButton(
              //   icon: Icon(Icons.arrow_back),
              //   onPressed: () {},
              // ),
              Text(
              'Booked Service',
              style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              ),
              ),
              SizedBox(
              width: 40,
              ),
              ],
              ),
              SizedBox(height: 32),
              Row(
              children: [
                Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: NetworkImage(reqList[index].proPic ?? 'https://example.com/default-image.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),

                SizedBox(width: 16),
              Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              Text(
              '$proName',
              style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              ),
              ),
              SizedBox(height: 8),
              Text(
              '$proPhoneNumber',
              style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              ),
              ),
              ],
              ),
              ],
              ),
              SizedBox(height: 40),
              Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
              Text(
              'Service Type',
              style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              ),
              ),
              Text(
              '$work',
              style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.grey[600],
              ),
              ),
              ],
              ),
              SizedBox(height: 16),
              Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
              Text(
              'Service Price',
              style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              ),
              ),
              Text(
              'Rs 599',
              style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.grey[600],
              ),
              ),
              ],
              ),
              SizedBox(height: 16),
              Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
              Text(
              'Service Date',
              style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              ),
              ),
              Text(
              '$createdAt',
              style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.grey[600],
              ),
              ),
              ],
              ),
              ],
              ),
              );
            },
          );
        },
      ),
    );
  }
}



