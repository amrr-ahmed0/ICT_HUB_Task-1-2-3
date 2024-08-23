import 'package:flutter/material.dart';
import '../data/data source/data_source.dart';
import '../widgets/custom_card.dart';

class GridViewTest extends StatefulWidget {
  const GridViewTest({super.key});

  @override
  State<GridViewTest> createState() => _GridViewTestState();
}

class _GridViewTestState extends State<GridViewTest> {
  var items = DataSource.itemList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.builder(
          itemCount: 6,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.95,
          ),
          itemBuilder: (context, index) {
            return CustomCard(items: items[index]);
          }),
    );
  }
}
