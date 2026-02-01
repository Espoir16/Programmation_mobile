import 'package:flutter/foundation.dart';
import 'package:formation_flutter/model/product.dart';
import 'package:formation_flutter/services/product_api.dart';

class ProductNotifier extends ChangeNotifier {
  Product? _product;
  Product? get product => _product;

  final ProductApi _api = ProductApi();

  Future<void> loadProduct() async {
    _product = null;
    notifyListeners();

    _product = await _api.fetchProduct('5000159484695');
    notifyListeners();
  }
}
