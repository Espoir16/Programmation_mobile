// ignore_for_file: constant_identifier_names
class Product {
  final String barcode;
  final String? name;
  final String? altName;
  final String? picture;
  final String? quantity;
  final List<String>? brands;
  final List<String>? manufacturingCountries;
  final ProductNutriScore? nutriScore;
  final ProductNutriScoreLevels? nutriScoreLevels;
  final ProductNovaScore? novaScore;
  final ProductGreenScore? greenScore;
  final List<String>? ingredients;

  // Eg: "Sucre, <span class=\"allergen\">gluten de blé</span>"
  final String? ingredientsWithAllergens;
  final List<String>? traces;
  final List<String>? allergens;
  final Map<String, String>? additives;
  final NutrientLevels? nutrientLevels;
  final NutritionFacts? nutritionFacts;
  final bool? ingredientsFromPalmOil;
  final ProductAnalysis? containsPalmOil;
  final ProductAnalysis? isVegan;
  final ProductAnalysis? isVegetarian;

  Product({
    required this.barcode,
    this.name,
    this.altName,
    this.picture,
    this.quantity,
    this.brands,
    this.manufacturingCountries,
    this.nutriScore,
    this.nutriScoreLevels,
    this.novaScore,
    this.greenScore,
    this.ingredients,
    this.ingredientsWithAllergens,
    this.traces,
    this.allergens,
    this.additives,
    this.nutrientLevels,
    this.nutritionFacts,
    this.ingredientsFromPalmOil,
    this.containsPalmOil,
    this.isVegan,
    this.isVegetarian,
  });
}

class NutritionFacts {
  final String servingSize;
  final Nutriment? calories;
  final Nutriment? fat;
  final Nutriment? saturatedFat;
  final Nutriment? carbohydrate;
  final Nutriment? sugar;
  final Nutriment? fiber;
  final Nutriment? proteins;
  final Nutriment? sodium;
  final Nutriment? salt;
  final Nutriment? energy;

  NutritionFacts({
    required this.servingSize,
    this.calories,
    this.fat,
    this.saturatedFat,
    this.carbohydrate,
    this.sugar,
    this.fiber,
    this.proteins,
    this.sodium,
    this.salt,
    this.energy,
  });
}

class Nutriment {
  final String unit;
  final dynamic perServing;
  final dynamic per100g;

  Nutriment({required this.unit, this.perServing, this.per100g});
}

class NutrientLevels {
  final String? salt;
  final String? saturatedFat;
  final String? sugars;
  final String? fat;

  NutrientLevels({this.salt, this.saturatedFat, this.sugars, this.fat});
}

class ProductNutriScoreLevels {
  final ProductNutriScoreLevel? energy;
  final ProductNutriScoreLevel? fiber;
  final ProductNutriScoreLevel? fruitsVegetablesLegumes;
  final ProductNutriScoreLevel? proteins;
  final ProductNutriScoreLevel? salt;
  final ProductNutriScoreLevel? saturatedFat;
  final ProductNutriScoreLevel? sugars;

  ProductNutriScoreLevels({
    required this.energy,
    required this.fiber,
    required this.fruitsVegetablesLegumes,
    required this.proteins,
    required this.salt,
    required this.saturatedFat,
    required this.sugars,
  });
}

class ProductNutriScoreLevel {
  final double points;
  final double maxPoints;
  final String unit;
  final double value;
  final ProductNutriScoreLevelType type;

  ProductNutriScoreLevel({
    required this.points,
    required this.maxPoints,
    required this.unit,
    required this.value,
    required this.type,
  });
}

enum ProductNutriScoreLevelType { positive, negative, unknown }

enum ProductNutriScore { A, B, C, D, E, unknown }

enum ProductNovaScore { group1, group2, group3, group4, unknown }

enum ProductGreenScore { A, APlus, B, C, D, E, F, unknown }

enum ProductAnalysis {
  yes,
  no,
  maybe;

  static ProductAnalysis fromString(String? analysis) {
    return switch (analysis) {
      'yes' => ProductAnalysis.yes,
      'no' => ProductAnalysis.no,
      'maybe' => ProductAnalysis.maybe,
      _ => ProductAnalysis.maybe,
    };
  }
}

