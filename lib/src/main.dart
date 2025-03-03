import 'package:flutter/material.dart';
import 'package:flutter_widget_seminar/src/examples/example_11_tabbar/navigation/routes.dart';
import 'package:flutter_widget_seminar/src/examples/example_5_store_and_counter/widget/shop_screen.dart';
import 'package:flutter_widget_seminar/src/examples/example_9_key/navigation/routes.dart';

import 'examples/example_1.dart';
import 'examples/example_10_dialogs_and_modals/navigation/navigation_manager.dart';
import 'examples/example_10_dialogs_and_modals/navigation/routes.dart';
import 'examples/example_11_tabbar/navigation/navigation_manager.dart';
import 'examples/example_2.dart';
import 'examples/example_3.dart';
import 'examples/example_4.dart';
import 'examples/example_5_keys.dart';
import 'examples/example_5_store/widget/shop_screen.dart';
import 'examples/example_6_push_pop_replacement/widget/shop_screen.dart';
import 'examples/example_7_args_and_results/widget/shop_screen.dart';
import 'examples/example_8_named_routes/navigation/routes.dart';
import 'examples/example_8_named_routes/widget/shop_screen.dart';
import 'examples/example_9_key/navigation/navigation_manager.dart';

void main() => runApp(const App());

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.white,
        ),
      ),
      home: const StatelessCase(),
      // home: const StatefulCase(text: 'StatefulWidget'),
      // home: const InheritedCase(),
      // home: const BuilderCase(),
      // home: const ExampleKeys(),
      // home: const StoreScreenExample5(),
      // home: const StoreScreenExample5Counter(),
      // home: const StoreScreenExample6(),
      // home: const StoreScreenExample7(),

      // initialRoute: RouteNames.home,
      // routes: RoutesBuilder.routes,
      // onGenerateRoute: RoutesBuilder.onGenerateRoute,

      // initialRoute: RouteNamesExample9.home,
      // onGenerateRoute: RoutesBuilderExample9.onGenerateRoute,
      // navigatorKey: NavigationManagerExample9.instance.key,

      // initialRoute: RouteNamesExample10.home,
      // onGenerateRoute: RoutesBuilderExample10.onGenerateRoute,
      // navigatorKey: NavigationManager10.instance.key,

      // initialRoute: RouteNamesExample11.home,
      // onGenerateRoute: RoutesBuilderExample11.onGenerateRoute,
      // navigatorKey: NavigationManager11.instance.key,
    );
  }
}
