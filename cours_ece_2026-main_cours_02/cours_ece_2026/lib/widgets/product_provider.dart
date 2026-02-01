import 'package:flutter/material.dart';
import 'package:formation_flutter/model/product.dart';

class ProductProvider extends InheritedWidget {
  final Product product;

  const ProductProvider({
    super.key,
    required this.product,
    required Widget child,
  }) : super(child: child);

  static Product of(BuildContext context) {
    final provider =
        context.dependOnInheritedWidgetOfExactType<ProductProvider>();
    assert(provider != null, 'No ProductProvider found in context');
    return provider!.product;
  }

  @override
  bool updateShouldNotify(ProductProvider oldWidget) {
    return product != oldWidget.product;
  }
}
