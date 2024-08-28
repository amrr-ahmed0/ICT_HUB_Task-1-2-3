import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ict_hub_task_1_2_3/cubits/products_cubit/cubit.dart';
import 'package:ict_hub_task_1_2_3/ui/widgets/AppErrorWidget.dart';
import 'package:ict_hub_task_1_2_3/ui/widgets/LoadingWidget.dart';
import 'package:ict_hub_task_1_2_3/ui/widgets/product_list_view.dart';
import '../../cubits/products_cubit/states.dart';

class ApiTest extends StatelessWidget {
  const ApiTest({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<ProductsCubit, ProductsState>(
        builder: (context, state) {
          if (state is ProductsLoading) {
            return LoadingWidget();
          } else if (state is ProductsError) {
            return AppErrorWidget(errorMessage: state.errorMessage);
          } else if (state is ProductsLoaded) {
            return Center(
              child: RefreshIndicator(
                onRefresh: () async {},
                child: ProductsListView(products: state.products),
              ),
            );
          } else {
            return Center(
              child: Text('Unknown error'),
            );
          }
        },
      ),

      ///old body without cubit
      // body: Center(
      //   child: ProductsDataSource.isLoading
      //       ? const LoadingWidget()
      //       : ProductsDataSource.isError
      //           ? AppErrorWidget(
      //               errorMessage: ProductsDataSource.errorMessage,
      //               onTryagain: () async {
      //                 ProductsDataSource.products.clear();
      //                 ProductsDataSource.isLoading = true;
      //                 ProductsDataSource.isError = false;
      //                 await ProductsDataSource.getProducts().then((value) {
      //                   setState(() {});
      //                 });
      //               },
      //             )
      //           : RefreshIndicator(
      //               onRefresh: () async {
      //                 ProductsDataSource.products.clear();
      //                 ProductsDataSource.isLoading = true;
      //                 setState(() {});
      //                 await ProductsDataSource.getProducts();
      //                 setState(() {});
      //               },
      //               child: ListView.builder(
      //                 padding: const EdgeInsets.all(5),
      //                 itemCount: ProductsDataSource.products.length,
      //                 itemBuilder: (context, index) {
      //                   return Padding(
      //                     padding: const EdgeInsets.all(8),
      //                     child: ListTile(
      //                       onTap: () {
      //                         Navigator.push(
      //                             context,
      //                             MaterialPageRoute(
      //                                 builder: (context) => ProductScreen(
      //                                     product: ProductsDataSource
      //                                         .products[index])));
      //                       },
      //                       shape: RoundedRectangleBorder(
      //                           borderRadius: BorderRadius.circular(25)),
      //                       leading: ClipRRect(
      //                         borderRadius: BorderRadius.circular(20),
      //                         child: Image.network(
      //                           ProductsDataSource.products[index].thumbnail ??
      //                               "",
      //                           width: 50,
      //                           height: 50,
      //                           fit: BoxFit.contain,
      //                         ),
      //                       ),
      //                       tileColor: Colors.grey.shade300,
      //                       title: Text(
      //                         ProductsDataSource.products[index].title ?? '',
      //                         maxLines: 2,
      //                       ),
      //                       subtitle: Text(
      //                         ProductsDataSource.products[index].description ??
      //                             '',
      //                         maxLines: 2,
      //                         overflow: TextOverflow.ellipsis,
      //                       ),
      //                       trailing: Text(
      //                         '${ProductsDataSource.products[index].price.toString()} \$',
      //                         style: const TextStyle(
      //                             fontSize: 13,
      //                             color: Colors.black,
      //                             fontWeight: FontWeight.bold),
      //                       ),
      //                     ),
      //                   );
      //                 },
      //               ),
      //             ),
      // ),
    );
  }
}
