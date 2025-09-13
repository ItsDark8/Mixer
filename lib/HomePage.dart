import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_assignmenet_app/subscription_pages/subscriptionPage.dart';
import 'package:flutter_assignmenet_app/widget/flitter_widget.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          "Mixer",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.flash_on_sharp, color: Colors.purple),
            onPressed: () {Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SubscriptionScreen()),  //Subscription Screen
            );}
          ),
          IconButton(
            icon: const Icon(Icons.notifications_none_sharp, color: Colors.black),
            onPressed: () {},
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: Column(
          children: [

            // Filters Row
            SizedBox(
              height: 40,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  AnimatedFilterItem(
                    haveIcon: true,
                    icon: Icons.filter_list,
                    text: "Filters",
                    primaryColor: Colors.purple,
                    changeColor: Colors.purple,
                    needArrowIcon: false,
                  ),
                  const SizedBox(width: 8),
                  AnimatedFilterItem(
                    haveIcon: false,
                    icon: Icons.filter_list,
                    text: "Age",
                    primaryColor: Colors.grey,
                    changeColor: Colors.purple,
                    needArrowIcon: true,
                  ),
                  const SizedBox(width: 8),
                  AnimatedFilterItem(
                    haveIcon: false,
                    icon: Icons.filter_list,
                    text: "Height",
                    primaryColor: Colors.grey,
                    changeColor: Colors.purple,
                    needArrowIcon: true,
                  ),
                  const SizedBox(width: 8),
                  AnimatedFilterItem(
                    haveIcon: false,
                    icon: Icons.filter_list,
                    text: "Habits",
                    primaryColor: Colors.grey,
                    changeColor: Colors.purple,
                    needArrowIcon: true,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 180),

            // Profile Images
            Column(
              children: [
                //Remove this widget and replace with image
                profileImages(),
                const SizedBox(height: 24),
                // Message
                const Text(
                  "You’ve seen everyone nearby",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                const Text(
                  "No more profiles in your area. Check back later or expand your location to see more people.",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 14, color: Colors.black54),
                ),
                const SizedBox(height: 24),

                // Adjust Location Button
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.purple,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                    ),
                    onPressed: () {},
                    child: const Text(
                      "Adjust Location",
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.purple,
        unselectedItemColor: Colors.grey,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_filled),
            label: "Explore",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_border),
            label: "Likes",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.card_giftcard_outlined),
            label: "Gifts",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.remove_red_eye_outlined),
            label: "Views",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: "Profile",
          ),
        ],
      ),
    );
  }

  //Remove this if you have remove the profileImage widget
  Widget profileImages() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        CircleAvatar(radius: 30, backgroundImage: NetworkImage('https://via.placeholder.com/60')),
        SizedBox(width: 10),
        CircleAvatar(radius: 30, backgroundImage: NetworkImage('https://via.placeholder.com/60')),
        SizedBox(width: 10),
        CircleAvatar(radius: 30, backgroundImage: NetworkImage('https://via.placeholder.com/60')),
      ],
    );
  }
}

class FilterChipItem extends StatelessWidget {
  final String text;
  const FilterChipItem({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Text(
        text,
        style: const TextStyle(color: Colors.black54, fontWeight: FontWeight.w500),
      ),
    );
  }
}
