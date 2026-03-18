import 'package:flutter/material.dart';

class FreshMilk extends StatefulWidget {
  const FreshMilk({super.key});

  @override
  State<FreshMilk> createState() => _FreshMilkState();
}

class _FreshMilkState extends State<FreshMilk> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEAF2F3),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [

              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: () {
                    },
                    child: const Text(
                      "Skip ",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  Icon(Icons.arrow_forward_ios, color: Colors.black,
                  size: 16,
                  ),
                ],
              ),

              const SizedBox(height: 20),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    "Maa Dairy",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF37448B),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 20),
       Center(
                child: Image.asset(
                  '../../assets/Milk.png',
                  height: 140,
                ),
              ),

              const SizedBox(height: 20),

              const Text(
                "Fresh Milk",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),

              const SizedBox(height: 15),
              Center(
                child: SizedBox(
                  width: 260,
                  child: const Text(
                    "Milk is the best in the market.\n"
                    "Don't wait; just drink it.\n"
                    "A glass of milk is a must in every diet.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      color: Color(0xFF669814),
                      fontWeight: FontWeight.w600,
                      height: 1.5,
                    ),
                  ),
                ),
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.only(bottom: 40),
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