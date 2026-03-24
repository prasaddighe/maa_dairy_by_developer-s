import 'dart:convert';
import 'package:app/screens/home_screen.dart';
import 'package:app/screens/otp_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class LoginController extends GetxController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final mobileController = TextEditingController();
  final otpController = TextEditingController();

  var isLoading = false.obs;
  var isChecked = false.obs;
  var isEmailSelected = true.obs;
  var isOtpSent = false.obs;

  void _loginWithEmail() async {
    if (emailController.text.isEmpty || passwordController.text.isEmpty) {
      Get.snackbar(
        'Error',
        'Please enter email and password',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.redAccent,
        colorText: Colors.white,
      );
      return;
    }

    isLoading.value = true;

    try {
      final url = Uri.parse('https://qa-new-platform.duckdns.org/auth/api/auth/login');
      final bodyData = jsonEncode({
        "email": emailController.text.trim(),
        "password": passwordController.text.trim(),
      });

      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: bodyData,
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        final responseData = jsonDecode(response.body);
        print("Login Success $responseData");

        Get.snackbar(
          'Success',
          'Logged in successfully!',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green,
          colorText: Colors.white,
        );
      } else {
        final errorData = jsonDecode(response.body);

        Get.snackbar(
          'Login Failed',
          errorData['error'] ?? 'Invalid credentials',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.orange,
          colorText: Colors.white,
        );
      }

    } catch (e) {

      Get.snackbar(
        'Failed',
        'Failed to login: $e',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.redAccent,
        colorText: Colors.white,
      );

    } finally {
      isLoading.value = false;
    }
  }

  void sendOtp() async {
    if (mobileController.text.isEmpty || mobileController.text.length != 10) {
      Get.snackbar(
        'Error',
        'Please enter a valid 10-digit mobile number',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.redAccent,
        colorText: Colors.white,
      );
      return;
    }

    isLoading.value = true;

    try {
      final url = Uri.parse('https://api.baap.company/auth/api/auth/request-otp');
      final bodyData = jsonEncode({
        "phone": mobileController.text.trim(),
      });

      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: bodyData,
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        try {
          final responseData = jsonDecode(response.body);
          print("OTP Send Success $responseData");
        } catch (_) {
          print("OTP Send Success body: ${response.body}");
        }

        isOtpSent.value = true;

        Get.snackbar(
          'OTP Sent',
          'OTP has been sent to your mobile number',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green,
          colorText: Colors.white,
        );
        Get.to(() => const OTPVerificationScreen());
      } else {
        final errorData = jsonDecode(response.body);
        Get.snackbar(
          'Failed',
          errorData['error'] ?? 'Failed to send OTP',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.orange,
          colorText: Colors.white,
        );
      }

    } catch (e) {
      Get.snackbar(
        'Error',
        'Failed to send OTP: $e',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.redAccent,
        colorText: Colors.white,
      );
    } finally {
      isLoading.value = false;
    }
  }

  void verifyOtp() async {
    if (otpController.text.isEmpty || otpController.text.length != 6) {
      Get.snackbar(
        'Error',
        'Please enter a valid 6-digit OTP',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.redAccent,
        colorText: Colors.white,
      );
      return;
    }

    isLoading.value = true;

    try {
      final url = Uri.parse('https://api.baap.company/auth/api/auth/verify-otp');
      final bodyData = jsonEncode({
        "phone": mobileController.text.trim(),
        "otp": otpController.text.trim(),
      });

      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: bodyData,
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        try {
          final responseData = jsonDecode(response.body);
          print("Verify OTP Success $responseData");
        } catch (_) {
          print("Verify OTP Success body: ${response.body}");
        }

        Get.snackbar(
          'Success',
          'OTP Verified successfully',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green,
          colorText: Colors.white,
        );
        Get.offAll(() => const HomeScreen());
      } else {
        final errorData = jsonDecode(response.body);
        Get.snackbar(
          'Verification Failed',
          errorData['error'] ?? errorData['message'] ?? 'Invalid OTP',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.orange,
          colorText: Colors.white,
        );
      }
    } catch (e) {
      Get.snackbar(
        'Error',
        'Failed to verify OTP: $e',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.redAccent,
        colorText: Colors.white,
      );
    } finally {
      isLoading.value = false;
    }
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    mobileController.dispose();
    otpController.dispose();
    super.onClose();
  }
}


