import 'package:app/screens/welcome_screen.dart';
import 'package:flutter/material.dart';

class GetStartedScreen extends StatelessWidget {
  const GetStartedScreen({super.key});
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
                      MaterialPageRoute(builder: (context) => WelcomeScreen()),
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
              Image.asset('assets/returnpocket.png', height: 200),
              const SizedBox(height: 20),
              const Text(
                "Return Pocket",
                style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.w600,
                  color: Color.fromRGBO(33, 175, 255, 1),
                ),
              ),
              const SizedBox(height: 15),
              const Text(
                "Slogans that rhyme with\n return are easier to\n remember and grabs the\n attention of users.",
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontSize: 20,
                  color: Color.fromRGBO(102, 152, 20, 1),
                  fontWeight: FontWeight.w600,
                ),
              ),
              const Spacer(),
              InkWell(
                borderRadius: BorderRadius.circular(12),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => WelcomeScreen()),
                  );
                },
                child: Container(
                  height: 55,
                  width: double.infinity,
                  margin: const EdgeInsets.only(bottom: 20),
                  decoration: BoxDecoration(
                    color: const Color(0xFFD4FF8F),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  alignment: Alignment.center,
                  child: const Text(
                    "Get Started",
                    style: TextStyle(
                      fontSize: 18,
                      color: Color(0xFF37448B),
                      fontWeight: FontWeight.w600,
                    ),
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