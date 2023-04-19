import 'package:flutter/material.dart';
import 'package:homzy1/screens/small_service_page.dart';

class RepairServiceScreen extends StatelessWidget {
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
                      image: AssetImage("assets/repair_serivce/electric_main.webp"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              SmallService(context,
                  "assets/repair_serivce/switch_repair.jpeg",
                  "Switch repair",
                  "assets/repair_serivce/switch_poster.jpeg",
                  int.parse("399"),
                  "Our expert technicians can repair any issues with your switches, whether it's a flickering light or a faulty switch."
              ),
              SmallService(context,
                  "assets/repair_serivce/ovens_stoves_repair.jpeg",
                  "Stoves repair",
                  "assets/repair_serivce/stove_poster_2.1.jpeg",
                  int.parse("399"),
                  "Our expert technicians can repair any issues with your stove, from faulty burners to broken heating elements."
              ),
              SmallService(context,
                  "assets/repair_serivce/vaccum_cleaners.jpeg",
                  "vaccum repair",
                  "assets/repair_serivce/vacuum_poster.jpeg",
                  int.parse("499"),
                  "Our expert technicians can repair any issues with your vacuum, from suction problems to broken belts."
              ),
              SmallService(context,
                  "assets/repair_serivce/fan_repair.webp",
                  "Fan repair",
                  "assets/repair_serivce/fan_poster.webp",
                  int.parse("749"),
                  "Our fan repair services include a thorough inspection of your fan to diagnose the issue and provide you with a comprehensive repair plan."
              ),
              SmallService(context,
                  "assets/repair_serivce/electrical-wiring.jpeg",
                  "Electric wire repair",
                  "assets/repair_serivce/wire_repair_2.3.jpeg",
                  int.parse("4555"),
                  "We offer reliable and affordable wire repair services for all types of electrical wiring systems."
              ),
            ],
          ),
        ),
      ),
    );
  }
}