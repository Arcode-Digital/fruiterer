class Apple {
  final String color;
  final int gram;
  final String taste;

  Apple({required this.color, required this.gram, required this.taste});

  static List<Apple> get mock => [
        Apple(color: 'red', gram: 50, taste: 'sweet'),
        Apple(color: 'green', gram: 70, taste: 'sour'),
      ];
}
