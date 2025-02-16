import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../model/shop.dart';

class ShopNotifier extends ValueNotifier<ShopModel> {
  ShopNotifier(super.value);

  void show() {
    value = value.show();
  }

  void hide() {
    value = value.hide();
  }
}

class ShopInheritedNotifier extends InheritedNotifier<ShopNotifier> {
  const ShopInheritedNotifier({
    super.key,
    required super.notifier,
    required super.child,
  });

  static ShopNotifier of(BuildContext context) {
    final result =
        context.dependOnInheritedWidgetOfExactType<ShopInheritedNotifier>();

    final notifier = result?.notifier;
    if (notifier == null) {
      throw StateError('No ShopInheritedNotifier found in context');
    }

    return notifier;
  }
}
