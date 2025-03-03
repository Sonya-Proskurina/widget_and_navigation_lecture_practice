import 'package:flutter/material.dart';

import '../../example_11_tabbar/widget/product_screen.dart';
import '../../example_11_tabbar/widget/shop_screen.dart';
import '../widget/product_screen.dart';
import '../widget/shop_screen.dart';

abstract class RouteNamesExample10 {
  const RouteNamesExample10._();

  static const home = '/';
  static const product = 'product';
}

abstract class RoutesBuilderExample10 {
  static final routes = <String, Widget Function(BuildContext)>{
    RouteNamesExample10.home: (BuildContext) => const StoreScreenExample10(),
    RouteNamesExample10.product: (BuildContext) => const ProductScreenExample10(),
  };

  static Route<Object?>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteNamesExample10.home:
        return MaterialPageRoute(
          builder: (_) => const StoreScreenExample10(),
          settings: settings,
        );

      case RouteNamesExample10.product:
        return MaterialPageRoute(
          builder: (_) => const ProductScreenExample10(),
          settings: settings,
        );
    }

    return null;
  }
}
