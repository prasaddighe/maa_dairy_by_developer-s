import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:app/screens/profile_screen.dart';
import 'cart_screen.dart';

class Product {
  final String name;
  final String subtitle;
  final double price;
  final double rating;
  final String emoji;
  final Color bgColor;

  const Product({
    required this.name,
    required this.subtitle,
    required this.price,
    required this.rating,
    required this.emoji,
    required this.bgColor,
  });
}


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  final List<Product> products = const [
    Product(
      name: 'Toned',
      subtitle: 'Blue Pocket Milk',
      price: 49,
      rating: 4.5,
      emoji: '🥛',
      bgColor: Color(0xFFE3F2FD),
    ),
    Product(
      name: 'Double Toned',
      subtitle: 'Red Pocket Milk',
      price: 40,
      rating: 4.5,
      emoji: '🍼',
      bgColor: Color(0xFFFCE4EC),
    ),
    Product(
      name: 'Ghee',
      subtitle: 'Pure Desi Ghee',
      price: 90,
      rating: 4.5,
      emoji: '🧈',
      bgColor: Color(0xFFFFF9C4),
    ),
    Product(
      name: 'Kulfi',
      subtitle: 'Traditional Kulfi',
      price: 30,
      rating: 4.5,
      emoji: '🍦',
      bgColor: Color(0xFFF3E5F5),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildHeader(),
                    _buildSearchBar(),
                    _buildSubscriptionBanner(),
                    _buildCategorySection(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomNav(),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 16, 20, 8),
      child: Row(
        children: [
          const Icon(Icons.arrow_back_ios, size: 20, color: Colors.black87),
          const SizedBox(width: 8),
          Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: const Color(0xFFFFCC80),
              border: Border.all(color: Colors.white, width: 2),
              boxShadow: [
                BoxShadow(
                  color: Colors.orange.withOpacity(0.3),
                  blurRadius: 8,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: InkWell(
              onTap: () => Get.to(() => const ProfileScreen()),
              child: const ClipOval(
                child: Icon(Icons.person, color: Colors.white, size: 28),
              ),
            ),
          ),
          const SizedBox(width: 12),
          const Expanded(
            child: Text(
              'Hi prasad,',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
                letterSpacing: 0.2,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: const Color(0xFF4CAF50).withOpacity(0.12),
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Icon(Icons.wallet, color: Color(0xFF4CAF50), size: 22),
          ),
          const SizedBox(width: 10),
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: const Color(0xFF2196F3).withOpacity(0.12),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Stack(
              children: [
                const Icon(Icons.notifications_outlined,
                    color: Color(0xFF2196F3), size: 22),
                Positioned(
                  right: 0,
                  top: 0,
                  child: Container(
                    width: 8,
                    height: 8,
                    decoration: const BoxDecoration(
                      color: Colors.red,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }


  Widget _buildSearchBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      child: Row(
        children: [
          Expanded(
            child: Container(
              height: 48,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(14),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.06),
                    blurRadius: 12,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Row(
                children: [
                  const SizedBox(width: 14),
                  Icon(Icons.search, color: Colors.grey[400], size: 22),
                  const SizedBox(width: 10),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Search your product',
                        hintStyle:
                            TextStyle(color: Colors.grey[400], fontSize: 14),
                        border: InputBorder.none,
                        isDense: true,
                        contentPadding: EdgeInsets.zero,
                      ),
                    ),
                  ),
                  Icon(Icons.mic_none_rounded,
                      color: Colors.grey[400], size: 22),
                  const SizedBox(width: 14),
                ],
              ),
            ),
          ),
          const SizedBox(width: 12),
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: const Color(0xFF2196F3),
              borderRadius: BorderRadius.circular(14),
              boxShadow: [
                BoxShadow(
                  color: const Color(0xFF2196F3).withOpacity(0.35),
                  blurRadius: 12,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: const Icon(Icons.tune_rounded,
                color: Colors.white, size: 22),
          ),
        ],
      ),
    );
  }

  Widget _buildSubscriptionBanner() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 12, 20, 4),
      child: Container(
        height: 130,
        decoration: BoxDecoration(
          color: const Color(0xFFE8F5E9),
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.green.withOpacity(0.12),
              blurRadius: 16,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Stack(
          children: [
            Positioned(
              left: 22,
              top: 0,
              bottom: 0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Subsription',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '"Feel the joy\nof a mother"',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey[600],
                      fontStyle: FontStyle.italic,
                      height: 1.4,
                    ),
                  ),
                  const SizedBox(height: 14),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF4CAF50),
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 22, vertical: 10),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)),
                      elevation: 0,
                    ),
                    child: const Text(
                      'Buy Now',
                      style: TextStyle(
                          fontSize: 13, fontWeight: FontWeight.w600),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              right: 12,
              top: 8,
              bottom: 8,
              child: SizedBox(
                width: 130,
                child: Stack(
                  children: [
                    _emojiItem('🥛', const Offset(60, 10), 28),
                    _emojiItem('🧀', const Offset(90, 40), 22),
                    _emojiItem('🥚', const Offset(20, 50), 24),
                    _emojiItem('🍞', const Offset(65, 65), 26),
                    _emojiItem('🧈', const Offset(100, 70), 20),
                    _emojiItem('🍦', const Offset(30, 85), 22),
                    _emojiItem('🍰', const Offset(80, 95), 24),
                    _emojiItem('🥗', const Offset(10, 20), 20),
                    _emojiItem('🫐', const Offset(110, 10), 18),
                    _emojiItem('🍳', const Offset(45, 5), 20),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _emojiItem(String emoji, Offset offset, double size) {
    return Positioned(
      left: offset.dx,
      top: offset.dy,
      child: Text(emoji, style: TextStyle(fontSize: size)),
    );
  }


  Widget _buildCategorySection() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 16, 20, 20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Category',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              TextButton(
                onPressed: () {},
                child: const Text(
                  'See all',
                  style: TextStyle(
                    color: Color(0xFF4CAF50),
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 14,
              crossAxisSpacing: 14,
              childAspectRatio: 0.85,
            ),
            itemCount: products.length,
            itemBuilder: (context, index) {
              return _ProductCard(product: products[index]);
            },
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
          final isSelected = _selectedIndex == index;
          return GestureDetector(
            onTap: () {
              setState(() => _selectedIndex = index);
              if (index == 3) {
                 Get.to(() => const CartScreen());
              } else if (index == 4) {
                 Get.to(() => const ProfileScreen());
              }
            },
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              padding:
                  const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: isSelected
                    ? const Color(0xFF4CAF50).withOpacity(0.12)
                    : Colors.transparent,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(
                items[index],
                color:
                    isSelected ? const Color(0xFF4CAF50) : Colors.grey[400],
                size: 26,
              ),
            ),
          );
        }),
      ),
    );
  }
}


