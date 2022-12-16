import 'package:flutter/material.dart';
import 'package:fruiterer/product/home/home_view.dart';
import 'package:hive_flutter/hive_flutter.dart';

Future<void> main() async {
  await Hive.initFlutter();
  runApp(const FruitererApp());
}

class FruitererApp extends StatelessWidget {
  const FruitererApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fruiterer',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: const Color(0xffEE2A34),
        ),
      ),
      home: const HomeView(),
    );
  }
}
