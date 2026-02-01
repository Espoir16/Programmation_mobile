import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:formation_flutter/model/product.dart';

class ProductApi {
  ProductApi({Dio? dio}) : _dio = dio ?? Dio();

  final Dio _dio;

  Future<Product> fetchProduct(String barcode) async {
    final url = 'https://api.formation-flutter.fr/v2/getProduct?barcode=$barcode';
    final res = await _dio.get(url);

    final data = res.data is String ? jsonDecode(res.data) : res.data;
    if (data is! Map<String, dynamic>) {
      throw Exception('Invalid API response');
    }

    return ProductJson.fromJson(data);
  }
}
