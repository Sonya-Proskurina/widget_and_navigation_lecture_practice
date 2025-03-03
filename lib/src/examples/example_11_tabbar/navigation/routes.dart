import 'package:flutter/material.dart';

import '../widget/product_screen.dart';
import '../widget/shop_screen.dart';

abstract class RouteNamesExample11 {
  const RouteNamesExample11._();

  static const home = '/';
  static const product = 'product';
}

abstract class RoutesBuilderExample11 {
  static final routes = <String, Widget Function(BuildContext)>{
    RouteNamesExample11.home: (BuildContext) => const StoreScreenExample11(),
    RouteNamesExample11.product: (BuildContext) => const ProductScreenExample11(),
  };

  static Route<Object?>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteNamesExample11.home:
        return MaterialPageRoute(
          builder: (_) => const StoreScreenExample11(),
          settings: settings,
        );

      case RouteNamesExample11.product:
        return MaterialPageRoute(
          builder: (_) => const ProductScreenExample11(),
          settings: settings,
        );
    }

    return null;
  }
}
