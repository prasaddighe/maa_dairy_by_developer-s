// import 'package:app/controller/login_controller.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class LoginScreen extends StatelessWidget {
//   LoginScreen({super.key});

//   final LoginController controller = Get.put(LoginController());
//   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         appBar: AppBar(title: const Text('Login Screen')),

//         body: Padding(
//           padding: const EdgeInsets.all(16),

//           child: Form(
//             key: _formKey,
//             autovalidateMode: AutovalidateMode.onUserInteraction,
//             child: Column(
//               // mainAxisAlignment: MainAxisAlignment.center,
//               // crossAxisAlignment: CrossAxisAlignment.stretch,
//               children: [
//                 const Spacer(),
//                 const Icon(
//                   Icons.lock_person,
//                   size: 50,
//                   color: Colors.blueAccent,
//                 ),
//                 const Spacer(),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceAround,
//                   children: [
//                     GestureDetector(
//                       onTap: () {
//                         controller.isEmailSelected.value = true;
//                         controller.isOtpSent.value = false;
//                       },
//                       child: Obx(
//                         () => Text(
//                           "Email",
//                           style: TextStyle(
//                             fontSize: 16,
//                             fontWeight: FontWeight.bold,
//                             color: controller.isEmailSelected.value
//                                 ? Colors.blue
//                                 : Colors.grey,
//                           ),
//                         ),
//                       ),
//                     ),
//                     GestureDetector(
//                       onTap: () {
//                         controller.isEmailSelected.value = false;
//                         controller.isOtpSent.value = false;
//                       },
//                       child: Obx(
//                         () => Text(
//                           "Mobile",
//                           style: TextStyle(
//                             fontSize: 16,
//                             fontWeight: FontWeight.bold,
//                             color: !controller.isEmailSelected.value
//                                 ? Colors.blue
//                                 : Colors.grey,
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//                 const SizedBox(height: 30),
//                 Obx(() {
//                   if (controller.isEmailSelected.value) {
//                     return Column(
//                       children: [
//                         TextFormField(
//                           controller: controller.emailController,
//                           decoration: const InputDecoration(
//                             hintText: 'Email',
//                             border: OutlineInputBorder(),
//                             prefixIcon: Icon(Icons.email),
//                           ),
//                           validator: (value) {
//                             if (value == null || value.isEmpty) {
//                               return 'Please enter email';
//                             }
//                             return null;
//                           },
//                         ),
//                         const SizedBox(height: 16),
//                         TextFormField(
//                           controller: controller.passwordController,
//                           obscureText: true,
//                           decoration: const InputDecoration(
//                             hintText: 'Password',
//                             border: OutlineInputBorder(),
//                             prefixIcon: Icon(Icons.lock),
//                           ),
//                           validator: (value) {
//                             if (value == null || value.isEmpty) {
//                               return 'Please enter password';
//                             }
//                             return null;
//                           },
//                         ),

//                         const SizedBox(height: 16),
//                         Obx(
//                           () => Row(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Checkbox(
//                                 value: controller.isChecked.value,
//                                 activeColor: Colors.green,
//                                 onChanged: (value) {
//                                   controller.isChecked.value = value ?? false;
//                                 },
//                               ),
//                               const Expanded(
//                                 child: Padding(
//                                   padding: EdgeInsets.only(top: 12),
//                                   child: Text(
//                                     "Before login, please make sure to read and accept our Terms of Service and Privacy Policy.",
//                                     style: TextStyle(
//                                       fontSize: 13,
//                                       color: Colors.grey,
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ],
//                     );
//                   } else {
//                     return Column(
//                       children: [
//                         TextFormField(
//                           controller: controller.mobileController,
//                           keyboardType: TextInputType.phone,
//                           decoration: const InputDecoration(
//                             hintText: 'Mobile Number',
//                             border: OutlineInputBorder(),
//                             prefixIcon: Icon(Icons.phone),
//                           ),
//                           enabled: !controller.isOtpSent.value,
//                           validator: (value) {
//                             if (value == null || value.isEmpty) {
//                               return 'Please enter mobile number';
//                             }
//                             if (value.length < 10) {
//                               return 'Enter valid mobile number';
//                             }
//                             return null;
//                           },
//                         ),
//                         if (controller.isOtpSent.value) ...[
//                           const SizedBox(height: 16),
//                           TextFormField(
//                             controller: controller.otpController,
//                             keyboardType: TextInputType.number,
//                             decoration: const InputDecoration(
//                               hintText: 'Enter OTP',
//                               border: OutlineInputBorder(),
//                               prefixIcon: Icon(Icons.security),
//                             ),
//                             validator: (value) {
//                               if (value == null || value.isEmpty) {
//                                 return 'Please enter OTP';
//                               }
//                               if (value.length < 4) {
//                                 return 'Enter valid OTP';
//                               }
//                               return null;
//                             },
//                           ),
//                         ],
//                       ],
//                     );
//                   }
//                 }),
//                 SizedBox(height: 16),
//                 const Spacer(),
//                 Obx(
//                   () => controller.isLoading.value
//                       ? const Center(child: CircularProgressIndicator())
//                       : InkWell(
//                           onTap: () {
//                             if (_formKey.currentState!.validate()) {
//                               controller.login();
//                             }
//                           },
//                           child: Container(
//                             height: 50,
//                             decoration: BoxDecoration(
//                               color: Colors.blue,
//                               borderRadius: BorderRadius.circular(10),
//                             ),
//                             alignment: Alignment.center,
//                             child: Text(
//                               controller.isEmailSelected.value
//                                   ? "Login"
//                                   : controller.isOtpSent.value
//                                   ? "Verify OTP"
//                                   : "Send OTP",
//                               style: const TextStyle(
//                                 fontSize: 18,
//                                 color: Colors.white,
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             ),
//                           ),
//                         ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
