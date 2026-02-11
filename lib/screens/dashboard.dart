import 'package:flutter/material.dart';
import 'package:instabuild/widgets/customappbar.dart';
import 'package:provider/provider.dart';
import '../providers/cart_provider.dart';
import '../models/category.dart';
import '../widgets/product_image.dart';
import 'product_list_screen.dart';
import 'cart_screen.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    final categories = CartProvider.getCategories();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppbar(title: 'InstaBuild'),
      // appBar: AppBar(
      //   title: const Text('InstaBuild'),
      //   backgroundColor: Colors.blue.shade700,
      //   foregroundColor: Colors.white,
      //   actions: [
      //     Stack(
      //       clipBehavior: Clip.none,
      //       children: [
      //         IconButton(
      //           icon: const Icon(Icons.shopping_cart),
      //           onPressed: () {
      //             Navigator.push(
      //               context,
      //               MaterialPageRoute(builder: (context) => const CartScreen()),
      //             );
      //           },
      //         ),
      //         Consumer<CartProvider>(
      //           builder: (context, cart, child) {
      //             if (cart.itemCount == 0) return const SizedBox();
      //             return Positioned(
      //               right: 4,
      //               top: 4,
      //               child: Container(
      //                 padding: const EdgeInsets.all(4),
      //                 decoration: BoxDecoration(
      //                   color: Colors.red,
      //                   borderRadius: BorderRadius.circular(10),
      //                 ),
      //                 constraints: const BoxConstraints(
      //                   minWidth: 18,
      //                   minHeight: 18,
      //                 ),
      //                 child: Text(
      //                   '${cart.itemCount}',
      //                   style: const TextStyle(
      //                     color: Colors.white,
      //                     fontSize: 10,
      //                     fontWeight: FontWeight.bold,
      //                   ),
      //                   textAlign: TextAlign.center,
      //                 ),
      //               ),
      //             );
      //           },
      //         ),
      //       ],
      //     ),
      //   ],
      // ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Categories',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              'Browse our wide selection of building materials',
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1.0,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                ),
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  final category = categories[index];
                  return CategoryCard(category: category);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  final Category category;

  const CategoryCard({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductListScreen(category: category),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Color(0xFF1E88E5), width: 1),
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.3),
              blurRadius: 0,
              offset: const Offset(0, 1),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ProductImage(
              imagePath: category.icon,
              width: 160,
              height: 100,
              fallbackIcon: Icons.category,
            ),
            const SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                category.name,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
