import 'dart:convert';

import '../data model/product_model.dart';
import 'package:http/http.dart' as http;

class ProductsDataSource{

  static bool isLoading = true;
  static bool isError = false;
  static String errorMessage = '';
  static List<ProductModel> products = [];

  static Future<bool> getProducts() async{
    print("getProducts called");
    try{
      final response = await http.get(Uri.parse("https://fakestoreapi.com/products"));

      if(response.statusCode == 200){
        print('Loaded Products');
        List<dynamic> productsList = jsonDecode(response.body);

        for(Map<String, dynamic> item in productsList){
          ProductModel product = ProductModel.fromMap(item);
          products.add(product);
        }

        isLoading = false;

      } else{
        throw Exception("${response.statusCode}");
      }
      return true;
    } catch(e){
      isLoading = false;
      isError = true;
      errorMessage = e.toString();
      print(e);

      return false;
    }
  }

}