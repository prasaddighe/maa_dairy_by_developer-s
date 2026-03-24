// ignore_for_file: unused_field
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'cart_screen.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});
  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  int _currentImageIndex = 0;
  bool _isWishlisted = false;
  int _quantity = 1;
  final List<String> _images = [
    '../../assets/toned.png',
    '../../assets/toned.png',
    '../../assets/toned.png',
  ];

  void _prevImage() {
    setState(() {
      _currentImageIndex =
          (_currentImageIndex - 1 + _images.length) % _images.length;
    });
  }

  void _nextImage() {
    setState(() {
      _currentImageIndex = (_currentImageIndex + 1) % _images.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(242, 250, 255, 1),
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              child: Align(
                alignment: Alignment.topLeft,
                child: GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: const [
                      Icon(Icons.arrow_back_ios, size: 14, color: Colors.black),
                      SizedBox(width: 4),
                      Text(
                        "Product Screen",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.only(bottom: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Container(
                        height: 220,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(20),
                              child: Image.asset(
                                _images[_currentImageIndex],
                                fit: BoxFit.contain,
                                errorBuilder: (_, __, ___) => const Center(
                                  child: Text(
                                    "🥛",
                                    style: TextStyle(fontSize: 80),
                                  ),
                                ),
                              ),
                            ),

                            Positioned(
                              left: 12,
                              child: GestureDetector(
                                onTap: _prevImage,
                                child: Container(
                                  width: 36,
                                  height: 36,
                                  decoration: BoxDecoration(
                                    color: const Color.fromRGBO(212, 255, 143, 1),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: const Icon(
                                    Icons.chevron_left_rounded,
                                    color: Color.fromRGBO(78, 67, 46, 1),
                                    size: 24,
                                  ),
                                ),
                              ),
                            ),

                            Positioned(
                              right: 12,
                              child: GestureDetector(
                                onTap: _nextImage,
                                child: Container(
                                  width: 36,
                                  height: 36,
                                  decoration: BoxDecoration(
                                    color: const Color.fromRGBO(212, 255, 143, 1),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: const Icon(
                                    Icons.chevron_right_rounded,
                                    color: Color.fromRGBO(78, 67, 46, 1),
                                    size: 24,
                                  ),
                                ),
                              ),
                            ),

                            Positioned(
                              bottom: 12,
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: List.generate(
                                  _images.length,
                                  (i) => AnimatedContainer(
                                    duration: const Duration(milliseconds: 250),
                                    margin: const EdgeInsets.symmetric(
                                      horizontal: 3,
                                    ),
                                    width: i == _currentImageIndex ? 18 : 7,
                                    height: 7,
                                    decoration: BoxDecoration(
                                      color: i == _currentImageIndex
                                          ? const Color.fromRGBO(120, 107, 81, 1, )
                                          : Colors.grey.shade300,
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "Toned",
                                    style: TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.w800,
                                      color: Colors.black,
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Row(
                                    children: [
                                      ...List.generate(
                                        5,
                                        (i) => Icon(
                                          i < 4 ? Icons.star_rounded : Icons.star_half_rounded,
                                          size: 15,
                                          color: const Color(0xFFFFC107),
                                        ),
                                      ),
                                      const SizedBox(width: 5),
                                      const Text(
                                        "4.5",
                                        style: TextStyle(
                                          fontSize: 13,
                                          color: Colors.grey,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),

                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Row(
                                    children: const [
                                      Text(
                                        "₹",
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.black,
                                        ),
                                      ),
                                      Text(
                                        "40",
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w800,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 3,
                                    ),
                                    child: const Text(
                                      "20% Offer",
                                      style: TextStyle(
                                        fontSize: 11,
                                        fontWeight: FontWeight.w700,
                                        color: Color.fromRGBO(78, 67, 46, 1),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          const Text(
                            "Blue Pocket  Milk",
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                              color: Colors.black87,
                            ),
                          ),
                          const SizedBox(height: 16),
                          Divider(color: Colors.grey.shade200, thickness: 1),
                          const SizedBox(height: 10),
                          const Text(
                            "Description",
                            style: TextStyle(
                              fontSize: 16, 
                              fontWeight: FontWeight.w800,
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(height: 8),
                          const Text(
                            "Toned milk is a dairy product made by adding skim milk to full-cream bufalo milk to reduce its fat content, maintain its nutritional value, and increase the total quantity and availability of milk.",
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w400,
                              color: Colors.black54,
                              height: 1.6,
                            ),
                          ),
                          const SizedBox(height: 24),
                          Row(
                            children: [
                              GestureDetector(
                                onTap: () => setState(
                                  () => _isWishlisted = !_isWishlisted,
                                ),
                                child: Container(
                                  width: 46,
                                  height: 46,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(12),
                                    border: Border.all(
                                      color: Colors.black12,
                                      width: 1,
                                    ),
                                  ),
                                  child: Icon(
                                    _isWishlisted
                                        ? Icons.favorite_rounded
                                        : Icons.favorite_border_rounded,
                                    color: _isWishlisted
                                        ? Colors.red
                                        : Colors.black54,
                                    size: 22,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 10),
                              Container(
                                width: 46,
                                height: 46,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(12),
                                  border: Border.all(
                                    color: Colors.black12,
                                    width: 1,
                                  ),
                                ),
                                child: const Icon(
                                  Icons.share_rounded,
                                  color: Color.fromRGBO(94, 197, 255, 1),
                                  size: 22,
                                ),
                              ),
                              const SizedBox(width: 10),
                              Expanded(
                                child: SizedBox(
                                  height: 46,
                                  child: ElevatedButton.icon(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: const Color.fromRGBO(220, 243, 255, 1),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      elevation: 0,
                                    ),
                                    onPressed: () {
                                      Get.to(() => const CartScreen());
                                    },
                                    icon: const Icon(
                                      Icons.add_circle_outline_rounded,
                                      color: Color.fromARGB(255, 24, 173, 166),
                                      size: 20,
                                    ),
                                    label: const Text(
                                      "Add To Cart",
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w800,
                                        color: Color.fromRGBO(55, 68, 139, 1),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
