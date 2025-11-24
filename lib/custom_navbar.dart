import 'package:flutter/material.dart';

class CustomNavbar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const CustomNavbar({Key? key, this.title = 'MOVR'}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      leading: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: const Text(
          'MOVR',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ),
      title: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: TextField(
          decoration: InputDecoration(
            hintText: 'Search...',
            filled: true,
            fillColor: const Color(0xFFF2F2F2),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide.none,
            ),
            prefixIcon: const Icon(
              Icons.search,
              color: Colors.grey,
            ),
            contentPadding: const EdgeInsets.symmetric(vertical: 8),
          ),
        ),
      ),
      centerTitle: true,
      actions: [
        // Cart icon
        IconButton(
          icon: const Icon(
            Icons.shopping_cart,
            color: Colors.black,
          ),
          onPressed: () {
            // Navigate to cart page
          },
        ),
        // User icon
        Padding(
          padding: const EdgeInsets.only(right: 16),
          child: IconButton(
            icon: const Icon(
              Icons.person,
              color: Colors.black,
            ),
            onPressed: () {
              // Navigate to profile page
            },
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);
}