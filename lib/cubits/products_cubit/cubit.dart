import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ict_hub_task_1_2_3/cubits/products_cubit/states.dart';
import 'package:ict_hub_task_1_2_3/data/data%20source/ProductsDataSource.dart';

class ProductsCubit extends Cubit<ProductsState> {
  ProductsCubit() : super(ProductsLoading());

  ProductsDataSource productsDataSource = ProductsDataSource();

  void getProducts() async {
    try {
      final products = await productsDataSource.getProducts();
      if (products != null) {
        emit(ProductsLoaded(products));
      } else {
        throw Exception("Failed to load products");
      }
    } catch (e) {
      emit(ProductsError(e.toString()));
    }
  }
}
