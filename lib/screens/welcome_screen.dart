// import 'package:flutter/material.dart';

// class WelcomeScreen extends StatefulWidget {
//   const WelcomeScreen({super.key});

//   @override
//   State<WelcomeScreen> createState() => _WelcomeScreenState();
// }

// class _WelcomeScreenState extends State<WelcomeScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color(0xFFE6F0F5),
//       body: SafeArea(
//         child: Column(
//           children: [
//             Container(
//               width: double.infinity,
//               padding: const EdgeInsets.symmetric(vertical: 20),
//               decoration: const BoxDecoration(
//                 color: Color(0xFFA7E063),
//                 borderRadius: BorderRadius.only(
//                   bottomLeft: Radius.circular(30),
//                   bottomRight: Radius.circular(30),
//                 ),
//               ),
//               child: Column(
//                 children: [
//                   Align(
//                     alignment: Alignment.topRight,
//                      child: Row(
//                     mainAxisSize: MainAxisSize.min,
//                     children: const [
//                       Text(
//                         "Skip",
//                         style: TextStyle(
//                           fontSize: 16,
//                           fontWeight: FontWeight.w600,
//                         ),
//                       ),
//                       SizedBox(width: 5),
//                       Icon(Icons.arrow_forward_ios, size: 14),
//                     ],
//                   ),
//                   ),

//                   const SizedBox(height: 10),

//                   const Text(
//                     "Maa Dairy",
//                     style: TextStyle(
//                       fontSize: 24,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),

//                   const SizedBox(height: 15),
//                   Image.asset(
//                     '../../assets/welcome.png', 
//                     height: 120,
//                   ),
//                 ],
//               ),
//             ),

//             const SizedBox(height: 20),
//             Expanded(
//               child: Container(
//                 width: double.infinity,
//                 padding: const EdgeInsets.all(20),
//                 decoration: const BoxDecoration(
//                   color: Color(0xFFE6F0F5),
//                   borderRadius: BorderRadius.only(
//                     topLeft: Radius.circular(40),
//                     topRight: Radius.circular(40),
//                   ),
//                 ),
//                 child: Column(
//                   children: [
//                     const Text(
//                       "Welcome",
//                       style: TextStyle(
//                         fontSize: 22,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),

//                     const SizedBox(height: 5),

//                     const Text(
//                       "Fresh Day’s For You",
//                       style: TextStyle(color: Colors.grey),
//                     ),

//                     const SizedBox(height: 20),

//                     TextField(
//                       decoration: InputDecoration(
//                         hintText: "Enter Mobile Number",
//                         filled: true,
//                         fillColor: Colors.white,
//                         contentPadding: const EdgeInsets.symmetric(
//                             horizontal: 15, vertical: 12),
//                         border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(10),
//                         ),
//                       ),
//                       keyboardType: TextInputType.phone,
//                     ),

//                     const SizedBox(height: 20),

//                     SizedBox(
//                       width: double.infinity,
//                       height: 45,
//                       child: ElevatedButton(
//                         style: ElevatedButton.styleFrom(
//                           backgroundColor: const Color(0xFF7A6A4F),
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(10),
//                           ),
//                         ),
//                         onPressed: () {},
//                         child: const Text("Next"),
//                       ),
//                     ),

//                     const SizedBox(height: 15),

//                     const Text("Or"),

//                     const SizedBox(height: 15),

//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                       children: [
//                         _socialButton("Google", Icons.g_mobiledata),
//                         _socialButton("Instagram", Icons.camera_alt),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _socialButton(String text, IconData icon) {
//     return Container(
//       padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(10),
//       ),
//       child: Row(
//         children: [
//           Icon(icon, size: 20),
//           const SizedBox(width: 5),
//           Text(text),
//         ],
//       ),
//     );
//   }
// }