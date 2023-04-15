import 'package:flutter/material.dart';

import 'package:homzy1/screens/takedata_page.dart';
class ServiceInfo extends StatefulWidget {
//  const ServiceInfo({super.key, required this.title});


  // final String title;

  @override
  State<ServiceInfo> createState() => _ServiceInfoState();
}

class _ServiceInfoState extends State<ServiceInfo> {
  Widget categoriesConatiner({required String image , required String name}){
    return  Column(
      children: [
        Container(
          margin: EdgeInsets.only(left: 20),
          height: 80,
          width: 80,
          decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage(''),),
            color: Colors.white70,
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Text(name,
          style: TextStyle(
            fontSize: 20,
            color: Colors.black,
          ),),
      ],
    );
  }

  Widget LargeConatiner({required String image, required String name , required int price}){
    return  Container(
      height: 270,
      width: 220,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 60,
            backgroundImage: NetworkImage(image),
          ),
          ListTile(
            leading: Text(name,
              style: TextStyle(
                fontSize:  20,
                color: Colors.white,
              ),
            ),
            trailing: Text("Rs.$price",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 12),
            child: Row(
              children: [
                Icon(
                  Icons.star,size: 20,
                  color: Colors.white,
                ),
                Icon(
                  Icons.star,size: 20,
                  color: Colors.white,
                ),
                Icon(
                  Icons.star,size: 20,
                  color: Colors.white,
                ),
                Icon(
                  Icons.star,size: 20,
                  color: Colors.white,
                ),
                Icon(
                  Icons.star,size: 20,
                  color: Colors.white,
                ),

              ],
            ),
          ),
        ],
      ),
    );
  }
  Widget draweritem({required String name, required IconData icon}){
    return   ListTile(
      leading: Icon(
        icon,
        color: Colors.white,
      ),
      title: Text(
        name ,
        style: TextStyle(
            color: Colors.white,
            fontSize: 20),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      // appBar: AppBar(
      //   elevation: 0.0,
      //   title: Text(""),
      //   backgroundColor: Colors.blue,
      //   // leading: IconButton(
      //   //   icon: Icon(Icons.arrow_back, color: Colors.black,),
      //   //   onPressed: (){
      //   //
      //   //   },
      //   // ),
      // ),
      body: Column(
        children: [
          Expanded(// As u wise use or not  by default flex is always 1
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/sub_service/plum.jpg'),
                ),
              ),
            ),
          ),
          // Divider(
          //   color: Colors.grey,
          //   thickness: 1,
          // ),
          Expanded(
            flex: 2,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white60,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Plumber", style: TextStyle(fontSize: 40, color: Colors.black54,fontWeight: FontWeight.bold),),
                  Text("Here we provide best service", style: TextStyle(color: Colors.black54, fontSize: 20),),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                            height: 40,
                            width: 80,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ],
                      ),
                      Text('Rs.150', style: TextStyle(color: Colors.black54,fontSize: 30, fontWeight: FontWeight.bold),),
                    ],
                  ),
                  Text('Descipation', style: TextStyle(fontSize: 25, color: Colors.black54,fontWeight: FontWeight.bold),),

                  Text('Plumbers install and repair pipes and fixtures that carry water, gas, or other fluids in homes and businesses.',
                    style: TextStyle(color: Colors.black54, fontSize: 20),
                  ),

                  Container(
                    height: 55,
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        backgroundColor: Colors.white70,
                        textStyle: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      child:  Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.shopping_cart, color: Colors.black,),
                          SizedBox(
                            width: 10,
                          ),
                          TextButton(
                            onPressed: (){
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => LocationScreen(work:"pumer")),
                              );
                            },
                              child: Text('Book', style: TextStyle(fontSize: 20, color: Colors.black),)),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

