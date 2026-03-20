import 'package:app/screens/fresh_milk_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToLogin();
  }

  void _navigateToLogin() async {
    await Future.delayed(const Duration(seconds: 5));
    Get.off(() => FreshMilk());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(190, 255, 125, 1),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
         Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/cow.png', width: 120),
            const SizedBox(width: 15),
            const Text(
              "Maa\nDairy",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.w600,
                color: Colors.black87,
              ),
            ),
          ],
        ),
          const SizedBox(height: 40),
          const CircularProgressIndicator(
            color: Color.fromRGBO(120, 107, 81, 1),
            strokeWidth: 3,
          ),
        ],
      ),
    );
  }
}
