import 'package:flutter/material.dart';
import 'package:homzy1/screens/small_service_page.dart';

class CleaningServiceScreen extends StatelessWidget {
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
                      image: AssetImage("assets/cleaning_service/1_room_set_cleaning.jpeg"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              SmallService(context,
                  "assets/cleaning_service/bathroom_cleaning.jpeg",
                  "Bathroom cleaning",
                  "assets/cleaning_service/bathroom_cleaning_poster.jpeg",
                  int.parse("299"),
                  "Our bathroom cleaning service ensures that your bathroom is left sparkling clean and free from germs and bacteria."
              ),
              SmallService(context,
                  "assets/cleaning_service/kitchen_cleaning.jpeg",
                  "Kitchen cleaning",
                  "assets/cleaning_service/kitchen_cleaner_poster.jpeg",
                  int.parse("399"),
                  "With our kitchen cleaning service, you can enjoy cooking and dining in a clean and healthy environment without worrying about the tedious task of cleaning up afterwards."
              ),
              SmallService(context,
                  "assets/cleaning_service/sofa_cleaning.jpeg",
                  "Sofa cleaning",
                  "assets/cleaning_service/sofa_cleaner_poster.jpeg",
                  int.parse("499"),
                  "Our sofa cleaning service uses specialized cleaning methods to remove dirt, stains, and odors from your sofa, leaving it looking and smelling fresh and clean."
              ),
              SmallService(context,
                  "assets/cleaning_service/carpet_cleaning.webp",
                  "Carpet cleaning",
                  "assets/cleaning_service/carpet_cleaner_poster.jpeg",
                  int.parse("299"),
                  "Our carpet cleaning service uses advanced cleaning techniques to thoroughly clean and sanitize your carpets, leaving them looking and feeling like new."
              ),
              SmallService(context,
                  "assets/cleaning_service/garden claening.jpeg",
                  "Garden cleaning",
                  "assets/cleaning_service/garden_cleaner_poster.jpeg",
                  int.parse("4555"),
                  "Our garden cleaning service ensures that your outdoor space is left clean, tidy, and free from debris, making it a safe and enjoyable place for you and your family to relax and play."
              ),
            ],
          ),
        ),
      ),
    );
  }
}