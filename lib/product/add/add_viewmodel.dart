import 'package:flutter/material.dart';
import 'package:fruiterer/model/apple.dart';

class AddViewmodel {
  List<String> get tasteItems => ['Taste', 'Sweet', 'Sour'];
  List<String> get colorItems => ['Color', 'Red', 'Yellow', 'Green'];

  Future<void> add(BuildContext context, {required String color, required String taste, required int? gram}) async {
    if (color != colorItems.first && taste != tasteItems.first && gram != null) {
      Apple item = Apple(color: color, gram: gram, taste: taste);
      Apple.cacheManager.addItem(item).then((value) {
        Navigator.of(context).pop(true);
      });
    } else {
      debugPrint("CHECK YOUR DATA");
    }
  }
}
