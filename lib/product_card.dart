import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String price;
  final VoidCallback? onCheckoutPressed;  // Callback for checkout button

  const ProductCard({
    Key? key,
    required this.imageUrl,
    required this.title,
    required this.price,
    this.onCheckoutPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.all(8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Product image
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(8)),
            child: Image.network(
              imageUrl,
              height: 150,
              width: double.infinity,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) => Container(
                height: 150,
                width: double.infinity,
                color: const Color(0xFFF2F2F2),
                child: const Icon(
                  Icons.image_not_supported_outlined,
                  size: 40,
                  color: Colors.grey,
                ),
              ),
            ),
          ),
          // Product title
          Padding(
            padding: const EdgeInsets.all(8),
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          // Product price
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            child: Text(
              price,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
          // Buttons container
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // Cart button
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: () {
                      // Add to cart functionality
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('$title added to cart'),
                          duration: Duration(seconds: 1),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey[300],
                      foregroundColor: Colors.black,
                      padding: EdgeInsets.symmetric(vertical: 6),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6),
                      ),
                    ),
                    icon: Icon(
                      Icons.shopping_cart,
                      size: 16,
                    ),
                    label: Text(
                      'Cart',
                      style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
                SizedBox(width: 8),
                // Checkout button
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: () {
                      if (onCheckoutPressed != null) {
                        onCheckoutPressed!();
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      foregroundColor: Colors.white,
                      padding: EdgeInsets.symmetric(vertical: 6),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6),
                      ),
                    ),
                    icon: Icon(
                      Icons.check,
                      size: 16,
                    ),
                    label: Text(
                      'Buy',
                      style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
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
}