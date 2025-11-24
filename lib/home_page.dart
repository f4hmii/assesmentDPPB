import 'package:flutter/material.dart';
import 'custom_navbar.dart';
import 'product_card.dart';
import 'product_detail_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: CustomNavbar(title: 'MOVR'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Hero Section
            Container(
              height: 250,
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Color(0xFFF2F2F2),
              ),
              child: Stack(
                children: [
                  // Banner image
                  Image.network(
                    'https://i.pinimg.com/736x/b8/57/75/b85775887cb8e7de4468f06a32292604.jpg',
                    width: double.infinity,
                    height: 850,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) => Container(
                      width: double.infinity,
                      height: 250,
                      color: const Color(0xFFF2F2F2),
                      child: const Icon(
                        Icons.image_not_supported_outlined,
                        size: 50,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  // Overlay text
                  Container(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Welcome to MOVR',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Shop the latest products',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white.withOpacity(0.9),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // Section title
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              alignment: Alignment.centerLeft,
              child: const Text(
                'Featured Products',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            // Product grid
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: 6, // Show 6 placeholder products
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                childAspectRatio: 0.8,
              ),
              itemBuilder: (context, index) {
                return ProductCard(
                  imageUrl: 'https://picsum.photos/150',
                  title: 'Product Name $index',
                  price: '\$${(index + 1) * 10}.00',
                  onCheckoutPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProductDetailPage(
                          productName: 'Product Name $index',
                          price: '\$${(index + 1) * 10}.00',
                          imageUrl: 'https://picsum.photos/150',
                        ),
                      ),
                    );
                  },
                );
              },
            ),

            // Add some padding at the bottom
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}