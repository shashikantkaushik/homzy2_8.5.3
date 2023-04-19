import 'package:flutter/material.dart';
import 'package:homzy1/screens/small_service_page.dart';

class CarpenterServiceScreen extends StatelessWidget {
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
                  "assets/carpenter_service/door_repair.jpeg",
                  "Door repair",
                  "assets/carpenter_service/door_repaair_poster.jpg",
                  int.parse("399"),
                  "We specialize in repairing all types of doors including wooden, glass, metal, and sliding doors."
              ),
              SmallService(context,
                  "assets/carpenter_service/roof_repair.jpeg",
                  "floor repair",
                  "assets/carpenter_service/floor_reapir_poster.jpg",
                  int.parse("399"),
                  "We use high-quality materials and modern equipment to efficiently assess, repair, and protect your floors while prioritizing customer satisfaction with our quality workmanship and professionalism."
              ),
              SmallService(context,
                  "assets/carpenter_service/cabinet_reapir.jpeg",
                  "Cabinet repair",
                  "assets/carpenter_service/cabinet_reapir_poster.webp",
                  int.parse("499"),
                  "We use high-quality materials and modern equipment to efficiently repair any cabinet issue while prioritizing customer satisfaction with our excellent service and attention to detail."
              ),
              SmallService(context,
                  "assets/carpenter_service/window_reapir.jpeg",
                  "Window repair",
                  "assets/carpenter_service/window_repair_poster.jpeg",
                  int.parse("749"),
                  "We use high-quality materials and modern equipment to efficiently diagnose and repair any window issue while prioritizing customer satisfaction with our professional service and commitment to excellence."
              ),
            ],
          ),
        ),
      ),
    );
  }
}


