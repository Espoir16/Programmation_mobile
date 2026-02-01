import 'package:flutter/foundation.dart';
import 'package:formation_flutter/model/product.dart';

class ProductNotifier extends ChangeNotifier {
  Product? _product; 

  Product? get product => _product; 

  Future<void> loadProduct() async {
    
    await Future.delayed(const Duration(milliseconds: 800));

    _product = generateProduct(); 
    notifyListeners(); 
  }
}
