import 'package:flutter/material.dart';
import '../views/mobile/mobile_brands_view.dart';
import '../views/mobile/mobile_categories_view.dart';

class PopUpMenuBtn extends StatelessWidget {
  const PopUpMenuBtn({super.key});

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      padding: EdgeInsets.zero,
      icon: const Icon(
        Icons.more_vert,
        color: Colors.black,
      ),
      onSelected: (value) {
        if (value == 'Categories') {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const MobileCategoriesView(),
            ),
          );
        } else {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const MobileBrandsView(),
            ),
          );
        }
      },
      itemBuilder: (context) => <PopupMenuItem<String>>[
        const PopupMenuItem<String>(
          value: 'Categories',
          child: Text(
            'Categories',
            style: TextStyle(color: Colors.black),
          ),
        ),
        const PopupMenuItem<String>(
          value: 'Brands',
          child: Text(
            'Brands',
            style: TextStyle(color: Colors.black),
          ),
        ),
      ],
    );
  }
}
