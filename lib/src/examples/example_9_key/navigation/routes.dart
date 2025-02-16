import 'package:flutter/material.dart';

import '../widget/product_screen.dart';
import '../widget/shop_screen.dart';

abstract class RouteNamesExample9 {
  const RouteNamesExample9._();

  static const home = '/';
  static const product = 'product';
}

abstract class RoutesBuilderExample9 {
  static final routes = <String, Widget Function(BuildContext)>{
    RouteNamesExample9.home: (BuildContext) => const StoreScreenExample9(),
    RouteNamesExample9.product: (BuildContext) => const ProductScreenExample9(),
  };

  static Route<Object?>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteNamesExample9.home:
        return MaterialPageRoute(
          builder: (_) => const StoreScreenExample9(),
          settings: settings,
        );

      case RouteNamesExample9.product:
        return MaterialPageRoute(
          builder: (_) => const ProductScreenExample9(),
          settings: settings,
        );
    }

    return null;
  }
}
