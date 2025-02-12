import 'package:flutter/material.dart';

import '../model/product.dart';
import 'hide_price_scope.dart';

class ProductGridItem extends StatelessWidget {
  final Product product;

  const ProductGridItem(this.product, {super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(child: _Avatar(product)),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: _Title(product.name),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: _Subtitle(product.price),
          ),
        ],
      ),
    );
  }
}

class _Avatar extends StatelessWidget {
  final Product product;

  const _Avatar(this.product,);

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            product.assetName,
            package: product.assetPackage,
            fit: BoxFit.cover,
            errorBuilder: (context, error, sk) => const Icon(Icons.warning),
          ),
          const Positioned(
            top: 0,
            right: 0,
            child: _IconButton(),
          ),
        ],
      ),
    );
  }
}

class _Title extends StatelessWidget {
  final String text;

  const _Title(this.text, );

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

  const _Subtitle(this.price,);

  @override
  Widget build(BuildContext context) {
  final isVisible = HidePriceInheritedNotifier.of(context).value;
    return  Text(
      '$price \$',
      style: TextStyle(
        color: const Color(0xFF8E8E93),
        fontSize: 13,
        fontWeight: FontWeight.w300,
        decoration: isVisible ? null : TextDecoration.lineThrough,
      ),
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    );
  }
}

class _IconButton extends StatelessWidget {
  const _IconButton();

  @override
  Widget build(BuildContext context) => IconButton(
        onPressed: () {},
        icon: const Icon(Icons.add),
      );
}
