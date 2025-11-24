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
              decoration: const BoxDecoration(color: Color(0xFFF2F2F2)),
              child: Stack(
                children: [
                  // Banner image
                  Image.network(
                    'https://i.pinimg.com/736x/b8/57/75/b85775887cb8e7de4468f06a32292604.jpg',
                    width: double.infinity,

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
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),

            // Product grid
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: 6,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                // UBAH DARI 0.65 MENJADI 0.60 atau 0.55 agar kartu lebih panjang ke bawah
                childAspectRatio: 0.58,
              ),
              itemBuilder: (context, index) {
                return ProductCard(
                  imageUrl:
                      'https://i.pinimg.com/736x/6e/ea/43/6eea4384453b2312dbdd941acde3f6b8.jpg',
                  title: 'Baju Pria',
                  price: 'Rp ${(index + 1) * 10000}',
                  onCheckoutPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProductDetailPage(
                          productName: 'Baju Pria',
                          price: 'Rp ${(index + 1) * 10000}',
                          imageUrl:
                              'https://i.pinimg.com/736x/6e/ea/43/6eea4384453b2312dbdd941acde3f6b8.jpg',
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