Product generateProduct() => Product(
  barcode: '1234567890',
  name: 'Nutella',
  altName: 'Product Alt Name',
  picture:
      'https://images.openfoodfacts.org/images/products/301/762/042/5035/front_fr.533.400.jpg',
  quantity: '200g',
  brands: ['Ferrero', 'Ferrero'],
  manufacturingCountries: ['France', 'Italie'],
  nutriScore: ProductNutriScore.E,
  novaScore: ProductNovaScore.group4,
  greenScore: ProductGreenScore.D,
  ingredients: [
    'Sucre',
    'sirop de glucose',
    '_lait_ écrémé',
    'crème légère (_lait_)',
    'eau',
    'beurre de cacao',
    'matière grasse de noix de coco',
    '_lait_ écrémé concentré sucré',
    'pâte de cacao',
    'farine de _blé_',
    'matière grasse de palme',
    '_lait_ écrémé en poudre',
    '_lactose_',
    'matière grasse du _lait_',
    'huile de palmiste',
    'petit-_lait_ en poudre',
    'cacao maigre',
    'beurre (_lait_)',
    'émulsifiants (lécithine de _soja_, E471, tristéarate de sorbitane)',
    '_lait_ entier en poudre',
    'stabilisants (E407, E410, E412)',
    'arômes naturels (_lait_)',
    'sel',
    'colorant naturel (caramel ordinaire)',
    'cacao en poudre',
    'poudre à lever (E503)',
    'extrait naturel de vanille',
  ],
  ingredientsWithAllergens:
      'Sucre, sirop de glucose, <span class=\"allergen\">lait</span> écrémé, crème légère (<span class=\"allergen\">lait</span>), eau, beurre de cacao, matière grasse de noix de coco, <span class=\"allergen\">lait</span> écrémé concentré sucré, pâte de cacao, farine de <span class=\"allergen\">blé</span>, matière grasse de palme, <span class=\"allergen\">lait</span> écrémé en poudre, <span class=\"allergen\">lactose</span>, matière grasse du <span class=\"allergen\">lait</span>, huile de palmiste, petit-<span class=\"allergen\">lait</span> en poudre, cacao maigre, <span class=\"allergen\">beurre</span> (<span class=\"allergen\">lait</span>), émulsifiants (lécithine de <span class=\"allergen\">soja</span>, E471, tristéarate de sorbitane), <span class=\"allergen\">lait</span> entier en poudre, stabilisants (E407, E410, E412), arômes naturels (<span class=\"allergen\">lait</span>), sel, colorant naturel (caramel ordinaire), cacao en poudre, poudre à lever (E503), extrait naturel de vanille. (Peut contenir<span class=\"allergen\">: cacahuète</span>, <span class=\"allergen\">noisette</span>, <span class=\"allergen\">amande</span>).',
  traces: ['cacahuète', 'noisette', 'amande'],
  allergens: ['lait', 'soja', 'beurre'],
  additives: {'e322i': 'Description', 'e471': 'Description'},
  nutriScoreLevels: ProductNutriScoreLevels(
    energy: ProductNutriScoreLevel(
      points: 3,
      maxPoints: 10,
      unit: 'kJ',
      value: 1180,
      type: ProductNutriScoreLevelType.negative,
    ),
    saturatedFat: ProductNutriScoreLevel(
      points: 9,
      maxPoints: 10,
      unit: 'g',
      value: 9.05,
      type: ProductNutriScoreLevelType.negative,
    ),
    sugars: ProductNutriScoreLevel(
      points: 7,
      maxPoints: 15,
      unit: 'g',
      value: 25.5,
      type: ProductNutriScoreLevelType.negative,
    ),
    proteins: ProductNutriScoreLevel(
      points: 1,
      maxPoints: 7,
      unit: 'g',
      value: 3.5,
      type: ProductNutriScoreLevelType.positive,
    ),
    fiber: ProductNutriScoreLevel(
      points: 0,
      maxPoints: 5,
      unit: 'g',
      value: 0,
      type: ProductNutriScoreLevelType.unknown,
    ),
    salt: ProductNutriScoreLevel(
      points: 1,
      maxPoints: 20,
      unit: 'g',
      value: 0,
      type: ProductNutriScoreLevelType.positive,
    ),
    fruitsVegetablesLegumes: ProductNutriScoreLevel(
      points: 0,
      maxPoints: 5,
      unit: '%',
      value: 0,
      type: ProductNutriScoreLevelType.positive,
    ),
  ),
  nutrientLevels: NutrientLevels(
    salt: 'Low',
    saturatedFat: 'Low',
    sugars: 'Low',
    fat: 'Low',
  ),
  nutritionFacts: NutritionFacts(
    servingSize: '100g',
    calories: Nutriment(unit: 'kcal', perServing: 100, per100g: 100),
    fat: Nutriment(unit: 'g', perServing: 10, per100g: 10),
    saturatedFat: Nutriment(unit: 'g', perServing: 5, per100g: 5),
    carbohydrate: Nutriment(unit: 'g', perServing: 20, per100g: 20),
    sugar: Nutriment(unit: 'g', perServing: 10, per100g: 10),
    fiber: Nutriment(unit: 'g', perServing: 5, per100g: 5),
    proteins: Nutriment(unit: 'g', perServing: 10, per100g: 10),
    sodium: Nutriment(unit: 'mg', perServing: 100, per100g: 100),
    salt: Nutriment(unit: 'g', perServing: 0.1, per100g: 0.1),
  ),
);


