import 'package:hive_flutter/hive_flutter.dart';
import 'cache_enum.dart';
import 'cache_register.dart';

class CacheManager<T> {
  final CacheEnum boxEnum;
  CacheManager(this.boxEnum);

  Box<T>? box;

  Future<bool> openBox() async {
    CacheRegister.instance.modelRegister(boxEnum);
    if (!(box?.isOpen ?? false)) box = await Hive.openBox<T>(boxEnum.name);
    return box?.isOpen ?? false;
  }

  Future<void> addItem(T item) async {
    await box?.add(item);
    return;
  }

  Future<void> insertItem(dynamic key, T item) async {
    await box?.put(key, item);
    return;
  }

  List<T>? getAllItems() {
    return box?.values.toList();
  }

  T? getItem(dynamic key) {
    return box?.get(key);
  }

  void deleteItem(dynamic key) {
    box?.delete(key);
    return;
  }

  Future<void> clearItems() async {
    await box?.clear();
    return;
  }
}
