import 'package:flutter/material.dart';
import 'package:flutter_widget_seminar/src/examples/example_10_dialogs_and_modals/navigation/routes.dart';

import '../../example_10_dialogs_and_modals/model/product.dart';

class NavigationManager10 {
  NavigationManager10._();

  static final instance = NavigationManager10._();

  final key = GlobalKey<NavigatorState>();

  NavigatorState get _navigator => key.currentState!;

  Future<int> openProduct(Product product, int count) async {
    final res = await _navigator.pushNamed(
      RouteNamesExample11.product,
      arguments: [
        product,
        count,
      ],
    ) as int;
    return res;
  }

  void pop([Object? result]) {
    _navigator.pop(result);
  }
}
