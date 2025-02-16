import 'package:flutter/material.dart';

import '../model/product.dart';
import '../model/shop.dart';
import '../state/shop_notifier.dart';
import 'product_item.dart';

class StoreScreenExample5 extends StatefulWidget {
  const StoreScreenExample5({super.key});

  @override
  State<StoreScreenExample5> createState() => _StoreScreenExample5State();
}

class _StoreScreenExample5State extends State<StoreScreenExample5> {
  late final ShopNotifier _notifier;

  @override
  void initState() {
    super.initState();
    _notifier = ShopNotifier(
      ShopModel(),
    );
  }

  @override
  void dispose() {
    _notifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => ShopInheritedNotifier(
        notifier: _notifier,
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Store'),
            centerTitle: true,
            actions: const [_ActionButton()],
          ),
          body: const _BodyLayout(),
        ),
      );
}

class _ActionButton extends StatelessWidget {
  const _ActionButton();

  @override
  Widget build(BuildContext context) {
    final isVisible = ShopInheritedNotifier.of(context).value.hidePrice;

    return IconButton(
      onPressed: () => _onChange(context),
      icon: Icon(isVisible ? Icons.visibility_off : Icons.visibility),
    );
  }

  void _onChange(BuildContext context) {
    final notifier = ShopInheritedNotifier.of(context);
    notifier.value.hidePrice ? notifier.hide() : notifier.show();
  }
}

class _BodyLayout extends StatelessWidget {
  const _BodyLayout();

  @override
  Widget build(BuildContext context) => ListView.separated(
        itemBuilder: (ontext, index) => ProductRowItem(
          Product.products[index],
        ),
        separatorBuilder: (context, index) => const Divider(
          height: 1,
          thickness: 1,
          indent: ProductRowItem.indent,
          endIndent: ProductRowItem.endIndent,
        ),
        itemCount: Product.products.length,
      );
}
