void main() {
  List<int> nombres = [25, 42, 79, 12];

  nombres.sort((a, b) => b.compareTo(a));
  List<int> doubles = nombres.map((e) => e * 2).toList();
  List<int> pairs = doubles.where((e) => e % 2 == 0).toList();

  print('Résultat final : $pairs');
}
