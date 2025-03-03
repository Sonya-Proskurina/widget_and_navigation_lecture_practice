import 'package:flutter/material.dart';

import '../model/product.dart';
import '../model/shop.dart';
import '../navigation/navigation_manager.dart';
import '../state/shop_notifier.dart';
import 'product_item.dart';

class StoreScreenExample11 extends StatefulWidget {
  const StoreScreenExample11({super.key});

  @override
  State<StoreScreenExample11> createState() => _StoreScreenExample11State();
}

class _StoreScreenExample11State extends State<StoreScreenExample11> {
  late final ShopNotifier _notifier;
  int index = 0;
  final children = [
    _BodyLayout(),
    _NewTab(),
  ];

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
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: index,
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.looks_one_outlined),
                label: 'First',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.looks_two_outlined),
                label: 'Second',
              ),
            ],
            onTap: (newIndex) {
              setState(
                () {
                  index = newIndex;
                },
              );
            },
          ),
          body: children[index],
          // body: IndexedStack(
          //   children: children,
          //   index: index,
          // ),
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
                NavigationManager11.instance.pop();
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

class _NewTab extends StatefulWidget {
  const _NewTab();

  @override
  State<_NewTab> createState() => _NewTabState();
}

class _NewTabState extends State<_NewTab> {
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text('New tab '+counter.toString()),
          ElevatedButton(
            onPressed: () {
              setState(() {
                counter++;
              });
            },
            child: Text('tap'),
          )
        ],
      ),
    );
  }
}
