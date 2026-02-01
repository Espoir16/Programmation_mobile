import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:formation_flutter/api/product_response.dart';

class ProductApi {
  ProductApi({Dio? dio}) : _dio = dio ?? Dio();

  final Dio _dio;

  Future<ProductResponse> fetchProduct(String barcode) async {
    final url = 'https://api.formation-flutter.fr/v2/getProduct?barcode=$barcode';

    final res = await _dio.get<String>(
      url,
      options: Options(responseType: ResponseType.plain),
    );

    final raw = res.data ?? '';
    final map = jsonDecode(raw) as Map<String, dynamic>;
    return ProductResponse.fromJSON(map);
  }
}
