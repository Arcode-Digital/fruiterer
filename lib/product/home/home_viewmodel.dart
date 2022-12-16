import 'package:flutter/material.dart';
import 'package:fruiterer/model/apple.dart';
import 'package:fruiterer/product/add/add_view.dart';

import 'home_view.dart';

abstract class HomeViewmodel extends State<HomeView> {
  List<Apple> items = [];

  navigateAdd(BuildContext context) async {
    bool? res = await Navigator.of(context).push(MaterialPageRoute(builder: (context) => const AddView()));
    if (res ?? false) await update();
  }

  getItems() {
    items = Apple.cacheManager.getAllItems() ?? [];
  }

  update() {
    setState(() {
      items = Apple.cacheManager.getAllItems() ?? [];
    });
  }
}
