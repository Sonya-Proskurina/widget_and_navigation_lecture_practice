import 'package:flutter/material.dart';
import 'package:flutter_widget_seminar/src/examples/example_9_key/model/product.dart';
import 'package:flutter_widget_seminar/src/examples/example_9_key/navigation/routes.dart';

class NavigationManagerExample9 {
  NavigationManagerExample9._();

  static final instance = NavigationManagerExample9._();

  final key = GlobalKey<NavigatorState>();

  NavigatorState get _navigator => key.currentState!;

  Future<int> openProduct(Product product, int count) async {
    final res = await _navigator.pushNamed(
      RouteNamesExample9.product,
      arguments: [
        product,
        count,
      ],
    ) as int;
    return res;
  }

  void pop(Object? result) {
    _navigator.pop(result);
  }
}
