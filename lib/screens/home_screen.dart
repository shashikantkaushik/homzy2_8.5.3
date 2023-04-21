import 'package:flutter/material.dart';
import 'package:homzy1/auth.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:homzy1/screens/profile_screen.dart';
import 'package:provider/provider.dart';
import 'package:homzy1/screens/small_service_page.dart';
import 'package:homzy1/screens/account_page.dart';

import 'package:homzy1/screens/booked_service.dart';
import 'package:homzy1/screens/booked_service.dart';
import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:homzy1/screens/account_page.dart';
import 'package:homzy1/screens/takedata_page.dart';
import 'package:homzy1/screens/booked_service.dart';
import 'package:homzy1/screens/small_services_small_contianer .dart';
import 'package:homzy1/screens/small_service_page.dart';
import 'package:homzy1/screens/small_services_small_contianer .dart';
import 'package:homzy1/screens/small_service_small_repair.dart';
import 'package:homzy1/screens/small_service_carpenter.dart';
import 'package:homzy1/screens/face_care.dart';
import 'package:homzy1/screens/face_care_men.dart';


import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:homzy1/screens/account_page.dart';
import 'package:homzy1/screens/takedata_page.dart';
import 'package:homzy1/screens/booked_service.dart';
import 'package:homzy1/screens/small_services_small_contianer .dart';
import 'package:homzy1/screens/small_service_page.dart';
import 'package:homzy1/screens/small_services_small_contianer .dart';
import 'package:homzy1/screens/small_service_small_repair.dart';




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

  // Widget categoriesConatiner({required String image , required String name}){
  //   return  Container(
  //     child: Expanded(
  //       child: Column(
  //         mainAxisAlignment: MainAxisAlignment.center,
  //         children: [
  //           CircleAvatar(
  //             child: Image.asset('assets/image1.png', height: 50, width: 50),
  //           ),
  //           SizedBox(height: 8),
  //           Padding(
  //             padding: EdgeInsets.all(0.5),
  //             child: Center(child:
  //             Text('Events',
  //               style:
  //               TextStyle(fontSize: 16,
  //                 color:
  //                 Color(0xFFc4c4e8),
  //               ),
  //             ),
  //             ),
  //           ),
  //         ],
  //       ),
  //
  //     ),
  //   );
  // }
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
  Widget SalonServiceConatiner(BuildContext context, String img, String name1, String name2, int price, String desc, String image){
    return  Container(
      //   width: 200,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height : 150,
            margin: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
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
                          MaterialPageRoute(builder: (context) => ServiceInfo (name: name1 + name2, img: Image.asset(image), price: price, desc: desc,)),
                        );
                      },
                      child: ClipRRect(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(3),
                          topRight: Radius.circular(3),
                          bottomLeft: Radius.circular(3),
                          bottomRight: Radius.circular(3),
                        ),
                        child: Image.asset(img, height: 100, width: 100, fit: BoxFit.cover,),
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
                      Text(name1,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                      Text(name2,
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
    );
  }
  Widget ServiceCategories(BuildContext context, String img , String name1, String name2, int price, String desc, String image){
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          height : 200,
          margin: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
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
                        MaterialPageRoute(builder: (context) => ServiceInfo(name: name1 + name2, img: Image.asset(image), price: price, desc: desc,)),
                      );
                    },
                    child: ClipRRect(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(5),
                        topRight: Radius.circular(5),
                        bottomLeft: Radius.circular(5),
                        bottomRight: Radius.circular(5),
                      ),
                      child: Image.asset(img, height: 150, width: 150, fit: BoxFit.cover,),
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
                    Text(name1,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                    Text(name2,
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
    );
  }
  @override

  Widget build(BuildContext context) {
    final ap = Provider.of<AuthProvider>(context, listen: false); 
    final name=(ap.userModel.name);
    final email=(ap.userModel.email);

    final phone=(ap.userModel.phoneNumber);
    final pic=(ap.userModel.profilePic);
    final uid=(ap.userModel.uid);
    final date=(ap.userModel.createdAt);
    // final DatabaseReference databaseReference = FirebaseDatabase.instance.reference().child('messages');
    final t = (ap.userModel.name);
    return Scaffold(
      appBar: AppBar(
        backgroundColor:  Colors.grey,
         elevation: 0.5,
        centerTitle: false,

        title: Text("Hello, $t",
        style:TextStyle(
          color: Colors.black
        )),
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
      ),
      body: SingleChildScrollView(
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
                Expanded(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => FaceWomenServiceScreen()),
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Color(0xFFe9e4f4),
                        ),
                        margin: EdgeInsets.only(left: 10, right: 10),
                        height: 100,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CircleAvatar(
                              child: Image.asset("assets/images/spa.png", height: 50, width: 50),
                            ),
                            SizedBox(height: 8),
                            Padding(
                              padding: EdgeInsets.all(0.5),
                              child: Center(child:
                              Text("Face Care",
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
                    )
                ),
                Expanded(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => FaceMenServiceScreen()),
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Color(0xFFe9e4f4),
                        ),
                        margin: EdgeInsets.only(left: 10, right: 10),
                        height: 100,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CircleAvatar(
                              child: Image.asset("assets/images/massage.png", height: 50, width: 50),
                            ),
                            SizedBox(height: 8),
                            Padding(
                              padding: EdgeInsets.all(0.5),
                              child: Center(child:
                              Text("Face Care",
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
                    )
                ),
              ],
            ),
            Container(
              height: 150,
              child: Row(
                //    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => CleaningServiceScreen()),
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Color(0xFFe9e4f4),
                        ),
                        margin: EdgeInsets.only(left: 10, right: 10),
                        height: 100,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CircleAvatar(
                              child: Image.asset("assets/images/cleaning.png", height: 50, width: 50),
                            ),

                            SizedBox(height: 8),
                            Padding(
                              padding: EdgeInsets.all(0.5),
                              child: Center(
                                child: Text(
                                  "Cleaning",
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.black54,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => CarpenterServiceScreen()),
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Color(0xFFe9e4f4),
                        ),
                        margin: EdgeInsets.only(left: 10, right: 10),
                        height: 100,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CircleAvatar(
                              child: Image.asset("assets/images/painting.png", height: 50, width: 50),
                            ),

                            SizedBox(height: 8),
                            Padding(
                              padding: EdgeInsets.all(0.5),
                              child: Center(
                                child: Text(
                                  "Carpenter",
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.black54,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => RepairServiceScreen ()),
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Color(0xFFe9e4f4),
                        ),
                        margin: EdgeInsets.only(left: 10, right: 10),
                        height: 100,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CircleAvatar(
                              child: Image.asset("assets/images/Repair.png", height: 50, width: 50),
                            ),

                            SizedBox(height: 8),
                            Padding(
                              padding: EdgeInsets.all(0.5),
                              child: Center(
                                child: Text(
                                  "Repair",
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.black54,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
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
                    SalonServiceConatiner(
                      context,
                      "assets/salon_men/salon_service_men.jpeg",
                      "Haircut ",
                      "styling",
                      int.parse("499"),
                      "A men's haircut typically involves using scissors or clippers to cut the hair to a desired length or style.",
                      "assets/salon_men/child_hari_cut.jpeg",
                    ),
                    SalonServiceConatiner(context,
                      "assets/salon_men/men_shaving.jpeg",
                      "Shaving ",
                      "",
                      int.parse("299"),
                      " This can involve using shaving cream or gel to lubricate the skin and help the razor glide smoothly over the face.",
                      "assets/salon_men/men_shaving_4.1.jpeg",
                    ),
                    SalonServiceConatiner(context,
                      "assets/salon_men/men_hair_color.jpeg",
                      "Hair ",
                      "coloring",
                      int.parse("999"),
                      "This can involve using a hair dye or other coloring product to add color to the hair, or to cover up gray hairs.",
                      "assets/salon_men/men_color_3.3.png",
                    ),
                    SalonServiceConatiner(context,
                      "assets/salon_men/facila_treatment.jpeg",
                      "Facial ",
                      "treatments",
                      int.parse("1249"),
                      "A facial treatment is a skincare procedure designed to improve the appearance and health of a man's facial skin.",
                      "assets/salon_men/facial_trement_2.0.webp",
                    ),
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
                    SalonServiceConatiner(context,
                      "assets/salon_women/haircut.jpeg",
                      "Haircut ",
                      "styling",
                      int.parse("699"),
                      "This can include cutting the hair to a certain length or style, as well as shaping the hair around the face, sides, and back of the head.",
                      "assets/salon_women/hair_cutt_women_5.2.jpeg",
                    ),
                    SalonServiceConatiner(context,
                      "assets/salon_women/hair_color.jpeg",
                      "Hair ",
                      "coloring",
                      int.parse("1549"),
                      "This can involve using a hair dye or other coloring product to add color to the hair, or to cover up gray hairs.",
                      "assets/salon_women/coloring hair_women_sec.jpeg",
                    ),

                    SalonServiceConatiner(context,
                      "assets/salon_women/manicure.webp",
                      "Manicure ",
                      "pedicure",
                      int.parse("599"),
                      "Manicure and pedicure treatments are procedures designed to improve the appearance and health of a woman's hands, feet, and nails.",
                      "assets/salon_women/manicure_3.1.jpeg",
                    ),
                    SalonServiceConatiner(context,
                      "assets/salon_women/glow.jpeg",
                      "Makeup ",
                      "",
                      int.parse("5999"),
                      "This can include makeup for special events or occasions, such as photo shoots, or everyday makeup for work or social situations.",
                      "assets/salon_women/makup_women_3.1.webp",
                    ),
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
                    ServiceCategories(context,
                      "assets/sub_service/plumber_image/Faucet.jpeg",
                      "Faucet repair ",
                      "installation",
                      int.parse("599"),
                      "Faucet repair and installation involve fixing or installing the plumbing fixture that controls the flow of water in a sink, bathtub, or shower.",
                      "assets/sub_service/plumber_image/faucet_4.1.webp",
                    ),

                    ServiceCategories(context,
                      "assets/sub_service/plumber_image/piper_repair_2.0.jpeg",
                      "Pipe repair ",
                      "replacement",
                      int.parse("899"),
                      "Pipe repair involves fixing or replacing damaged pipes that carry water, gas, or other fluids throughout a building.",
                      "assets/sub_service/plumber_image/pipe_4.1.webp",
                    ),
                    ServiceCategories(context,
                      "assets/sub_service/plumber_image/water_heater.png",
                      "Water heater ",
                      "repair installation",
                      int.parse("799"),
                      "Water heater repair and installation involve fixing or installing the system that provides hot water to a building.",
                      "assets/sub_service/plumber_image/water_heater_3.3.jpeg",
                    ),
                    ServiceCategories(context,
                      "assets/sub_service/plumber_image/water_system_3.2.jpeg",
                      "Water system ",
                      "installation",
                      int.parse("999"),
                      "Water system repair and installation involve fixing or installing the plumbing system that provides potable water to a building.",
                      "assets/sub_service/plumber_image/water_system_3.2.jpeg",
                    ),
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
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric( horizontal: 10),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    ServiceCategories(context,
                      "assets/sub_service/Electric_image/ac_repair.jpeg",
                      "Ac repair ",
                      "installation",
                      int.parse("899"),
                      "This can include repairing or replacing damaged components such as the compressor, condenser, or refrigerant lines, or cleaning and tuning up the system to improve its efficiency and performance.",
                      "assets/sub_service/Electric_image/ac_repair_3.3.jpeg",
                    ),
                    ServiceCategories(context,
                      "assets/sub_service/Electric_image/Lighting.jpeg",
                      "Lighting",
                      "",
                      int.parse("699"),
                      "This can include repairing or replacing damaged components such as light fixtures, switches, or wiring, or installing new lighting altogether.",
                      "assets/sub_service/Electric_image/lighting_3.3.webp",
                    ),
                    ServiceCategories(context,
                      "assets/sub_service/Electric_image/referegator-repairing-large.jpg",
                      "Refrigerator ",
                      "Repair",
                      int.parse("1299"),
                      "This can include repairing or replacing damaged components such as the compressor, condenser, or evaporator fan, or cleaning and tuning up the system to improve its efficiency and performance.",
                      "assets/sub_service/Electric_image/referegator-repairing-large.jpg",
                    ),
                    ServiceCategories(context,
                      "assets/sub_service/Electric_image/washing_image.jpg",
                      "Washing Machine ",
                      "repair",
                      int.parse("5999"),
                      "This can include repairing or replacing damaged components such as the motor, belts, or agitator, or cleaning and tuning up the machine to improve its efficiency and performance.",
                      "assets/sub_service/Electric_image/washing_machine_3.2.jpeg",
                    ),
                  ],
                ),
              ),
            ),
            //In the above need of some modification


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
                MaterialPageRoute(builder: (context) => bookedService()),
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