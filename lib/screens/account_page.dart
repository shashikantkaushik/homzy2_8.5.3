import 'package:flutter/material.dart';
import 'package:homzy1/auth.dart';
import 'package:homzy1/screens/home_screen.dart';
import 'package:provider/provider.dart';
import 'package:homzy1/screens/WelcomeScreen.dart';
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
          // Circular, small image in the middle of the top screen
          SafeArea(
            child: Container(
              child:
                CircleAvatar(

                  backgroundImage: NetworkImage(ap.userModel.profilePic),
                  backgroundColor: Color(0xFF189AB4),
                  radius: 50,
                )
            ),
          ),
          SizedBox(height: 50),
          // Container 1 with payment icon and arrow
          Container(
            height: 60.0,
            color: Colors.white,
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.edit,
                      color: Colors.black,
                      size: 32.0,
                    ),
                    SizedBox(width: 16.0),
                    Text(
                      "Profile Edit",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 24.0,
                      ),
                    ),
                  ],
                ),
                Spacer(),
                Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.black,
                  size: 24.0,
                ),
              ],
            ),
          ),
          SizedBox(height: 16.0),
          Container(
            height: 60.0,
            color: Colors.white,
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.payment,
                      color: Colors.black,
                      size: 32.0,
                    ),
                    SizedBox(width: 16.0),
                    Text(
                      "Payment",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 24.0,
                      ),
                    ),
                  ],
                ),
                Spacer(),
                Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.black,
                  size: 24.0,
                ),
              ],
            ),
          ),
          SizedBox(height: 16.0),
          Container(
            height: 60.0,
            color: Colors.white,
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.question_answer,
                      color: Colors.black,
                      size: 32.0,
                    ),
                    SizedBox(width: 16.0),
                    Text(
                      "FAQ",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 24.0,
                      ),
                    ),
                  ],
                ),
                Spacer(),
                Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.black,
                  size: 24.0,
                ),
              ],
            ),
          ),
          SizedBox(height: 16.0),
          // Container 2
          Container(
            height: 60.0,
            color: Colors.white,
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.help,
                      color: Colors.black,
                      size: 32.0,
                    ),
                    SizedBox(width: 16.0),
                    TextButton(
                      onPressed: (){
                        dynamic conversationObject = {
                          'appId': '$kchatbot',// The [APP_ID](https://dashboard.kommunicate.io/settings/install) obtained from kommunicate dashboard.
                        };

                        KommunicateFlutterPlugin.buildConversation(conversationObject)
                            .then((clientConversationId) {

                          print("Conversation builder success : " + clientConversationId.toString());
                        }).catchError((error) {
                          print("Conversation builder error : " + error.toString());
                        });
                      },
                      child: Text(
                        "Help",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 24.0,
                        ),
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

          SizedBox(height: 16.0),
          // Container 3
          // Container 4
          // Container 4
          Container(
            height: 60.0,
            color: Colors.white,
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.email,
                      color: Colors.black,
                      size: 32.0,
                    ),
                    SizedBox(width: 16.0),
                    Text(
                      "About us",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 24.0,
                      ),
                    ),
                  ],
                ),
                Spacer(),
                Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.black,
                  size: 24.0,
                ),
              ],
            ),
          ),
          SizedBox(height: 16.0),
          // Container 3
          // Container 4
          Container(
            height: 60.0,
            color: Colors.white,
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: (){
                      ap.userSignOut().then(
                          (value) => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const WelcomeScreen(),
                        ),
                      ),
                    );
                  },
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: (){
                          ap.userSignOut().then(
                                (value) => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const WelcomeScreen(),
                              ),
                            ),
                          );
                        },
                        child: Icon(
                          Icons.logout,
                          color: Colors.black,
                          size: 32.0,
                        ),
                      ),
                      SizedBox(width: 16.0),
                      Text(
                        "Log Out",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 24.0,
                        ),
                      ),
                    ],
                  ),
                ),
                Spacer(),
                GestureDetector(
                  onTap: (){ap.userSignOut().then(
                        (value) => Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const WelcomeScreen(),
                      ),
                          (Route<dynamic> route) => false,
                    ),
                  );

                  },
                  child: Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.black,
                    size: 24.0,
                  ),
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
