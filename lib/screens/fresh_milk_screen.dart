import 'package:app/screens/fast_delivery_screen.dart';
import 'package:flutter/material.dart';
class FreshMilk extends StatelessWidget {
  const FreshMilk({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2FAFF),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 20),
              Align(
                alignment: Alignment.topRight,
                child: InkWell(
                  borderRadius: BorderRadius.circular(8),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Fastdelivery()),
                    );
                  },
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: const [
                      Text(
                        "Skip",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(width: 5),
                      Icon(Icons.arrow_forward_ios, size: 14),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                "Maa Dairy",
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF37448B),
                ),
              ),
              const SizedBox(height: 30),
              Image.asset('../../assets/Milk.png', height: 200),
              const SizedBox(height: 20),
              const Text(
                "Fresh Milk",
                style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.w600,
                  color: Color.fromRGBO(33, 175, 255, 1),
                ),
              ),
              const SizedBox(height: 15),
              const Text(
                "Milk is the best in the marke\nDon't wait; just drink it. \nA glass of milk is a must in \nevery diet.",
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontSize: 20,
                  color: Color.fromRGBO(102, 152, 20, 1),
                  fontWeight: FontWeight.w600,
                ),
              ),
              Spacer(),
              InkWell(
                borderRadius: BorderRadius.circular(12),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Fastdelivery()),
                  );
                },
                   child: Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      color: const Color(0xFFDDEAF0),
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.blue.withOpacity(0.6),
                          offset: const Offset(0, 8),
                          blurRadius: 5,
                        ),
                      ],
                    ),
                    child: const Icon(
                      Icons.arrow_forward,
                      size: 26,
                      color: Color(0xFF37448B),
                    ),
                  ),
            
             ),
            ],
          ),
        ),
      ),
    );
  }
}