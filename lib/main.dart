import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:instabuild/splashscreen.dart';
import 'providers/cart_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CartProvider(),
      child: MaterialApp(
        title: 'InstaBuild',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Color(0xFF1E88E5)),
          useMaterial3: true,
        ),
        home: const Splashscreen(),
      ),
    );
  }
}
