import 'package:app/screens/welcome_screen.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OutlookScreens extends StatefulWidget {
  const OutlookScreens({super.key});

  @override
  State<OutlookScreens> createState() => _OutlookScreensState();
}

class _OutlookScreensState extends State<OutlookScreens> {
  int _currentIndex = 0;
  final CarouselSliderController _carouselController = CarouselSliderController();

  final List<Map<String, String>> onboardingData = [
    {
      "title": "Fresh Milk",
      "image": "assets/Milk.png",
      "description": "Milk is the best in the market\nDon't wait; just drink it.\nA glass of milk is a must in\nevery diet.",
    },
    {
      "title": "Fast Delivery",
      "image": "assets/fastdelivery.png",
      "description": "Your lightning-fast delivery\npartner · Nothing can slow us\ndown. · We live to save time",
    },
    {
      "title": "Return Pocket",
      "image": "assets/returnpocket.png",
      "description": "Slogans that rhyme with\nreturn are easier to\nremember and grabs the\nattention of users.",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2FAFF),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Maa Dairy",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF37448B),
                    ),
                  ),
                  if (_currentIndex < onboardingData.length - 1)
                    TextButton(
                      onPressed: () => Get.off(() => const WelcomeScreen()),
                      child: Row(
                        children: const [
                          Text(
                            "Skip",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Colors.black87,
                            ),
                          ),
                          SizedBox(width: 5),
                          Icon(Icons.arrow_forward_ios, size: 14, color: Colors.black87),
                        ],
                      ),
                    ),
                ],
              ),
            ),

            const SizedBox(height: 20),
            Expanded(
              child: CarouselSlider(
                carouselController: _carouselController,
                options: CarouselOptions(
                  height: double.infinity,
                  viewportFraction: 1.0,
                  enlargeCenterPage: false,
                  enableInfiniteScroll: false,
                  onPageChanged: (index, reason) {
                    setState(() {
                      _currentIndex = index;
                    });
                  },
                ),
                items: onboardingData.map((data) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              data['image']!,
                              height: 220,
                              fit: BoxFit.contain,
                            ),
                            const SizedBox(height: 40),
                            Text(
                              data['title']!,
                              style: const TextStyle(
                                fontSize: 32,
                                fontWeight: FontWeight.bold,
                                color: Color.fromRGBO(33, 175, 255, 1),
                              ),
                            ),
                            const SizedBox(height: 20),
                            Text(
                              data['description']!,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                fontSize: 18,
                                color: Color.fromRGBO(102, 152, 20, 1),
                                height: 1.5,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  );
                }).toList(),
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: onboardingData.asMap().entries.map((entry) {
                      final bool isSelected = _currentIndex == entry.key;
                      return GestureDetector(
                        onTap: () => _carouselController.animateToPage(entry.key),
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          width: isSelected ? 30.0 : 8.0,
                          height: 8.0,
                          margin: const EdgeInsets.symmetric(horizontal: 4.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            color: isSelected
                                ? const Color(0xFF37448B)
                                : const Color(0xFF37448B).withOpacity(0.2),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                  InkWell(
                    onTap: () {
                      if (_currentIndex < onboardingData.length - 1) {
                        _carouselController.nextPage();
                      } else {
                        Get.off(() => const WelcomeScreen());
                      }
                    },
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      padding: EdgeInsets.symmetric(
                        horizontal: _currentIndex == onboardingData.length - 1 ? 25 : 15,
                        vertical: 12,
                      ),
                      decoration: BoxDecoration(
                        color: _currentIndex == onboardingData.length - 1
                            ? const Color(0xFFD4FF8F)
                            : const Color(0xFFDDEAF0),
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                            color: const Color(0xFF37448B).withOpacity(0.1),
                            blurRadius: 10,
                            offset: const Offset(0, 5),
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min, 
                        children: [
                          Text(
                            _currentIndex == onboardingData.length - 1 ? "Get Started" : "Next",
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF37448B),
                            ),
                          ),
                          if (_currentIndex < onboardingData.length - 1)
                            const Padding(
                              padding: EdgeInsets.only(left: 8.0),
                              child: Icon(Icons.arrow_forward, color: Color(0xFF37448B), size: 20),
                            ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
