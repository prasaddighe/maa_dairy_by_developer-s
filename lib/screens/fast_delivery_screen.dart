// import 'package:app/screens/get_started_screen.dart';
// import 'package:flutter/material.dart';

// class Fastdelivery extends StatefulWidget {
//   const Fastdelivery({super.key});

//   @override
//   State<Fastdelivery> createState() => _FastdeliveryState();
// }

// class _FastdeliveryState extends State<Fastdelivery> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color(0xFFEAF2F3),
//       body: SafeArea(
//         child: Padding(
//           padding: const EdgeInsets.only(top: 10.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.end,
//                 children: [
//                   GestureDetector(
//                     onTap: () {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                           builder: (context) => GetStartedScreen(),
//                         ),
//                       );
//                     },
//                     child: const Text(
//                       "Skip ",
//                       style: TextStyle(
//                         fontSize: 16,
//                         fontWeight: FontWeight.normal,
//                         color: Colors.black,
//                       ),
//                     ),
//                   ),
//                   Icon(
//                     Icons.arrow_forward_ios,
//                     color: Colors.black,
//                     size: 16,
//                   ),
//                 ],
//               ),
//               const SizedBox(height: 20),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: const [
//                   Text(
//                     "Maa Dairy",
//                     style: TextStyle(
//                       fontSize: 30,
//                       fontWeight: FontWeight.bold,
//                       color: Color(0xFF37448B),
//                     ),
//                   ),
//                 ],
//               ),
//               const SizedBox(height: 20),
//               Center(
//                 child: Image.asset(
//                   '../../assets/fastdelivery.png',
//                   height: 180,
//                 ),
//               ),
//               const SizedBox(height: 20),
//               const Text(
//                 "Fast Delivery",
//                 style: TextStyle(
//                   fontSize: 28,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.blue,
//                 ),
//               ),
//               const SizedBox(height: 15),
//               Center(
//                 child: SizedBox(
//                   width: 260,
//                   child: const Text(
//                     "Your lightning-fast delivery .\n"
//                     "partner · Nothing can slow us\n"
//                     "down. · We live to save time.",
//                     textAlign: TextAlign.center,
//                     style: TextStyle(
//                       fontSize: 16,
//                       color: Color(0xFF669814),
//                       fontWeight: FontWeight.w600,
//                       height: 1.5,
//                     ),
//                   ),
//                 ),
//               ),
//               const Spacer(),
//               Padding(
//                 padding: const EdgeInsets.only(bottom: 40),
//                 child: InkWell(
//                   onTap: () {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(builder: (context) => GetStartedScreen()),
//                     );
//                   },
//                   child: Container(
//                     height: 50,
//                     width: 50,
//                     decoration: BoxDecoration(
//                       color: const Color(0xFFDDEAF0),
//                       shape: BoxShape.circle,
//                       boxShadow: [
//                         BoxShadow(
//                           color: Colors.blue.withOpacity(0.6),
//                           offset: const Offset(0, 8),
//                           blurRadius: 5,
//                         ),
//                       ],
//                     ),
//                     child: const Icon(
//                       Icons.arrow_forward,
//                       size: 26,
//                       color: Color(0xFF37448B),
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:app/screens/get_started_screen.dart';
import 'package:app/screens/welcome_screen.dart';
import 'package:flutter/material.dart';

class Fastdelivery extends StatelessWidget {
  const Fastdelivery({super.key});
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
                      MaterialPageRoute(
                          builder: (context) => GetStartedScreen()),
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
              Image.asset('../../assets/fastdelivery.png', height: 200),
              const SizedBox(height: 20),
              const Text(
                "Fast Delivery",
                style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.w600,
                  color: Color.fromRGBO(33, 175, 255, 1),
                ),
              ),
              const SizedBox(height: 15),
              const Text(
                "Your lightning-fast delivery\n partner · Nothing can slow us\n down. · We live to save time\n",
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
                    MaterialPageRoute(builder: (context) => GetStartedScreen()),
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
