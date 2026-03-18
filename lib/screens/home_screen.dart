import 'dart:ui';

import 'package:app/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  List<String> imageList = [
    '../../assets/download.png',
    '../../assets/download.png',
    '../../assets/download.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Get.to(() => LoginScreen());
          },
        ),
      ),
     
    );
  }
}
