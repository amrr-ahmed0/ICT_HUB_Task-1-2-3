import 'package:flutter/material.dart';
import 'package:ict_hub_task_1_2_3/data/data%20model/ProductDataModel.dart';

import '../widgets/custom_text.dart';

class ProductScreen extends StatelessWidget {
  ProductDataModel product;

  ProductScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Center(
          child: Container(
            width: 275,
            height: 350,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.grey.shade300),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.network(
                      product.thumbnail ?? '',
                      fit: BoxFit.cover,
                    ),
                  ),
                  CustomText(data: product.title ?? ''),
                  Text(
                    product.description ?? '',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 16),
                  ),
                  Text(
                    product.price.toString() ?? '',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
