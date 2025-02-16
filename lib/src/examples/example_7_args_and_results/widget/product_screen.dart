import 'package:flutter/material.dart';

import '../../example_7_args_and_results/model/product.dart';

class ProductScreen extends StatefulWidget {
  final Product product;
  final int count;

  const ProductScreen(
    this.product,
    this.count,
  );

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  late int count;
  late Product product;

  @override
  void initState() {
    super.initState();
    count = widget.count;
    product = widget.product;
  }

  // @override
  // void didChangeDependencies() {
  //   super.didChangeDependencies();
  //   final list = ModalRoute.of(context)?.settings.arguments as List;
  //   product = list[0] as Product;
  //   count = list[1] as int;
  // }

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
              Navigator.of(context).pop(count);
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
