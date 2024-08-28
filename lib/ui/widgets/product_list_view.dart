import 'package:flutter/material.dart';
import '../../data/data model/ProductDataModel.dart';
import '../screens/product_screen.dart';
import 'custom_text.dart';

class ProductsListView extends StatelessWidget {
  final List<ProductDataModel> products;

  const ProductsListView({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(8),
      itemCount: products.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListTile(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => ProductScreen(
                    product: products[index],
                  ),
                ),
              );
            },
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            tileColor: Colors.grey[300],
            leading: Image.network(
              products[index].thumbnail ?? '',
              width: 50,
              height: 50,
              fit: BoxFit.contain,
            ),
            title: CustomText(
              data: products[index].title ?? '',
            ),
            subtitle: Text(
              products[index].description ?? '',
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontSize: 16),
            ),
            trailing: Text(
              '${products[index].price} \$',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),
        );
      },
    );
  }
}
