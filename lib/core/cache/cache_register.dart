import 'cache_enum.dart';

class CacheRegister {
  static CacheRegister? _instance;
  static CacheRegister get instance {
    _instance ??= CacheRegister._init();
    return _instance!;
  }

  CacheRegister._init();

  modelRegister(CacheEnum boxEnum) {
    switch (boxEnum) {
      case CacheEnum.APPLE:
        break;
    }
  }
}
