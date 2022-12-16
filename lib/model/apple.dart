import 'package:fruiterer/core/cache/cache_enum.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../core/cache/cache_manager.dart';

part 'apple.g.dart';

@HiveType(typeId: 1)
class Apple {
  @HiveField(0)
  final String color;
  @HiveField(1)
  final int gram;
  @HiveField(2)
  final String taste;

  Apple({required this.color, required this.gram, required this.taste});

  static CacheEnum get boxEnum => CacheEnum.APPLE;
  static CacheManager<Apple> cacheManager = CacheManager<Apple>(boxEnum);

  static List<Apple> get mock => [
        Apple(color: 'red', gram: 50, taste: 'sweet'),
        Apple(color: 'green', gram: 70, taste: 'sour'),
      ];
}
