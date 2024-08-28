import '../../data/data model/ProductDataModel.dart';

abstract class ProductsState {}

class ProductsLoading extends ProductsState {}

class ProductsLoaded extends ProductsState {
  final List<ProductDataModel> products;

  ProductsLoaded(this.products);
}

class ProductsError extends ProductsState {
  final String errorMessage;

  ProductsError(this.errorMessage);
}
