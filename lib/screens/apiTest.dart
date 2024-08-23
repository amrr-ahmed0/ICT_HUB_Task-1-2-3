import 'package:flutter/material.dart';
import 'package:ict_hub_task_1_2_3/widgets/AppErrorWidget.dart';
import 'package:ict_hub_task_1_2_3/widgets/LoadingWidget.dart';

import '../data/data source/ProductsDataSource.dart';

class ApiTest extends StatefulWidget {
  const ApiTest({super.key});

  @override
  State<ApiTest> createState() => _ApiTestState();
}

class _ApiTestState extends State<ApiTest> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (ProductsDataSource.products.isEmpty) {
      ProductsDataSource.getProducts().then((value) {
        setState(() {
          print("set state");
        });
      });
    } else {
      print("products already loaded");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ProductsDataSource.isLoading
            ? const LoadingWidget()
            : ProductsDataSource.isError
                ? AppErrorWidget(
                    errorMessage: ProductsDataSource.errorMessage,
                    onTryagain: () async {
                      ProductsDataSource.products.clear();
                      ProductsDataSource.isLoading = true;
                      ProductsDataSource.isError = false;
                      await ProductsDataSource.getProducts().then((value) {
                        setState(() {});
                      });
                    },
                  )
                : RefreshIndicator(
                    onRefresh: () async {
                      ProductsDataSource.products.clear();
                      ProductsDataSource.isLoading = true;
                      setState(() {});
                      await ProductsDataSource.getProducts();
                      setState(() {});
                    },
                    child: ListView.builder(
                      padding: const EdgeInsets.all(5),
                      itemCount: ProductsDataSource.products.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8),
                          child: ListTile(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25)),
                            leading: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Image.network(
                                ProductsDataSource.products[index].thumbnail ??
                                    "",
                                width: 50,
                                height: 50,
                                fit: BoxFit.contain,
                              ),
                            ),
                            tileColor: Colors.grey.shade300,
                            title: Text(
                              ProductsDataSource.products[index].title ?? '',
                              maxLines: 2,
                            ),
                            subtitle: Text(
                              ProductsDataSource.products[index].description ??
                                  '',
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                            trailing: Text(
                              '${ProductsDataSource.products[index].price.toString()} \$',
                              style: const TextStyle(
                                  fontSize: 13,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
      ),
    );
  }
}