ProductNutriScore _parseNutriScore(String? v) {
  switch (v?.toUpperCase()) {
    case 'A':
      return ProductNutriScore.A;
    case 'B':
      return ProductNutriScore.B;
    case 'C':
      return ProductNutriScore.C;
    case 'D':
      return ProductNutriScore.D;
    case 'E':
      return ProductNutriScore.E;
    default:
      return ProductNutriScore.unknown;
  }
}

ProductNovaScore _parseNovaScore(dynamic v) {
  final s = v?.toString();
  switch (s) {
    case '1':
      return ProductNovaScore.group1;
    case '2':
      return ProductNovaScore.group2;
    case '3':
      return ProductNovaScore.group3;
    case '4':
      return ProductNovaScore.group4;
    default:
      return ProductNovaScore.unknown;
  }
}

ProductGreenScore _parseGreenScore(String? v) {
  switch (v?.toUpperCase()) {
    case 'A+':
      return ProductGreenScore.APlus;
    case 'A':
      return ProductGreenScore.A;
    case 'B':
      return ProductGreenScore.B;
    case 'C':
      return ProductGreenScore.C;
    case 'D':
      return ProductGreenScore.D;
    case 'E':
      return ProductGreenScore.E;
    case 'F':
      return ProductGreenScore.F;
    default:
      return ProductGreenScore.unknown;
  }
}

List<String>? _splitCsv(String? v) {
  if (v == null) return null;
  final list = v
      .split(',')
      .map((e) => e.trim())
      .where((e) => e.isNotEmpty)
      .toList();
  return list.isEmpty ? null : list;
}

List<String>? _listString(dynamic v) {
  if (v is List) {
    final list = v.whereType<String>().toList();
    return list.isEmpty ? null : list;
  }
  return null;
}

Map<String, String>? _mapStringString(dynamic v) {
  if (v is Map) {
    final out = <String, String>{};
    v.forEach((k, val) {
      if (k != null && val != null) out[k.toString()] = val.toString();
    });
    return out.isEmpty ? null : out;
  }
  return null;
}

NutrientLevels? _parseNutrientLevels(dynamic json) {
  if (json is! Map) return null;
  return NutrientLevels(
    salt: json['salt']?.toString(),
    saturatedFat: json['saturated-fat']?.toString() ?? json['saturated_fat']?.toString(),
    sugars: json['sugars']?.toString(),
    fat: json['fat']?.toString(),
  );
}

Nutriment? _parseNutriment(dynamic unit, dynamic perServing, dynamic per100g) {
  if (unit == null && perServing == null && per100g == null) return null;
  return Nutriment(
    unit: unit?.toString() ?? '',
    perServing: perServing,
    per100g: per100g,
  );
}

