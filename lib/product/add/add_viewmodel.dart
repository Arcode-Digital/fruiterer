import 'package:flutter/material.dart';

class AddViewmodel {
  List<String> get tasteItems => ['Taste', 'Sweet', 'Sour'];
  List<String> get colorItems => ['Color', 'Red', 'Yellow', 'Green'];

  add(BuildContext context, {required String color, required String taste, required int? gram}) {
    if (color != colorItems.first && taste != tasteItems.first && gram != null) {
      //TODO add => insert item to cache function
      Navigator.of(context).pop(true);
    } else {
      debugPrint("CHECK YOUR DATA");
    }
  }
}
