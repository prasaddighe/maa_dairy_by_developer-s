import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'address_screen.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  int _selectedPaymentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black, size: 20),
          onPressed: () => Get.back(),
        ),
        title: const Text(
          "My Payment",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        centerTitle: false,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              const Text(
                "Choose Your Payment Mode",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 20),
              _buildSectionTitle("Credit /Debit Card", true),
              const SizedBox(height: 15),
              _buildCreditCardPreview(),
              const SizedBox(height: 25),
              _buildSectionTitle("UPI", true),
              const SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildUpiOption("assets/gpay.png", "GPay", Colors.white),
                  _buildUpiOption("assets/phonepe.png", "PhonePe", Colors.white),
                  _buildUpiOption(null, "Add", Colors.white, isAdd: true),
                ],
              ),
              const SizedBox(height: 25),
              _buildSectionTitle("Other Payment Mode", false),
              const SizedBox(height: 15),
              _buildPaymentTile("Net Banking", 0),
              _buildPaymentTile("Wallet", 1),
              _buildPaymentTile("Cash On Delivery", 2),
              const SizedBox(height: 30),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => Get.to(() => const AddressScreen()),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFD4FF8F),
                    foregroundColor: Colors.black,
                    padding: const EdgeInsets.symmetric(vertical: 18),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    elevation: 0,
                  ),
                  child: const Text(
                    "Make Payment",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title, bool isSelected) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Colors.black87,
          ),
        ),
        if (isSelected)
          const Icon(Icons.stars, color: Color(0xFFFFCC00), size: 18),
      ],
    );
  }

  Widget _buildCreditCardPreview() {
    return Container(
      width: double.infinity,
      height: 180,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: const LinearGradient(
          colors: [Color(0xFF2196F3), Color(0xFF1565C0)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                "Easyshop",
                style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
              Text(
                "HDFC BANK",
                style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          const Text(
            "PLATINUM",
            style: TextStyle(color: Colors.white70, fontSize: 10, letterSpacing: 2),
          ),
          const Spacer(),
          const Text(
            "6321 66XX XXXX 3456",
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.5,
            ),
          ),
          const Text(
            "GARVICK MARSH",
            style: TextStyle(color: Colors.white70, fontSize: 12),
          ),
          Row(
             mainAxisAlignment: MainAxisAlignment.end,
            children: const [
              Text(
                "RuPay",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic,
                  fontSize: 20,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildUpiOption(String? asset, String label, Color color, {bool isAdd = false}) {
    return Container(
      width: (Get.width - 60) / 3,
      padding: const EdgeInsets.symmetric(vertical: 12),
      decoration: BoxDecoration(
        color: const Color(0xFFF2FAFF),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        children: [
          if (isAdd)
            const Icon(Icons.add_circle_outline, color: Color(0xFF2196F3), size: 30)
          else
            const Icon(Icons.account_balance_wallet, color: Color(0xFF2196F3), size: 30),
          const SizedBox(height: 8),
          Text(
            label,
            style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  Widget _buildPaymentTile(String title, int index) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      decoration: BoxDecoration(
        color: const Color(0xFFF2FAFF),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
          ),
          const Icon(Icons.stars, color: Color(0xFFFFCC00), size: 18),
        ],
      ),
    );
  }
}
