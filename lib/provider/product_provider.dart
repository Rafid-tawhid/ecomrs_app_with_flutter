import 'package:ecomrs_app_part1/db/firestore_helper.dart';
import 'package:ecomrs_app_part1/models/product_model.dart';
import 'package:flutter/cupertino.dart';

class ProductProvider extends ChangeNotifier{

  List<String> categorieList=[];
  List<ProductModel> productList=[];


  void getAllCategories(){
    FireStoreHelper.getAllCategories().listen((snapshot) {
      categorieList =List.generate(snapshot.docs.length, (index) => snapshot.docs[index].data()['name']);
      notifyListeners();

    });
  }
  void getAllProducts(){
    FireStoreHelper.getAllProducts().listen((snapshot) {
      productList =List.generate(snapshot.docs.length, (index) => ProductModel.fromMap(snapshot.docs[index].data()));
      notifyListeners();

    });
  }

  Future<bool> checkAdmins(String email) =>FireStoreHelper.checkAdmins(email);
  Future<void> insertNewProduct(ProductModel productModel) => FireStoreHelper.addNewProduct(productModel);



}