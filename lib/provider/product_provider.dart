import 'package:ecomrs_app_part1/db/firestore_helper.dart';
import 'package:flutter/cupertino.dart';

class ProductProvider extends ChangeNotifier{

  List<String> categorieList=[];
  void getAllCategories(){
    FireStoreHelper.getAllCategories().listen((snapshot) {
      categorieList =List.generate(snapshot.docs.length, (index) => snapshot.docs[index].data()['name']);
      notifyListeners();

    });
  }

  Future<bool> checkAdmins(String email) =>FireStoreHelper.checkAdmins(email);


}