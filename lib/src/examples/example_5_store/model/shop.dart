class ShopModel {
  bool _hidePrice;

  ShopModel({
    bool? hidePrice,
  }) : _hidePrice = hidePrice ?? false;

  bool get hidePrice => _hidePrice;

  ShopModel show() => ShopModel(hidePrice: true);

  ShopModel hide() => ShopModel(hidePrice: false);
}
