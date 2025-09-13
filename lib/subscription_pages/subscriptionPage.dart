import 'package:flutter/material.dart';

class SubscriptionScreen extends StatefulWidget {
  @override
  State<SubscriptionScreen> createState() => _SubscriptionScreenState();
}

class _SubscriptionScreenState extends State<SubscriptionScreen>
    with TickerProviderStateMixin {
  String selectedPlan = "Mixer";

  @override
  Widget build(BuildContext context) {
    final checkColor =
    selectedPlan == "Mixer VIP" ? Colors.orange : Colors.purple;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // HEADER
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Mixer",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w500)),
                        IconButton(
                          icon: Icon(Icons.close, color: Colors.grey),
                          onPressed: () {
                            Navigator.pop(context); //back to the previous page
                          },
                        ),
                      ],
                    ),
                    SizedBox(height: 16),
                    Text(
                      "Level Up Your Mixer Experience",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w700,
                        color: Colors.black87,
                      ),
                    ),
                    SizedBox(height: 40),
                    Text("Select a plan",
                        style:
                        TextStyle(color: Colors.grey[700], fontSize: 15)),
                    SizedBox(height: 20),

                    // PLAN OPTIONS
                    IntrinsicHeight(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Expanded(
                            child: buildPlanCard(
                              "Mixer",
                              "\$24.99",
                              "All of the below",
                              Colors.purple,
                            ),
                          ),
                          SizedBox(width: 12),
                          Expanded(
                            child: buildPlanCard(
                              "Mixer VIP",
                              "\$99.99",
                              "Mixer + VIP seating,\nfood & beverages",
                              Colors.orange,
                            ),
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height: 20),

                    // PLAN DETAILS BOX
                    AnimatedSize(
                      duration: Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                      child: Stack(
                        children: [
                          Container(
                            width: double.infinity,
                            padding: EdgeInsets.only(
                                top: 30, left: 16, right: 16, bottom: 16),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: selectedPlan == "Mixer VIP"
                                    ? Colors.orange
                                    : Colors.purple,
                                width: 1.5,
                              ),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                buildFeature("Unlimited Likes", checkColor),
                                buildFeature("See who liked you", checkColor),
                                buildFeature(
                                    "Find people with wide range", checkColor),
                                buildFeature("Access to events", checkColor),
                                if (selectedPlan == "Mixer VIP")
                                  buildFeature("VIP seating, food & beverages",
                                      checkColor),
                              ],
                            ),
                          ),

                          // Centered label
                          Positioned(
                            top: -12,
                            left: 0,
                            right: 0,
                            child: Center(
                              child: AnimatedContainer(
                                duration: Duration(milliseconds: 300),
                                curve: Curves.easeInOut,
                                padding: EdgeInsets.symmetric(
                                    horizontal: 14, vertical: 6),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(30),
                                  border: Border.all(
                                    color: selectedPlan == "Mixer VIP"
                                        ? Colors.orange
                                        : Colors.purple,
                                    width: 1,
                                  ),
                                ),
                                child: Text(
                                  "Included with $selectedPlan",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 13,
                                    color: Colors.black87,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height: 100),
                  ],
                ),
              ),
            ),

            // Subscription Button
            SafeArea(
              top: false,
              child: Padding(
                padding:
                const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // CONTINUE BUTTON
                    AnimatedContainer(
                      duration: Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                      width: double.infinity,
                      height: 55,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: selectedPlan == "Mixer VIP"
                            ? Colors.amber.shade700
                            : Colors.purple,
                      ),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.transparent,
                          shadowColor: Colors.transparent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(14),
                          ),
                        ),
                        onPressed: () {},
                        child: Text(
                          "Continue – ${selectedPlan == "Mixer" ? "\$24.99" : "\$99.99"} total",
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        ),
                      ),
                    ),
                    SizedBox(height: 12),

                    // FOOTER
                    Text(
                      "By continuing, you agree to be charged, with auto-renewal until canceled in App Store settings, under Mixer’s Terms.",
                      style:
                      TextStyle(fontSize: 12, color: Colors.grey[600]),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // PLAN CARD(ANIMATION)
  Widget buildPlanCard(
      String title, String price, String description, Color borderColor) {
    bool isSelected = selectedPlan == title;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedPlan = title;
        });
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        padding: EdgeInsets.all(14),
        decoration: BoxDecoration(
          border: Border.all(
            color: isSelected ? borderColor : Colors.grey.shade300,
            width: 1.5,
          ),
          borderRadius: BorderRadius.circular(14),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(title,
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w600)),
                      SizedBox(height: 6),
                      Text(
                        price,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          color: borderColor,
                        ),
                      ),
                    ],
                  ),
                ),
                // Replace this Icon Widget with you required Image or Logo
                Icon(
                  isSelected ? Icons.favorite : Icons.favorite_border,
                  color: isSelected ? borderColor : Colors.grey,
                  size: 22,
                ),
              ],
            ),
            SizedBox(height: 12),
            Text(description,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 13, color: Colors.grey[700])),
          ],
        ),
      ),
    );
  }

  // FEATURE ITEM
  Widget buildFeature(String text, Color checkColor) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        children: [
          Icon(Icons.check, color: checkColor, size: 20),
          SizedBox(width: 8),
          Expanded(
            child: Text(text,
                style: TextStyle(fontSize: 15, color: Colors.black87)),
          ),
        ],
      ),
    );
  }
}
