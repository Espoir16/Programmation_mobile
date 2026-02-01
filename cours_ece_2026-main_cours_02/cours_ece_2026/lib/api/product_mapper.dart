import 'package:formation_flutter/api/product_dto.dart';
import 'package:formation_flutter/model/product.dart';

class ProductMapper {
  static Product toProduct(ProductDto dto) {
    return Product(
      barcode: dto.barcode ?? '',
      name: dto.name,
      picture: dto.picture,
      brands: _splitBrands(dto.brands),
      nutriScore: _parseNutri(dto.nutriscoreGrade),
      novaScore: _parseNova(dto.novaGroup),
      greenScore: _parseGreen(dto.ecoscoreGrade),
    );
  }

  static List<String>? _splitBrands(String? v) {
    if (v == null) return null;
    final list = v.split(',').map((e) => e.trim()).where((e) => e.isNotEmpty).toList();
    return list.isEmpty ? null : list;
  }

  static ProductNutriScore _parseNutri(String? v) {
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

  static ProductNovaScore _parseNova(int? v) {
    switch (v) {
      case 1:
        return ProductNovaScore.group1;
      case 2:
        return ProductNovaScore.group2;
      case 3:
        return ProductNovaScore.group3;
      case 4:
        return ProductNovaScore.group4;
      default:
        return ProductNovaScore.unknown;
    }
  }

  static ProductGreenScore _parseGreen(String? v) {
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
}
