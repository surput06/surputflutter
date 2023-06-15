import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:surput/model.dart';

class ProductProvider with ChangeNotifier {
  final dio = Dio();

  GetProduct products = GetProduct();
  bool isLoading = true;

  Future<GetProduct> getProduct() async {
    try {
      final response = await dio.get('https://dummyjson.com/products/category/smartphones');
      if (response.statusCode == 200) {
        products = GetProduct.fromJson(response.data);
        return products;
      }
    } catch (e) {
      print(e.toString());
    }
    isLoading = false;
    notifyListeners();
    return products;
  }
}
