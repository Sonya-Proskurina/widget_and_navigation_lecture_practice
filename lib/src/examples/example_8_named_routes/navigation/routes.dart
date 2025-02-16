import 'package:flutter/material.dart';

import '../widget/product_screen.dart';
import '../widget/shop_screen.dart';

abstract class RouteNames {
  const RouteNames._();

  static const home = '/';
  static const product = 'product';
}

abstract class RoutesBuilder {
  static final routes = <String, Widget Function(BuildContext)>{
    RouteNames.home: (BuildContext) => const StoreScreenExample8(),
    RouteNames.product: (BuildContext) => const ProductScreenExample8(),
  };

  static Route<Object?>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteNames.home:
        return MaterialPageRoute(
          builder: (_) => const StoreScreenExample8(),
          settings: settings,
        );

      case RouteNames.product:
        return MaterialPageRoute(
          builder: (_) => const ProductScreenExample8(),
          settings: settings,
        );
    }

    return null;
  }
}
