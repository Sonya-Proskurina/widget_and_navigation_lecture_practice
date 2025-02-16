import 'package:flutter/material.dart';

import '../../example_9_key/model/product.dart';
import '../navigation/navigation_manager.dart';

class ProductScreenExample9 extends StatefulWidget {
  const ProductScreenExample9();

  @override
  State<ProductScreenExample9> createState() => _ProductScreenExample9State();
}

class _ProductScreenExample9State extends State<ProductScreenExample9> {
  late int count;
  late Product product;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final list = ModalRoute.of(context)?.settings.arguments as List;
    product = list[0] as Product;
    count = list[1] as int;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        actions: [
          IconButton(
            icon: Icon(
              Icons.close,
            ),
            onPressed: () {
              NavigationManagerExample9.instance.pop(count);
            },
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _Image(product),
          Padding(
            padding: EdgeInsets.all(16),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _Title(product.name),
                      _Subtitle(product.price),
                    ],
                  ),
                ),
                IconButton(
                  onPressed: () {
                    if (count > 0) {
                      setState(
                        () {
                          count--;
                        },
                      );
                    }
                  },
                  icon: Icon(Icons.remove),
                ),
                Text(
                  count.toString(),
                ),
                IconButton(
                  onPressed: () {
                    setState(
                      () {
                        count++;
                      },
                    );
                  },
                  icon: Icon(Icons.add),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _Image extends StatelessWidget {
  final Product product;

  const _Image(this.product);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Image.asset(
        product.assetName,
        package: product.assetPackage,
        fit: BoxFit.fitWidth,
        errorBuilder: (context, error, sk) => const Icon(Icons.warning),
      ),
    );
  }
}

class _Title extends StatelessWidget {
  final text;

  const _Title(this.text);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        color: Color.fromRGBO(0, 0, 0, 0.8),
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}

class _Subtitle extends StatelessWidget {
  final int price;

  const _Subtitle(this.price);

  @override
  Widget build(BuildContext context) {
    return Text(
      '$price \$',
      style: TextStyle(
        color: const Color(0xFF8E8E93),
        fontSize: 16,
        fontWeight: FontWeight.normal,
      ),
    );
  }
}
