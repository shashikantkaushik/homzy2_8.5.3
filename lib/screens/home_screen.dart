import 'package:flutter/material.dart';
import 'package:homzy1/auth.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:homzy1/req_model.dart';
import 'package:homzy1/screens/profile_screen.dart';
import 'package:provider/provider.dart';
import 'dart:io';
import 'package:homzy1/utils.dart';
import 'package:homzy1/screens/screen_page.dart';
import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:homzy1/screens/account_page.dart';
import 'package:homzy1/screens/takedata_page.dart';
import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';

import 'package:homzy1/screens/booked_service.dart';




class HomeScreen extends StatefulWidget {

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // File? image;
  // void selectImage() async {
  //   image = await pickImage(context);
  //   setState(() {});
  // }

  Widget categoriesConatiner({required String image , required String name}){
    return  Container(
      child: Expanded(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              child: Image.asset('assets/image1.png', height: 50, width: 50),
            ),
            SizedBox(height: 8),
            Padding(
              padding: EdgeInsets.all(0.5),
              child: Center(child:
              Text('Events',
                style:
                TextStyle(fontSize: 16,
                  color:
                  Color(0xFFc4c4e8),
                ),
              ),
              ),
            ),
          ],
        ),

      ),
    );
  }
  // Widget categoriesConatiner2({required String image , required String name}){
  //   return  Column(
  //     children: [
  //       Container(
  //         margin: EdgeInsets.only(left: 20),
  //         height: 20,
  //         width: 20,
  //         decoration: BoxDecoration(
  //           image: DecorationImage(image: AssetImage('assets/small_services/pet.png'),),
  //           color: Colors.lightGreen,
  //           borderRadius: BorderRadius.circular(10),
  //         ),
  //       ),
  //       SizedBox(
  //         height: 10,
  //       ),
  //       Text(name,
  //         style: TextStyle(
  //           fontSize: 20,
  //           color: Colors.black,
  //         ),),
  //     ],
  //   );
  // }
  // Widget draweritem({required String name, required IconData icon}){
  //   return   ListTile(
  //     leading: Icon(
  //       icon,
  //       color: Colors.white,
  //     ),
  //     title: Text(
  //       name ,
  //       style: TextStyle(
  //           color: Colors.white,
  //           fontSize: 20),
  //     ),
  //   );
  // }

  @override

  Widget build(BuildContext context) {
    final ap = Provider.of<AuthProvider>(context, listen: false); 
    final name=(ap.userModel.name);
    final email=(ap.userModel.email);
    final bio=(ap.userModel.bio);
    final phone=(ap.userModel.phoneNumber);
    final pic=(ap.userModel.profilePic);
    final uid=(ap.userModel.uid);
    final date=(ap.userModel.createdAt);
    // final DatabaseReference databaseReference = FirebaseDatabase.instance.reference().child('messages');
    final t = (ap.userModel.name);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF189AB4),
        centerTitle: false,

        title: Text("Hello, $t",),
        actions: [
          GestureDetector(
            onTap: () {
              print("dlo");
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const Profile(),
                ),
              );
            },
            child: CircleAvatar(

              backgroundImage: NetworkImage(ap.userModel.profilePic),
              backgroundColor: Color(0xFF189AB4),
              radius: 50,
            ),
          )

        ],
      ),body: SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child:
      Column(
        children: [
          Container(
            padding: EdgeInsets.all(16.0),
            child: Row(
              children: [
                Icon(Icons.location_on),
                SizedBox(width: 16.0),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('123 Main Street'),
                      Text('New York, NY 10001'),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Flexible(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Color(0xFFe9e4f4),
                  ),
                  margin: EdgeInsets.only(left: 10),
                  height: 100,
                  width: 200,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        child: Image.asset('assets/images/spa.png', height: 50, width: 50),
                      ),
                      SizedBox(height: 8),
                      Padding(
                        padding: EdgeInsets.all(0.5),
                        child: Center(child:
                        Text('Women Spa',
                          style:
                          TextStyle(fontSize: 16,
                            color:
                            Colors.black54,
                          ),
                        ),
                        ),
                      ),
                    ],
                  ),

                ),
              ),
              Flexible(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Color(0xFFe9e4f4),
                  ),
                  margin: EdgeInsets.only(left: 10, right: 10),
                  height: 100,
                  width: 200,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        child: Image.asset('assets/images/massage.png', height: 50, width: 50),
                      ),
                      SizedBox(height: 8),
                      Padding(
                        padding: EdgeInsets.all(0.5),
                        child: Center(child:
                        Text('Men Massage',
                          style:
                          TextStyle(fontSize: 16,
                            color:
                            Colors.black54,
                          ),
                        ),
                        ),
                      ),
                    ],
                  ),

                ),
              ),
            ],
          ),
          Container(
            height: 150,
            color: Colors.white,
            child: Row(
              //    mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Color(0xFFe9e4f4),
                    ),
                    margin: EdgeInsets.only(left: 10),
                    height: 100,
                    width: 200,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          child: Image.asset('assets/images/cleaning.png', height: 50, width: 50),
                        ),

                        SizedBox(height: 8),
                        Padding(
                          padding: EdgeInsets.all(0.5),
                          child: Center(child:
                          Text('Cleaning',
                            style:
                            TextStyle(fontSize: 16,
                              color:
                              Colors.black54,
                            ),
                          ),
                          ),
                        ),
                      ],
                    ),

                  ),
                ),
                Flexible(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Color(0xFFe9e4f4),
                    ),
                    margin: EdgeInsets.only(left: 10),
                    height: 100,
                    width: 200,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          child: Image.asset('assets/images/painting.png', height: 50, width: 50),
                        ),
                        SizedBox(height: 8),
                        Padding(
                          padding: EdgeInsets.all(0.5),
                          child: Center(child:
                          Text('Painting',
                            style:
                            TextStyle(fontSize: 16,
                              color:
                              Colors.black54,
                            ),
                          ),
                          ),
                        ),
                      ],
                    ),

                  ),
                ),
                // Flexible(
                //   child: Container(
                //     decoration: BoxDecoration(
                //       borderRadius: BorderRadius.circular(20),
                //       color: Color(0xFFf5f1ff),
                //     ),
                //     margin: EdgeInsets.only(left: 10),
                //     height: 100,
                //     width: 200,
                //     child: Column(
                //       mainAxisAlignment: MainAxisAlignment.center,
                //       children: [
                //         CircleAvatar(
                //           backgroundImage: Image.network('https://i.pinimg.com/736x/27/1a/f2/271af23f2c93e1cc121925c0f2b9c9c8--vacuum-cleaners-vacuums.jpg',fit: BoxFit.cover,).image,
                //           radius: 25,
                //         ),
                //         SizedBox(height: 8),
                //         Padding(
                //           padding: EdgeInsets.all(0.5),
                //           child: Center(child:
                //           Text('Haircut',
                //             style:
                //             TextStyle(fontSize: 16,
                //               color:
                //               Color(0xFFc4c4e8),
                //             ),
                //           ),
                //           ),
                //         ),
                //       ],
                //     ),
                //   ),
                // ),
                Flexible(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Color(0xFFe9e4f4),
                    ),

                    margin: EdgeInsets.only(left: 10 , right: 10),
                    height: 100,
                    width: 200,

                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          child: Image.asset('assets/images/Repair.png', height: 50, width: 50),
                        ),
                        SizedBox(height: 8),
                        Padding(
                          padding: EdgeInsets.all(0.5),
                          child: Center(child:
                          Text('Repair',
                            style:
                            TextStyle(fontSize: 16,
                              color:
                              Colors.black54,
                            ),
                          ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          // SizedBox(
          //   height: 200,
          //   width: double.infinity,
          //   child: Carousel(
          //     dotColor: Colors.lightBlue,
          //     dotBgColor: Colors.transparent,
          //     dotSize: 9.0,
          //     dotSpacing: 20.0,
          //     dotPosition: DotPosition.bottomCenter,
          //     autoplay: true,
          //     animationCurve: Curves.fastOutSlowIn,
          //     animationDuration: Duration(milliseconds: 1000),
          //     images: images,
          //     indicatorBgPadding: 5.0,
          //     borderRadius: false,
          //   ),
          // ),
          // SizedBox(
          //   height: 10,
          // ),  // carsoul    // carsoual

          // carsoual bar here.
          // Row(
          //   children: [
          //     Expanded(
          //       child: Column(
          //         children: [
          //           Container(
          //             decoration: BoxDecoration(
          //               borderRadius: BorderRadius.circular(20),
          //               image: DecorationImage(
          //                 image: AssetImage('Assets/images/Plumber_service.png'),
          //                 fit: BoxFit.contain,
          //               ),
          //             ),
          //             width: 100,
          //             height: 100,
          //             // child: Image.asset('path_to_your_image'),
          //           ),
          //           //  SizedBox(height: 3),
          //           Text(
          //             'Ac Service',
          //             style: TextStyle(
          //               fontSize: 15,
          //               color: Colors.black,
          //               //   fontWeight: FontWeight.bold,
          //             ),
          //           ),
          //         ],
          //       ),
          //     ),
          //     Expanded(
          //       child: Column(
          //         children: [
          //           Container(
          //             decoration: BoxDecoration(
          //               borderRadius: BorderRadius.circular(20),
          //               image: DecorationImage(
          //                 image: NetworkImage('https://content.jdmagicbox.com/comp/def_content/ac_repair_and_services/default-ac-repair-services-16.jpg'),
          //                 fit: BoxFit.contain,
          //               ),
          //             ),
          //             width: 100,
          //             height: 100,
          //             // child: Image.asset('path_to_your_image'),
          //           ),
          //           //  SizedBox(height: 3),
          //           Text(
          //             'Ac Service',
          //             style: TextStyle(
          //               fontSize: 15,
          //               color: Colors.black,
          //               //   fontWeight: FontWeight.bold,
          //             ),
          //           ),
          //         ],
          //       ),
          //     ),
          //     Expanded(
          //       child: Column(
          //         children: [
          //           Container(
          //             decoration: BoxDecoration(
          //               borderRadius: BorderRadius.circular(20),
          //               image: DecorationImage(
          //                 image: NetworkImage('https://content.jdmagicbox.com/comp/def_content/ac_repair_and_services/default-ac-repair-services-16.jpg'),
          //                 fit: BoxFit.contain,
          //               ),
          //             ),
          //             width: 100,
          //             height: 100,
          //             // child: Image.asset('path_to_your_image'),
          //           ),
          //           //  SizedBox(height: 3),
          //           Text(
          //             'Ac Service',
          //             style: TextStyle(
          //               fontSize: 15,
          //               color: Colors.black,
          //               //   fontWeight: FontWeight.bold,
          //             ),
          //           ),
          //         ],
          //       ),
          //     ),
          //   ],
          // ),
          // Row(
          //   children: [
          //     Expanded(
          //       child: Column(
          //         children: [
          //           Container(
          //             decoration: BoxDecoration(
          //               borderRadius: BorderRadius.circular(20),
          //               image: DecorationImage(
          //                 image: NetworkImage('https://content.jdmagicbox.com/comp/def_content/ac_repair_and_services/default-ac-repair-services-16.jpg'),
          //                 fit: BoxFit.contain,
          //               ),
          //             ),
          //             width: 100,
          //             height: 100,
          //             // child: Image.asset('path_to_your_image'),
          //           ),
          //           //  SizedBox(height: 3),
          //           Text(
          //             'Ac Service',
          //             style: TextStyle(
          //               fontSize: 15,
          //               color: Colors.black,
          //               //   fontWeight: FontWeight.bold,
          //             ),
          //           ),
          //         ],
          //       ),
          //     ),
          //     Expanded(
          //       child: Column(
          //         children: [
          //           Container(
          //             decoration: BoxDecoration(
          //               borderRadius: BorderRadius.circular(20),
          //               image: DecorationImage(
          //                 image: NetworkImage('https://content.jdmagicbox.com/comp/def_content/ac_repair_and_services/default-ac-repair-services-16.jpg'),
          //                 fit: BoxFit.contain,
          //               ),
          //             ),
          //             width: 100,
          //             height: 100,
          //             // child: Image.asset('path_to_your_image'),
          //           ),
          //           //  SizedBox(height: 3),
          //           Text(
          //             'Ac Service',
          //             style: TextStyle(
          //               fontSize: 15,
          //               color: Colors.black,
          //               //   fontWeight: FontWeight.bold,
          //             ),
          //           ),
          //         ],
          //       ),
          //     ),
          //     Expanded(
          //       child: Column(
          //         children: [
          //           Container(
          //             decoration: BoxDecoration(
          //               borderRadius: BorderRadius.circular(20),
          //               image: DecorationImage(
          //                 image: NetworkImage('https://content.jdmagicbox.com/comp/def_content/ac_repair_and_services/default-ac-repair-services-16.jpg'),
          //                 fit: BoxFit.contain,
          //               ),
          //             ),
          //             width: 100,
          //             height: 100,
          //             // child: Image.asset('path_to_your_image'),
          //           ),
          //           //  SizedBox(height: 3),
          //           Text(
          //             'Ac Service',
          //             style: TextStyle(
          //               fontSize: 15,
          //               color: Colors.black,
          //               //   fontWeight: FontWeight.bold,
          //             ),
          //           ),
          //         ],
          //       ),
          //     ),
          //   ],
          // ),
          // Container(
          //   color: Colors.white,
          //   height: 50,
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //     children: [
          //       Padding(
          //         padding: const EdgeInsets.only(left: 20.0),
          //         child: Text(
          //           "Top Rated",
          //           style: TextStyle(
          //             fontWeight: FontWeight.bold,
          //             fontSize: 25,
          //           ),
          //         ),
          //       ),
          //       Padding(
          //         padding: const EdgeInsets.only(right: 20.0),
          //         child: Text(
          //           "View All",
          //           style: TextStyle(
          //             fontWeight: FontWeight.bold,
          //             fontSize: 18,
          //             color: Colors.purpleAccent,
          //           ),
          //         ),
          //       ),
          //     ],
          //   ),
          // ),
          SizedBox(
            height: 20,
          ),
          // Row(
          //   children: [
          //     Expanded(
          //       child: Container(
          //         width: 100,
          //         height: 150,
          //         decoration: BoxDecoration(
          //           borderRadius: BorderRadius.circular(8),
          //           color: Colors.grey[200],
          //         ),
          //         child: Image.asset('assets/image1.png'),
          //       ),
          //     ),
          //     SizedBox(width: 10),
          //     Expanded(
          //       child: Container(
          //         width: 100,
          //         height: 150,
          //         decoration: BoxDecoration(
          //           borderRadius: BorderRadius.circular(8),
          //           color: Colors.grey[200],
          //         ),
          //         child: Image.asset('assets/image2.png'),
          //       ),
          //     ),
          //   ],
          // ),
          // Row(
          //   children: [
          //     Expanded(
          //       child: Container(
          //         width: 100,
          //         height: 150,
          //         decoration: BoxDecoration(
          //           borderRadius: BorderRadius.circular(8),
          //           color: Colors.grey[200],
          //         ),
          //         child: Text('Rs.250'),
          //       ),
          //     ),
          //     SizedBox(width: 10),
          //     Expanded(
          //       child: Container(
          //         width: 100,
          //         height: 150,
          //         decoration: BoxDecoration(
          //           borderRadius: BorderRadius.circular(8),
          //           color: Colors.grey[200],
          //         ),
          //         child: Text('Rs.300'),
          //       ),
          //     ),
          //   ],
          // ),

          // Padding(
          //   padding: EdgeInsets.symmetric(vertical: 10 , horizontal: 10),
          //   child: SingleChildScrollView(
          //     scrollDirection: Axis.horizontal,
          //     child: Row(
          //       children: [
          //         Container(
          //           color: Colors.yellow,
          //           height: 150,
          //           width: 150,
          //           child: Column(
          //             children: [
          //               Image.asset(
          //                 'Assets/images/Plumber_service.png',
          //                 fit: BoxFit.cover,
          //               ),
          //               SizedBox(height: 10),
          //               Text(
          //                 'Text 1',
          //                 style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          //               ),
          //             ],
          //           ),
          //         ),
          //         SizedBox(width: 10),
          //         Container(
          //           color: Colors.yellow,
          //           height: 150,
          //           width: 150,
          //           child: Column(
          //             children: [
          //               Image.asset(
          //                 'Assets/images/Plumber_service.png',
          //                 fit: BoxFit.cover,
          //               ),
          //               SizedBox(height: 10),
          //               Text(
          //                 'Text 1',
          //                 style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          //               ),
          //             ],
          //           ),
          //         ),
          //         SizedBox(width: 10),
          //         Container(
          //           decoration: BoxDecoration(
          //             borderRadius: BorderRadius.circular(10),
          //             color: Colors.red,
          //           ),
          //           height: 150,
          //           width: 150,
          //           child: Column(
          //             children: [
          //               Image.network(
          //                 'https://content.jdmagicbox.com/comp/def_content/ac_repair_and_services/default-ac-repair-services-16.jpg',
          //                 fit: BoxFit.contain,
          //               ),
          //               SizedBox(height: 10),
          //               Text(
          //                 'Deep Ac Repair And Cleaning',
          //                 textAlign: TextAlign.start,
          //                 style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          //               ),
          //             ],
          //           ),
          //         ),
          //         Container(
          //           color: Colors.yellow,
          //           height: 150,
          //           width: 150,
          //           child: Column(
          //             children: [
          //               Image.asset(
          //                 'Assets/images/Plumber_service.png',
          //                 fit: BoxFit.cover,
          //               ),
          //               SizedBox(height: 10),
          //               Text(
          //                 'Text 1',
          //                 style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          //               ),
          //             ],
          //           ),
          //         ),
          //         SizedBox(width: 10),
          //         Container(
          //           decoration: BoxDecoration(
          //             borderRadius: BorderRadius.circular(10),
          //             color: Colors.red,
          //           ),
          //           height: 150,
          //           width: 150,
          //           child: Column(
          //             children: [
          //               Image.network(
          //                 'https://content.jdmagicbox.com/comp/def_content/ac_repair_and_services/default-ac-repair-services-16.jpg',
          //                 fit: BoxFit.contain,
          //               ),
          //               SizedBox(height: 10),
          //               Text(
          //                 'Deep Ac Repair And Cleaning',
          //                 textAlign: TextAlign.start,
          //                 style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          //               ),
          //             ],
          //           ),
          //         ),
          //       ],
          //     ),
          //   ),
          // ),

          // Padding(
          //   padding: EdgeInsets.symmetric(vertical: 10 , horizontal: 10),
          //   child: SingleChildScrollView(
          //     scrollDirection: Axis.horizontal,
          //     child: Row(
          //       children: [
          //         Container(
          //           color: Colors.yellow,
          //           height: 150,
          //           width: 150,
          //           child: Column(
          //             children: [
          //               Image.asset(
          //                 'Assets/images/Plumber_service.png',
          //                 fit: BoxFit.cover,
          //               ),
          //               SizedBox(height: 10),
          //               Text(
          //                 'Text 1',
          //                 style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          //               ),
          //             ],
          //           ),
          //         ),
          //         SizedBox(width: 10),
          //         Container(
          //           color: Colors.yellow,
          //           height: 150,
          //           width: 150,
          //           child: Column(
          //             children: [
          //               Image.asset(
          //                 'Assets/images/Plumber_service.png',
          //                 fit: BoxFit.cover,
          //               ),
          //               SizedBox(height: 10),
          //               Text(
          //                 'Text 1',
          //                 style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          //               ),
          //             ],
          //           ),
          //         ),
          //         SizedBox(width: 10),
          //         Container(
          //           decoration: BoxDecoration(
          //             borderRadius: BorderRadius.circular(10),
          //             color: Colors.red,
          //           ),
          //           height: 150,
          //           width: 150,
          //           child: Column(
          //             children: [
          //               Image.network(
          //                 'https://content.jdmagicbox.com/comp/def_content/ac_repair_and_services/default-ac-repair-services-16.jpg',
          //                 fit: BoxFit.contain,
          //               ),
          //               SizedBox(height: 10),
          //               Text(
          //                 'Deep Ac Repair And Cleaning',
          //                 textAlign: TextAlign.start,
          //                 style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          //               ),
          //             ],
          //           ),
          //         ),
          //         Container(
          //           color: Colors.yellow,
          //           height: 150,
          //           width: 150,
          //           child: Column(
          //             children: [
          //               Image.asset(
          //                 'Assets/images/Plumber_service.png',
          //                 fit: BoxFit.cover,
          //               ),
          //               SizedBox(height: 10),
          //               Text(
          //                 'Text 1',
          //                 style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          //               ),
          //             ],
          //           ),
          //         ),
          //         SizedBox(width: 10),
          //         Container(
          //           decoration: BoxDecoration(
          //             borderRadius: BorderRadius.circular(10),
          //             color: Colors.red,
          //           ),
          //           height: 150,
          //           width: 150,
          //           child: Column(
          //             children: [
          //               Image.network(
          //                 'httd_services/de6.jpg',
          //                 fit: BoxFit.contain,
          //               ),
          //               SizedBox(height: 10),
          //               Text(
          //                 'Deep Ac Repair And Cleaning',
          //                 textAlign: TextAlign.start,
          //                 style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          //               ),
          //             ],
          //           ),
          //         ),
          //       ],
          //     ),
          //   ),
          // ),


          Container(
            height: 50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Text(
                    "Salon Service",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                    ),
                  ),
                ),
                // Padding(
                //   padding: const EdgeInsets.only(right: 20.0),
                //   child: Text(
                //     "View All",
                //     style: TextStyle(
                //       fontWeight: FontWeight.bold,
                //       fontSize: 18,
                //       color: Colors.purpleAccent,
                //     ),
                //   ),
                // ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),

          Padding(
            padding: EdgeInsets.symmetric( horizontal: 10),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Column(
                    children: [
                      Container(
                        height : 150,
                        margin: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Stack(
                              children: [
                                InkWell(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => ServiceInfo()),
                                    );
                                  },
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(5),
                                      topRight: Radius.circular(5),
                                    ),
                                    child: Image.asset('assets/salon_men/salon_service_men.jpeg', height: 100, width: 100, fit: BoxFit.cover,),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 8,),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 5),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Haircut &',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                    ),
                                  ),
                                  Text('styling',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                    ),),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        height : 150,
                        margin: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Stack(
                              children: [
                                InkWell(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => ServiceInfo()),
                                    );
                                  },
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(5),
                                      topRight: Radius.circular(5),
                                    ),
                                    child: Image.asset('assets/salon_men/men_shaving.jpeg', height: 100, width: 100, fit: BoxFit.cover,),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 8,),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 5),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Shaving',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                    ),
                                  ),
                                  Text('',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                    ),),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        height : 150,
                        margin: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Stack(
                              children: [
                                InkWell(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => ServiceInfo()),
                                    );
                                  },
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(5),
                                      topRight: Radius.circular(5),
                                    ),
                                    child: Image.asset('assets/salon_men/men_hair_color.jpeg', height: 100, width: 100, fit: BoxFit.cover,),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 8,),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 5),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Hair',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                    ),
                                  ),
                                  Text('coloring',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                    ),),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        height : 150,
                        margin: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Stack(
                              children: [
                                InkWell(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => ServiceInfo()),
                                    );
                                  },
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(15),
                                      topRight: Radius.circular(15),
                                    ),
                                    child: Image.asset('assets/salon_men/facila_treatment.jpeg', height: 100, width: 100, fit: BoxFit.cover,),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 8,),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 5),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Facial ',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                    ),
                                  ),
                                  Text('treatments',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                    ),),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  // Container(
                  //   color: Colors.yellow,
                  //   height: 150,
                  //   width: 150,
                  //   child: Column(
                  //     children: [
                  //       Image.asset(
                  //         'Assets/images/Plumber_service.png',
                  //         fit: BoxFit.cover,
                  //       ),
                  //       SizedBox(height: 10),
                  //       Text(
                  //         'Text 1',
                  //         style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  //       ),
                  //     ],
                  //   ),
                  // ),
                  // SizedBox(width: 10),
                  // Container(
                  //   decoration: BoxDecoration(
                  //     borderRadius: BorderRadius.circular(10),
                  //     color: Colors.red,
                  //   ),
                  //   height: 150,
                  //   width: 150,
                  //   child: Column(
                  //     children: [
                  //       Image.network(
                  //         'https://content.jdmagicbox.com/comp/def_content/ac_repair_and_services/default-ac-repair-services-16.jpg',
                  //         fit: BoxFit.contain,
                  //       ),
                  //       SizedBox(height: 10),
                  //       Text(
                  //         'Deep Ac Repair And Cleaning',
                  //         textAlign: TextAlign.start,
                  //         style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  //       ),
                  //     ],
                  //   ),
                  // ),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric( horizontal: 10),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Column(
                    children: [
                      Container(
                        height : 150,
                        margin: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Stack(
                              children: [
                                InkWell(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => ServiceInfo()),
                                    );
                                  },
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(5),
                                      topRight: Radius.circular(5),
                                    ),
                                    child: Image.asset('assets/salon_women/haircut.jpeg', height: 100, width: 100, fit: BoxFit.cover,),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 8,),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 5),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Haircut &',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                    ),
                                  ),
                                  Text('styling',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                    ),),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        height : 150,
                        margin: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Stack(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => ServiceInfo()),
                                    );
                                  },
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(5),
                                      topRight: Radius.circular(5),
                                    ),
                                    child: Image.asset('assets/salon_women/hair_color.jpeg', height: 100, width: 100, fit: BoxFit.cover,),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 8,),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 5),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Hair',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                    ),
                                  ),
                                  Text('coloring',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                    ),),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        height : 150,
                        margin: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Stack(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => ServiceInfo()),
                                    );
                                  },
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(5),
                                      topRight: Radius.circular(5),
                                    ),
                                    child: Image.asset('assets/salon_women/manicure.webp', height: 100, width: 100, fit: BoxFit.cover,),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 8,),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 5),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Manicure &',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                    ),
                                  ),
                                  Text('pedicure',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                    ),),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        height : 150,
                        margin: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Stack(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => ServiceInfo()),
                                    );
                                  },
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(5),
                                      topRight: Radius.circular(5),
                                    ),
                                    child: Image.asset('assets/salon_women/glow.jpeg', height: 100, width: 100, fit: BoxFit.cover,),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 8,),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 5),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Makeup',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                    ),
                                  ),
                                  Text('application',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                    ),),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  // Container(
                  //   color: Colors.yellow,
                  //   height: 150,
                  //   width: 150,
                  //   child: Column(
                  //     children: [
                  //       Image.asset(
                  //         'Assets/images/Plumber_service.png',
                  //         fit: BoxFit.cover,
                  //       ),
                  //       SizedBox(height: 10),
                  //       Text(
                  //         'Text 1',
                  //         style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  //       ),
                  //     ],
                  //   ),
                  // ),
                  // SizedBox(width: 10),
                  // Container(
                  //   decoration: BoxDecoration(
                  //     borderRadius: BorderRadius.circular(10),
                  //     color: Colors.red,
                  //   ),
                  //   height: 150,
                  //   width: 150,
                  //   child: Column(
                  //     children: [
                  //       Image.network(
                  //         'https://content.jdmagicbox.com/comp/def_content/ac_repair_and_services/default-ac-repair-services-16.jpg',
                  //         fit: BoxFit.contain,
                  //       ),
                  //       SizedBox(height: 10),
                  //       Text(
                  //         'Deep Ac Repair And Cleaning',
                  //         textAlign: TextAlign.start,
                  //         style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  //       ),
                  //     ],
                  //   ),
                  // ),
                ],
              ),
            ),
          ),
          Container(
            // color: Colors.white,
            height: 50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Text(
                    "Plumber Service",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                    ),
                  ),
                ),
                // Padding(
                //   padding: const EdgeInsets.only(right: 20.0),
                //   child: Text(
                //     "View All",
                //     style: TextStyle(
                //       fontWeight: FontWeight.bold,
                //       fontSize: 18,
                //       color: Colors.purpleAccent,
                //     ),
                //   ),
                // ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric( horizontal: 10),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  // Container(
                  //   color: Colors.yellow,
                  //   height: 150,
                  //   width: 150,
                  //   child: Column(
                  //     children: [
                  //       Image.asset(
                  //         'Assets/images/Plumber_service.png',
                  //         fit: BoxFit.cover,
                  //       ),
                  //       SizedBox(height: 10),
                  //       Text(
                  //         'Text 1',
                  //         style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  //       ),
                  //     ],
                  //   ),
                  // ),
                  // SizedBox(width: 10),
                  // Container(
                  //   color: Colors.yellow,
                  //   height: 150,
                  //   width: 150,
                  //   child: Column(
                  //     children: [
                  //       Image.asset(
                  //         'Assets/images/Plumber_service.png',
                  //         fit: BoxFit.cover,
                  //       ),
                  //       SizedBox(height: 10),
                  //       Text(
                  //         'Text 1',
                  //         style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  //       ),
                  //     ],
                  //   ),
                  // ),
                  // SizedBox(width: 10),
                  Column(
                    children: [
                      Container(
                        height : 200,
                        margin: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Stack(
                              children: [
                                InkWell(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => ServiceInfo()),
                                    );
                                  },
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(15),
                                      topRight: Radius.circular(15),
                                    ),
                                    child: Image.asset('assets/sub_service/plumber_image/Faucet.jpeg', height: 150, width: 150, fit: BoxFit.cover,),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 8,),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 5),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Faucet repair &',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                    ),
                                  ),
                                  Text('installation',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                    ),),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        height : 200,
                        margin: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Stack(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => ServiceInfo()),
                                    );
                                  },
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(15),
                                      topRight: Radius.circular(15),
                                    ),
                                    child: Image.asset('assets/sub_service/plumber_image/piper_repair_2.0.jpeg', height: 150, width: 150, fit: BoxFit.cover,),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 8,),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 5),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Pipe repair &',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                    ),
                                  ),
                                  Text('replacement',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                    ),),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        height : 200,
                        margin: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Stack(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => ServiceInfo()),
                                    );
                                  },
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(15),
                                      topRight: Radius.circular(15),
                                    ),
                                    child: Image.asset('assets/sub_service/plumber_image/water_heater.png', height: 150, width: 150, fit: BoxFit.cover,),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 8,),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 5),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Water heater & ',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                    ),
                                  ),
                                  Text('repair installation',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                    ),),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        height : 200,
                        margin: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Stack(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => ServiceInfo()),
                                    );
                                  },
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(15),
                                      topRight: Radius.circular(15),
                                    ),
                                    child: Image.asset('assets/sub_service/plumber_image/water_purifier.webp', height: 150, width: 150, fit: BoxFit.cover,),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 8,),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 5),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Water system ',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                    ),
                                  ),
                                  Text('installation',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                    ),),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  // Container(
                  //   color: Colors.yellow,
                  //   height: 150,
                  //   width: 150,
                  //   child: Column(
                  //     children: [
                  //       Image.asset(
                  //         'Assets/images/Plumber_service.png',
                  //         fit: BoxFit.cover,
                  //       ),
                  //       SizedBox(height: 10),
                  //       Text(
                  //         'Text 1',
                  //         style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  //       ),
                  //     ],
                  //   ),
                  // ),
                  // SizedBox(width: 10),
                  // Container(
                  //   decoration: BoxDecoration(
                  //     borderRadius: BorderRadius.circular(10),
                  //     color: Colors.red,
                  //   ),
                  //   height: 150,
                  //   width: 150,
                  //   child: Column(
                  //     children: [
                  //       Image.network(
                  //         'https://content.jdmagicbox.com/comp/def_content/ac_repair_and_services/default-ac-repair-services-16.jpg',
                  //         fit: BoxFit.contain,
                  //       ),
                  //       SizedBox(height: 10),
                  //       Text(
                  //         'Deep Ac Repair And Cleaning',
                  //         textAlign: TextAlign.start,
                  //         style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  //       ),
                  //     ],
                  //   ),
                  // ),
                ],
              ),
            ),
          ),

          Container(
            height: 50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Text(
                    "Electrican Service",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                    ),
                  ),
                ),
                // Padding(
                //   padding: const EdgeInsets.only(right: 20.0),
                //   child: Text(
                //     "View All",
                //     style: TextStyle(
                //       fontWeight: FontWeight.bold,
                //       fontSize: 18,
                //       color: Colors.purpleAccent,
                //     ),
                //   ),
                // ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric( horizontal: 10),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  // Container(
                  //   color: Colors.yellow,
                  //   height: 150,
                  //   width: 150,
                  //   child: Column(
                  //     children: [
                  //       Image.asset(
                  //         'Assets/images/Plumber_service.png',
                  //         fit: BoxFit.cover,
                  //       ),
                  //       SizedBox(height: 10),
                  //       Text(
                  //         'Text 1',
                  //         style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  //       ),
                  //     ],
                  //   ),
                  // ),
                  // SizedBox(width: 10),
                  // Container(
                  //   color: Colors.yellow,
                  //   height: 150,
                  //   width: 150,
                  //   child: Column(
                  //     children: [
                  //       Image.asset(
                  //         'Assets/images/Plumber_service.png',
                  //         fit: BoxFit.cover,
                  //       ),
                  //       SizedBox(height: 10),
                  //       Text(
                  //         'Text 1',
                  //         style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  //       ),
                  //     ],
                  //   ),
                  // ),
                  // SizedBox(width: 10),
                  Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) =>  ServiceInfo()),
                          );
                        },
                        child: Container(
                          height : 200,
                          margin: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Stack(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) => ServiceInfo()),
                                      );
                                    },
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(15),
                                        topRight: Radius.circular(15),
                                      ),
                                      child: Image.asset('assets/sub_service/Electric_image/ac_repair.jpeg', height: 150, width: 150, fit: BoxFit.cover,),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 8,),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 5),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('AC repair &',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15,
                                      ),
                                    ),
                                    Text('installation',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15,
                                      ),),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        height : 200,
                        margin: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Stack(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => ServiceInfo()),
                                    );
                                  },
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(5),
                                      topRight: Radius.circular(5),
                                    ),
                                    child: Image.asset('assets/sub_service/Electric_image/Lighting.jpeg', height: 150, width: 150, fit: BoxFit.cover,),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 8,),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 5),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Lighting',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                    ),
                                  ),
                                  Text('',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                    ),),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        height : 200,
                        margin: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Stack(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => ServiceInfo()),
                                    );
                                  },
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(15),
                                      topRight: Radius.circular(15),
                                    ),
                                    child: Image.asset('assets/sub_service/Electric_image/referegator-repairing-large.jpg', height: 150, width: 150, fit: BoxFit.cover,),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 8,),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 5),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Refrigerator',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                    ),
                                  ),
                                  Text('Repair',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                    ),),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        height : 200,
                        margin: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Stack(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => ServiceInfo()),
                                    );
                                  },
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(15),
                                      topRight: Radius.circular(15),
                                    ),
                                    child: Image.asset(
                                      'assets/sub_service/Electric_image/washing_image.jpeg',
                                      height: 150,
                                      width: 150,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 8,),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 5),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Washing Machine',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                    ),
                                  ),
                                  Text(
                                    'repair',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),

                      ),
                    ],
                  ),
                  // Container(
                  //   color: Colors.yellow,
                  //   height: 150,
                  //   width: 150,
                  //   child: Column(
                  //     children: [
                  //       Image.asset(
                  //         'Assets/images/Plumber_service.png',
                  //         fit: BoxFit.cover,
                  //       ),
                  //       SizedBox(height: 10),
                  //       Text(
                  //         'Text 1',
                  //         style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  //       ),
                  //     ],
                  //   ),
                  // ),
                  // SizedBox(width: 10),
                  // Container(
                  //   decoration: BoxDecoration(
                  //     borderRadius: BorderRadius.circular(10),
                  //     color: Colors.red,
                  //   ),
                  //   height: 150,
                  //   width: 150,
                  //   child: Column(
                  //     children: [
                  //       Image.network(
                  //         'https://content.jdmagicbox.com/comp/def_content/ac_repair_and_services/default-ac-repair-services-16.jpg',
                  //         fit: BoxFit.contain,
                  //       ),
                  //       SizedBox(height: 10),
                  //       Text(
                  //         'Deep Ac Repair And Cleaning',
                  //         textAlign: TextAlign.start,
                  //         style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  //       ),
                  //     ],
                  //   ),
                  // ),
                ],
              ),
            ),
          ),
          //In the above need of some modification

          // Container(
          //   color: Colors.red,
          //   height: 100,
          //   child: Center(
          //     child: Text(
          //       'Container 1',
          //       style: TextStyle(color: Colors.white),
          //     ),
          //   ),
          // ),
          // Container(
          //   color: Colors.red,
          //   height: 100,
          //   child: Center(
          //     child: Text(
          //       'Container 1',
          //       style: TextStyle(color: Colors.white),
          //     ),
          //   ),
          // ),
        ],
      ),
    ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            label: 'Bookings',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle_sharp),
            label: 'Account',
          ),
        ],
        onTap: (int index) {
          switch (index) {
            case 0:
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(builder: (context) => HomeScreen()),
            // );
              break;
            case 1:
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) =>bookedService()),
              );
              break;
            case 2:
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SubSetting()),
              );
              break;
          }
        },
      ),
    );
  }
}
