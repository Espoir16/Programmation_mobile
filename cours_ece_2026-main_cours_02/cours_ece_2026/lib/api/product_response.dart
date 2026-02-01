import 'package:formation_flutter/api/product_dto.dart';

class ProductResponse {
  final ProductDto? product;

  ProductResponse({this.product});

  factory ProductResponse.fromJSON(Map<String, dynamic> json) {
    final p = json['product'];
    return ProductResponse(
      product: p is Map<String, dynamic> ? ProductDto.fromJSON(p) : null,
    );
  }
}
