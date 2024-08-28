import 'package:flutter/material.dart';
import '../../data/data model/items_model.dart';
import 'custom_text.dart';

class CustomCard extends StatelessWidget {
  CustomCard({super.key, required this.items});

  ItemsModel? items;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 200,
      margin: EdgeInsets.all(10),
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Column(
        children: [
          SizedBox(height: 118, child: Image.asset('${items?.image}')),
          Divider(
            color: Colors.black,
            thickness: 5,
          ),
          Padding(
            padding: EdgeInsets.all(10),
            child: Row(
              children: [
                CustomText(data: "${items?.name}"),
                Spacer(),
                CustomText(data: "${items?.color}")
              ],
            ),
          )
        ],
      ),
    );
  }
}
