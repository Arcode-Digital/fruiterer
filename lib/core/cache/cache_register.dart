import 'package:hive_flutter/hive_flutter.dart';
import '../../model/apple.dart';
import 'cache_enum.dart';

class CacheRegister {
 static CacheRegister? _instance;
  static CacheRegister get instance{
    _instance ??= CacheRegister._init();
    return _instance!;
  }
  CacheRegister._init();



  modelRegister(CacheEnum boxEnum) {
    switch (boxEnum) {
      case CacheEnum.APPLE:
        if (!Hive.isAdapterRegistered(CacheEnum.APPLE.typeId)) {
          Hive.registerAdapter(AppleAdapter());
        }
        return;
    }
  }
}
