import 'package:flutter/material.dart';

import '../model/product.dart';
import '../state/product_item_notifier.dart';
import '../state/shop_notifier.dart';

class ProductRowItem extends StatefulWidget {
  final Product product;

  const ProductRowItem(
    this.product, {
    super.key,
  });

  // Start padding + avatar width + padding to text
  static const double indent = 20 + 68 + 16;

  // End padding
  static const double endIndent = 14.0;

  @override
  State<ProductRowItem> createState() => _ProductRowItemState();
}

class _ProductRowItemState extends State<ProductRowItem> {
  @override
  Widget build(BuildContext context) {
    print("build ProductRowItem " + widget.product.id.toString());
    return ProductItemInheritedNotifier(
      notifier: ShopInheritedNotifier.of(context)
          .getValueNotifierById(widget.product.id),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 8, 14, 8),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 16),
              child: _Avatar(widget.product),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _Title(widget.product.name),
                  const SizedBox(height: 3),
                  _Subtitle(widget.product.price),
                ],
              ),
            ),
            _ItemText(),
            _IconButton(widget.product.id),
          ],
        ),
      ),
    );
  }
}

class _ItemText extends StatelessWidget {
  const _ItemText();

  @override
  Widget build(BuildContext context) {
    print("build _ItemText");
    return Text(
      'conut: ' + ProductItemInheritedNotifier.of(context).value.toString(),
    );
  }
}

class _Avatar extends StatelessWidget {
  final Product product;

  const _Avatar(
    this.product,
  );

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(4),
      child: Image.asset(
        product.assetName,
        package: product.assetPackage,
        fit: BoxFit.cover,
        width: 68,
        height: 68,
        errorBuilder: (context, error, sk) => const Icon(Icons.warning),
      ),
    );
  }
}

class _Title extends StatelessWidget {
  final String text;

  const _Title(
    this.text,
  );

  @override
  Widget build(BuildContext context) => Text(
        text,
        style: const TextStyle(
          color: Color.fromRGBO(0, 0, 0, 0.8),
          fontSize: 18,
          fontStyle: FontStyle.normal,
          fontWeight: FontWeight.normal,
        ),
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      );
}

class _Subtitle extends StatelessWidget {
  final int price;

  const _Subtitle(this.price);

  @override
  Widget build(BuildContext context) {
    final isVisible = ShopInheritedNotifier.of(context).value.hidePrice;
    return Text(
      '$price \$',
      style: TextStyle(
        color: const Color(0xFF8E8E93),
        fontSize: 13,
        fontWeight: FontWeight.w300,
        decoration: isVisible ? null : TextDecoration.lineThrough,
      ),
    );
  }
}

class _IconButton extends StatelessWidget {
  final int id;

  const _IconButton(
    this.id,
  );

  @override
  Widget build(BuildContext context) => IconButton(
        onPressed: () {
          ShopInheritedNotifier.of(context).addCountById(id);
        },
        icon: const Icon(Icons.add),
      );
}