class _ProductCard extends StatefulWidget {
  final Product product;

  const _ProductCard({required this.product});

  @override
  State<_ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<_ProductCard> {
  String _selectedQty = '1L';

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 12,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: widget.product.bgColor,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Center(
                  child: Text(
                    widget.product.emoji,
                    style: const TextStyle(fontSize: 48),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.product.name,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                Text(
                  '₹${widget.product.price.toInt()}',
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 2),
            Row(
              children: [
                const Icon(Icons.star_rounded,
                    color: Color(0xFFFFC107), size: 16),
                const SizedBox(width: 3),
                Text(
                  widget.product.rating.toString(),
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey[600],
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 3),
            Text(
              widget.product.subtitle,
              style: TextStyle(fontSize: 11, color: Colors.grey[500]),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Container(
                  height: 30,
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey[200]!),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      value: _selectedQty,
                      isDense: true,
                      style: const TextStyle(
                          fontSize: 12, color: Colors.black87),
                      items: ['500ml', '1L', '2L']
                          .map((e) => DropdownMenuItem(
                              value: e, child: Text('Qty $e')))
                          .toList(),
                      onChanged: (v) =>
                          setState(() => _selectedQty = v ?? _selectedQty),
                    ),
                  ),
                ),
                const Spacer(),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    width: 32,
                    height: 32,
                    decoration: BoxDecoration(
                      color: const Color(0xFF4CAF50),
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0xFF4CAF50).withOpacity(0.35),
                          blurRadius: 8,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: const Icon(Icons.shopping_cart_outlined,
                        color: Colors.white, size: 16),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}