import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class CacheFunctions {
  test() async {
    await openBox();
    await addItem();
    await insertItem();
    getAllItems();
    getItem();
    await deleteItem();
    await clearItems();
  }

  Future<void> openBox() async {
    await Hive.openBox<String>('participant');
    debugPrint("✓ participant Box Opened: ${Hive.isBoxOpen('participant')}");
  }

  Future<void> addItem() async {
    Box<String> box = Hive.box<String>('participant');
    int id = await box.add('DevFest');
    debugPrint("✓ Added Item ID: $id");
  }

  Future<void> insertItem() async {
    Box<String> box = Hive.box<String>('participant');
    await box.put('izmir', 'GDG Izmir');
    debugPrint("✓ Inserted Item: izmir");
  }

  void getItem() {
    Box<String> box = Hive.box<String>('participant');
    String? item = box.get('izmir');
    debugPrint("✓ Get Item: $item");
  }

  void getAllItems() {
    Box<String> box = Hive.box<String>('participant');
    int count = box.values.length;
    debugPrint("✓ Get All Items Length: $count");
  }

  Future<void> deleteItem() async {
    Box<String> box = Hive.box<String>('participant');
    int previousItemCount = box.values.length;
    await box.delete('izmir');
    int newItemCount = box.values.length;
    debugPrint("✓ Deleted Item: ${previousItemCount - newItemCount}");
  }

  Future<void> clearItems() async {
    Box<String> box = Hive.box<String>('participant');
    await box.clear();
    int count = box.values.length;
    debugPrint("✓ All Items Length After Clear Items: $count");
  }
}
