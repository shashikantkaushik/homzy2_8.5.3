import 'package:flutter/material.dart';
import 'package:homzy1/screens/small_service_page.dart';

class FaceWomenServiceScreen extends StatelessWidget {
  Widget SmallService( BuildContext context, String img, String name, String image, int price ,String desc){
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ServiceInfo (name: name, img: Image.asset(image), price: price, desc: desc,)),
        );
      },

      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(16),
        child: Card(
          elevation: 5,
          child: Row(
            children: [
              // Image on the left side
              Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(img),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              // Text and arrow icon on the right side
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Icon(Icons.arrow_forward),
            ],
          ),
        ),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              SafeArea(
                child: Container(
                  height: 200,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/carpenter_service/carpenter_main.jpeg"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              SmallService(context,
                  "assets/face_care_for_women/eyebrow_2.2.jpeg",
                  "Eyebrow",
                  "assets/face_care_for_women/eyebrow_poster_2.2.jpeg",
                  int.parse("399"),
                  "Our eyebrow home service provides precise and personalized eyebrow shaping to enhance the natural shape and balance of the face, using high-quality products and techniques to create a polished and professional look."
              ),
              SmallService(context,
                  "assets/face_care_for_women/facial_cleaning.jpeg",
                  "Facial",
                  "assets/face_care_for_women/exfoliation_poster.webp",
                  int.parse("399"),
                  "Our facial home service offers a range of personalized facial treatments using high-quality products and specialized techniques to cleanse, exfoliate, and nourish the skin for a refreshed and rejuvenated appearance."
              ),
              SmallService(context,
                  "assets/face_care_for_women/makup_2.2.jpeg",
                  "Makeup",
                  "assets/face_care_for_women/makup_poster.jpeg",
                  int.parse("499"),
                  "Our professional makeup artists provide personalized makeup application using high-quality products and tools to enhance your natural beauty and create the perfect look for any occasion."
              ),
            ],
          ),
        ),
      ),
    );
  }
}