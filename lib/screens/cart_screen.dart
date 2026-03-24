import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'payment_screen.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});
  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
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
          "My Cart",
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
              _buildCartItem(
                "Toned Milk",
                "Blue Pocket Milk",
                49,
                4.5,
                const Color(0xFFE3F2FD),
                "🥛",
              ),
              const SizedBox(height: 15),
              _buildCartItem(
                "Double Toned",
                "Red Pocket Milk",
                40,
                4.5,
                const Color(0xFFFCE4EC),
                "🍼",
              ),
              const SizedBox(height: 30),
              Center(
                child: TextButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.add_circle_outline, color: Color(0xFF21AFFF)),
                  label: const Text(
                    "Add More Item",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              const Divider(thickness: 1),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                   const Text(
                    "Apply coupon",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      "Select",
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                ],
              ),
              const Divider(thickness: 1),
              const SizedBox(height: 20),
              const Text(
                "Order Details",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 15),
              _buildOrderDetailRow("Cart total", "89"),
              _buildOrderDetailRow("Cart saving", "-4.00", isSaving: true),
              _buildOrderDetailRow("Saving coupon", "Apply coupon", isAction: true),
              const SizedBox(height: 20),
              const Divider(thickness: 1, height: 1),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        "Total amount",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        "₹85",
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w900,
                          color: Color(0xFF37448B),
                        ),
                      ),
                    ],
                  ),
                  ElevatedButton(
                    onPressed: () => Get.to(() => const PaymentScreen()),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFD4FF8F),
                      foregroundColor: Colors.black,
                      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      elevation: 0,
                    ),
                    child: const Text(
                      "comform",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
      bottomNavigationBar: _buildBottomNav(),
    );
  }

  Widget _buildCartItem(String title, String subtitle, int price, double rating, Color bgColor, String emoji) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFFF2FAFF),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              color: bgColor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: Text(emoji, style: const TextStyle(fontSize: 30)),
            ),
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                   Text(
                      title,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      "₹$price",
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    Text(
                      "$rating",
                      style: const TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                    const Icon(Icons.star, color: Colors.amber, size: 14),
                  ],
                ),
                Text(
                  subtitle,
                  style: const TextStyle(fontSize: 12, color: Colors.grey),
                ),
              ],
            ),
          ),
          const SizedBox(width: 15),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Colors.grey.shade300),
            ),
            child: Row(
              children: const [
                Text("-", style: TextStyle(fontWeight: FontWeight.bold)),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text("1", style: TextStyle(fontWeight: FontWeight.bold)),
                ),
                Text("+", style: TextStyle(fontWeight: FontWeight.bold)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildOrderDetailRow(String label, String value, {bool isSaving = false, bool isAction = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: const TextStyle(color: Colors.grey, fontSize: 14),
          ),
          Text(
            isSaving ? "-₹$value" : (isAction ? value : "₹$value"),
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 14,
              color: isAction ? const Color(0xFF37448B) : Colors.black,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomNav() {
    final items = [
      Icons.home_rounded,
      Icons.storefront_outlined,
      Icons.grid_view_rounded,
      Icons.shopping_cart_rounded,
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
          final isSelected = index == 3;
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
