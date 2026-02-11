import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:instabuild/providers/cart_provider.dart';
import 'package:instabuild/screens/cart_screen.dart';
import 'package:instabuild/widgets/customtext.dart';
import 'package:provider/provider.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final List<Widget>? actions;
  final String? userPhone;
  const CustomAppbar({
    super.key,
    required this.title,
    this.actions,
    this.userPhone,
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        bottomLeft: Radius.circular(25),
        bottomRight: Radius.circular(25),
      ),
      child: AppBar(
        title: CustomText(
          text: title,
          fontSize: 17,
          fontWeight: FontWeight.w600,
          textcolor: Color(0xFF1E88E5),
        ),
        centerTitle: true,
        backgroundColor: Color(0xFFE1F5FE),
        surfaceTintColor: Colors.white,
        elevation: 4.0,
        leadingWidth: 50,
        leading: Padding(
          padding: const EdgeInsets.only(left: 12),
          child: Image.asset(
            'assets/images/logo/instabuild.jpeg',
            fit: BoxFit.contain,
          ),
        ),
        actions:
            actions ??
            [
              Stack(
                clipBehavior: Clip.none,
                children: [
                  IconButton(
                    padding: EdgeInsets.zero,
                    visualDensity: VisualDensity.compact,
                    splashRadius: 20,
                    icon: const Icon(
                      Icons.shopping_cart_outlined,
                      color: Color(0xFF1E88E5),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const CartScreen(),
                        ),
                      );
                    },
                  ),
                  Consumer<CartProvider>(
                    builder: (context, cart, child) {
                      if (cart.itemCount == 0) return const SizedBox();
                      return Positioned(
                        right: 4,
                        top: 4,
                        child: Container(
                          padding: const EdgeInsets.all(4),
                          decoration: BoxDecoration(
                            color: Color(0xFF1E88E5),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          constraints: const BoxConstraints(
                            minWidth: 18,
                            minHeight: 10,
                          ),
                          child: Text(
                            '${cart.itemCount}',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 8,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),

              const SizedBox(width: 10),
            ],
      ),
    );
  }
}

class NewAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final List<Widget>? actions;

  const NewAppBar({super.key, required this.title, this.actions});
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        bottomLeft: Radius.circular(25),
        bottomRight: Radius.circular(25),
      ),
      child: AppBar(
        title: CustomText(
          text: title,
          fontSize: 17,
          fontWeight: FontWeight.w600,
          textcolor: Color(0xFF1E88E5),
        ),
        centerTitle: true,
        backgroundColor: Color(0xFFE1F5FE),
        surfaceTintColor: Colors.white,
        elevation: 4.0,
        leadingWidth: 50,
        leading: Padding(
          padding: const EdgeInsets.only(left: 12),
          child: Image.asset('assets/images/logo.png', fit: BoxFit.contain),
        ),
        actions:
            actions ??
            [
              IconButton(
                padding: EdgeInsets.zero,
                visualDensity: VisualDensity.compact,
                splashRadius: 18,
                icon: const Icon(
                  Icons.power_settings_new,
                  color: Color(0xFF1E88E5),
                ),
                onPressed: () {
                  showCupertinoDialog(
                    context: context,
                    builder: (_) => CupertinoTheme(
                      data: CupertinoThemeData(
                        brightness: Brightness.light,
                        primaryColor: Colors.grey,
                      ),
                      child: CupertinoAlertDialog(
                        title: const Text(
                          "Logout",
                          style: TextStyle(color: Colors.black),
                        ),
                        content: Text(
                          "Are you sure you want to Logout?",
                          style: TextStyle(color: Colors.black),
                        ),
                        actions: [
                          CupertinoDialogAction(
                            onPressed: () => Navigator.pop(context),
                            child: Text(
                              "Cancel",
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                          CupertinoDialogAction(
                            isDestructiveAction: true,
                            onPressed: () {},
                            child: const Text(
                              "Logout",
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),

              const SizedBox(width: 10),
            ],
      ),
    );
  }
}

class notificationManager {
  static List<Map<String, dynamic>> cartItems = [];

  static ValueNotifier<int> cartCount = ValueNotifier<int>(4);
}
