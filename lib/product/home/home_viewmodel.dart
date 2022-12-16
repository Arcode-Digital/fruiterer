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
    //TODO add => get data function
    items = Apple.mock;
  }

  update() {
    //TODO add => update data function
  }
}