NutritionFacts? _parseNutritionFacts(Map<String, dynamic> p) {
  final serving = p['serving_size']?.toString();
  final nutriments = p['nutriments'];
  if (serving == null || nutriments is! Map) return null;

  dynamic n(String key) => nutriments[key];
  dynamic u(String key) => nutriments['${key}_unit'];
  dynamic s(String key) => nutriments['${key}_serving'];
  dynamic g(String key) => nutriments['${key}_100g'];

  return NutritionFacts(
    servingSize: serving,
    calories: _parseNutriment(u('energy-kcal'), s('energy-kcal'), g('energy-kcal')),
    fat: _parseNutriment(u('fat'), s('fat'), g('fat')),
    saturatedFat: _parseNutriment(u('saturated-fat'), s('saturated-fat'), g('saturated-fat')),
    carbohydrate: _parseNutriment(u('carbohydrates'), s('carbohydrates'), g('carbohydrates')),
    sugar: _parseNutriment(u('sugars'), s('sugars'), g('sugars')),
    fiber: _parseNutriment(u('fiber'), s('fiber'), g('fiber')),
    proteins: _parseNutriment(u('proteins'), s('proteins'), g('proteins')),
    sodium: _parseNutriment(u('sodium'), s('sodium'), g('sodium')),
    salt: _parseNutriment(u('salt'), s('salt'), g('salt')),
    energy: _parseNutriment(u('energy'), s('energy'), g('energy')),
  );
}

List<String>? _parseIngredients(dynamic v) {
  if (v is List) {
    final list = v
        .whereType<Map>()
        .map((e) => e['text']?.toString())
        .whereType<String>()
        .map((e) => e.trim())
        .where((e) => e.isNotEmpty)
        .toList();
    return list.isEmpty ? null : list;
  }
  return null;
}

extension ProductJson on Product {
  static Product fromJson(Map<String, dynamic> json) {
    final p = (json['product'] is Map<String, dynamic>)
        ? (json['product'] as Map<String, dynamic>)
        : json;

    final barcode = (p['code'] ?? p['_id'] ?? p['barcode'] ?? '').toString();

    return Product(
      barcode: barcode,
      name: (p['product_name'] ?? p['product_name_fr'] ?? p['generic_name'])?.toString(),
      altName: p['generic_name']?.toString(),
      picture: (p['image_url'] ?? p['image_front_url'] ?? p['selected_images']?['front']?['display']?['fr'])?.toString(),
      quantity: p['quantity']?.toString(),
      brands: _splitCsv(p['brands']?.toString()),
      manufacturingCountries: _splitCsv(p['manufacturing_places']?.toString()) ?? _listString(p['countries_tags']),
      nutriScore: _parseNutriScore(p['nutriscore_grade']?.toString()),
      novaScore: _parseNovaScore(p['nova_group']),
      greenScore: _parseGreenScore(p['ecoscore_grade']?.toString()),
      ingredients: _parseIngredients(p['ingredients']),
      ingredientsWithAllergens: p['ingredients_text_with_allergens']?.toString(),
      traces: _listString(p['traces_tags']),
      allergens: _listString(p['allergens_tags']),
      additives: _mapStringString(p['additives']),
      nutrientLevels: _parseNutrientLevels(p['nutrient_levels']),
      nutritionFacts: _parseNutritionFacts(p),
      ingredientsFromPalmOil: p['ingredients_from_palm_oil_n'] == null
          ? null
          : (p['ingredients_from_palm_oil_n'].toString() != '0'),
      containsPalmOil: ProductAnalysis.fromString(p['palm_oil']?.toString()),
      isVegan: ProductAnalysis.fromString(p['ingredients_analysis_tags'] is List
          ? ((p['ingredients_analysis_tags'] as List).contains('en:vegan') ? 'yes' : 'maybe')
          : null),
      isVegetarian: ProductAnalysis.fromString(p['ingredients_analysis_tags'] is List
          ? ((p['ingredients_analysis_tags'] as List).contains('en:vegetarian') ? 'yes' : 'maybe')
          : null),
    );
  }
}
