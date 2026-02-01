class ProductDto {
  final String? barcode;
  final String? name;
  final String? picture;
  final String? brands;
  final String? nutriscoreGrade;
  final int? novaGroup;
  final String? ecoscoreGrade;

  ProductDto({
    this.barcode,
    this.name,
    this.picture,
    this.brands,
    this.nutriscoreGrade,
    this.novaGroup,
    this.ecoscoreGrade,
  });

  factory ProductDto.fromJSON(Map<String, dynamic> json) {
    return ProductDto(
      barcode: (json['barcode'] ?? json['code'])?.toString(),
      name: (json['name'] ?? json['product_name'])?.toString(),
      picture: (json['picture'] ?? json['image_url'] ?? json['image_front_url'])?.toString(),
      brands: (json['brands'] ?? json['brand'])?.toString(),
      nutriscoreGrade: (json['nutriScore'] ?? json['nutriscore_grade'])?.toString(),
      novaGroup: _toInt(json['novaScore'] ?? json['nova_group']),
      ecoscoreGrade: (json['greenScore'] ?? json['ecoscore_grade'])?.toString(),
    );
  }

  static int? _toInt(dynamic v) {
    if (v == null) return null;
    if (v is int) return v;
    return int.tryParse(v.toString());
  }
}
