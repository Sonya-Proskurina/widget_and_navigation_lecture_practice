import 'package:flutter/material.dart';
import 'package:flutter_widget_seminar/src/examples/example_10_dialogs_and_modals/navigation/navigation_manager.dart';

import '../model/product.dart';
import '../model/shop.dart';
import '../state/shop_notifier.dart';
import 'product_item.dart';

class StoreScreenExample10 extends StatefulWidget {
  const StoreScreenExample10({super.key});

  @override
  State<StoreScreenExample10> createState() => _StoreScreenExample10State();
}

class _StoreScreenExample10State extends State<StoreScreenExample10> {
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
      onPressed: () => _onChange(context, isVisible),
      icon: Icon(isVisible ? Icons.visibility_off : Icons.visibility),
    );
  }

  void _onChange(BuildContext context, bool isVisible) {
    showDialog(
      context: context,
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          title: isVisible
              ? Text('Зачеркнуть цены?')
              : Text('Не зачеркивать цены?'),
          actions: [
            TextButton(
              onPressed: () {
                final notifier = ShopInheritedNotifier.of(context);
                isVisible ? notifier.hide() : notifier.show();
                NavigationManager10.instance.pop();
              },
              child: Text('Да'),
            )
          ],
        );
      },
    );

    // showModalBottomSheet(
    //   context: context,
    //   builder: (BuildContext bottomSheetContext) {
    //     return SizedBox(
    //       width: double.infinity,
    //       child: Column(
    //         mainAxisAlignment: MainAxisAlignment.center,
    //         children: [
    //           isVisible ? Text('Зачеркнуть цены?') : Text('Не зачеркивать цены?'),
    //           SizedBox(
    //             height: 8,
    //           ),
    //           TextButton(
    //             onPressed: () {
    //               final notifier = ShopInheritedNotifier.of(context);
    //               isVisible ? notifier.hide() : notifier.show();
    //               NavigationManager10.instance.pop();
    //             },
    //             child: Text('Да'),
    //           )
    //         ],
    //       ),
    //     );
    //   },
    // );
  }
}

class _BodyLayout extends StatelessWidget {
  const _BodyLayout();

  @override
  Widget build(BuildContext context) => ListView.separated(
        itemBuilder: (context, index) => ProductRowItem(
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
