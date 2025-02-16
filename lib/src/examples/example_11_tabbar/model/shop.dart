import 'package:flutter/material.dart';

class ShopModel {
  bool _hidePrice;
  Map<int, ValueNotifier<int>> _countMap;

  ShopModel({
    bool? hidePrice,
    Map<int, ValueNotifier<int>>? countMap,
  })  : _countMap = countMap ?? {},
        _hidePrice = hidePrice ?? false;

  bool get hidePrice => _hidePrice;

  Map<int, ValueNotifier<int>> get countMap => _countMap;

  ShopModel show() => ShopModel(hidePrice: true, countMap: _countMap);

  ShopModel hide() => ShopModel(hidePrice: false, countMap: _countMap);
}
