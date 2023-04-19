import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:homzy1/auth.dart';
import 'package:provider/provider.dart';
import 'package:homzy1/screens/WelcomeScreen.dart';
import 'package:homzy1/screens/profile_screen.dart';
import 'package:kommunicate_flutter/kommunicate_flutter.dart';
class SubSetting extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ap = Provider.of<AuthProvider>(context, listen: false);
    const kchatbot="24b188427eb21cddb27882c3ee1ffae54";
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
      body: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          // Circular, small image in the middle of the top screen
          SafeArea(
            child: Container(
              padding: EdgeInsets.only(left: 10),
              width: 400.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    height: 100.0,
                    width: 100.0,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xFF189AB4),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(ap.userModel.profilePic),
                      ),
                    ),
                  ),


                  SizedBox(width: 20.0),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                       "$name",
                        style: TextStyle(
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 5.0),
                      Text(
                       "$phone",
                        style: TextStyle(
                          fontSize: 18.0,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ],
              ),

            ),

          ),
          SizedBox(height: 50),
          // Container 1 with payment icon and arrow
          Container(
            height: 60.0,
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.account_circle,
                      color: Colors.blueAccent,
                      size: 50.0,
                    ),
                    SizedBox(width: 10.0),
                    TextButton(
                      onPressed: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Profile(),
                          ),
                        );
                      },
                      child: Text(
                        "Profile",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 23.0,
                        ),
                      ),
                    ),
                  ],
                ),
              //  Spacer(),
                Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.black,
                  size: 24.0,
                ),
              ],
            ),
          ),
          SizedBox(height: 20.0),
          Container(
            height: 60.0,
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.payment,
                      color: Colors.purpleAccent,
                      size: 50.0,
                    ),
                    SizedBox(width: 10.0),
                    Text(
                      "Payment",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 23.0,
                      ),
                    ),
                  ],
                ),
               // Spacer(),
                Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.black,
                  size: 24.0,
                ),
              ],
            ),
          ),
          SizedBox(height: 20.0),
          Container(
            height: 60.0,
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.question_answer,
                      color: Colors.deepOrange,
                      size: 50.0,
                    ),
                    SizedBox(width: 10.0),
                    Text(
                      "FAQ",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 23.0,
                      ),
                    ),
                  ],
                ),
               // Spacer(),
                Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.black,
                  size: 24.0,
                ),
              ],
            ),
          ),
          SizedBox(height: 20.0),
          // Container 2
          Container(
            height: 60.0,
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.help,
                      color: Colors.orangeAccent,
                      size: 50.0,
                    ),
                    SizedBox(width: 10.0),
                    Text(
                      "Help",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 23.0,
                      ),
                    ),
                  ],
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.black,
                  size: 24.0,
                ),
              ],
            ),
          ),

          SizedBox(height: 20.0),
          // Container 3
          // Container 4
          // Container 4
          Container(
            height: 60.0,
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.email_outlined,
                      color: Colors.redAccent,
                      size: 50.0,
                    ),
                    SizedBox(width: 10.0),
                    Text(
                      "About us",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 23.0,
                      ),
                    ),
                  ],
                ),
             //   Spacer(),
                Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.black,
                  size: 24.0,
                ),
              ],
            ),
          ),
          SizedBox(height: 20.0),
          // Container 3
          // Container 4
          Container(
            height: 60.0,
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: (){
                    ap.userSignOut().then(
                          (value) => Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const WelcomeScreen(),
                        ),
                            (Route<dynamic> route) => false,
                      ),
                    );
                  },
                  child:  Row(
                    children: [
                      Icon(
                        Icons.logout,
                        color: Colors.blueGrey,
                        size: 50.0,
                      ),
                      SizedBox(width: 10.0),
                      TextButton(
                        onPressed: (){
                          ap.userSignOut().then(
                                (value) => Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const WelcomeScreen(),
                              ),
                                  (Route<dynamic> route) => false,
                            ),
                          );
                        },
                        child: Text(
                          "Log Out",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 23.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

              //  Spacer(),
                Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.black,
                  size: 24.0,
                ),
              ],
            ),
          ),
          SizedBox(height: 16.0),
          // Container 5
        ],
      ),
    );
  }
}