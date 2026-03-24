import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'help_center_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
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
          "My Account",
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
            children: [
              const SizedBox(height: 10),
              _buildProfileHeader(),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                   _buildTopAction("Wallet", Icons.wallet, Colors.blue),
                   _buildTopAction("Orders", Icons.shopping_basket, Colors.cyan),
                   _buildTopAction("Address", Icons.location_on, Colors.orange),
                ],
              ),
              const SizedBox(height: 30),
              _buildMenuItem("Return Milk Pocket", Icons.refresh),
              _buildMenuItem("Subcription", Icons.tv),
              _buildMenuItem("Settings", Icons.settings, isSettings: true),
              _buildMenuItem("My Wishlist", Icons.favorite_border),
              _buildMenuItem("My Rewards", Icons.card_giftcard),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
      bottomNavigationBar: _buildBottomNav(),
    );
  }

  Widget _buildProfileHeader() {
    return Column(
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.orange.shade200,
              ),
              child: const Icon(Icons.person, size: 60, color: Colors.white),
            ),
             Positioned(
              right: 0,
              bottom: 0,
              child: Container(
                padding: const EdgeInsets.all(4),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.edit, size: 16, color: Colors.grey),
              ),
            ),
          ],
        ),
        const SizedBox(height: 15),
        const Text(
          "Prasad Dighe",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        const Text(
          "prasaddighe@gmail.com",
          style: TextStyle(color: Colors.grey, fontSize: 14),
        ),
      ],
    );
  }

  Widget _buildTopAction(String label, IconData icon, Color color) {
    return Column(
      children: [
        Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            color: color.withOpacity(0.1),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Icon(icon, color: color, size: 30),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
        ),
      ],
    );
  }

  Widget _buildMenuItem(String title, IconData icon, {bool isSettings = false}) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: const Color(0xFFF2FAFF),
        borderRadius: BorderRadius.circular(15),
      ),
      child: ListTile(
        leading: Icon(icon, color: Colors.blue, size: 24),
        title: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
        ),
        trailing: const Icon(Icons.arrow_forward_ios, size: 14, color: Colors.grey),
        onTap: () {
          if (isSettings) {
             Get.to(() => const HelpCenterScreen());
          }
        },
      ),
    );
  }

  Widget _buildBottomNav() {
    final items = [
      Icons.home_rounded,
      Icons.storefront_outlined,
      Icons.grid_view_rounded,
      Icons.shopping_cart_outlined,
      Icons.menu_rounded,
    ];

    return Container(
      height: 68,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 20,
            offset: const Offset(0, -4),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(items.length, (index) {
          final isSelected = index == 4;
          return Icon(
            items[index],
            color: isSelected ? const Color(0xFF4CAF50) : Colors.grey[400],
            size: 26,
          );
        }),
      ),
    );
  }
}
