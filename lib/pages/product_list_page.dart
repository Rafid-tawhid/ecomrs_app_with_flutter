


import 'dart:io';
import 'dart:ui';
import 'package:ecomrs_app_part1/models/product_model.dart';
import 'package:ecomrs_app_part1/provider/product_provider.dart';
import 'package:ecomrs_app_part1/utilities/constant.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class ProductListPage extends StatefulWidget {
  static const String routeName='/products';
  @override
  _ProductListPageState createState() => _ProductListPageState();
}

class _ProductListPageState extends State<ProductListPage> {
  late ProductProvider _productProvider;

  @override
  void didChangeDependencies() {
    _productProvider = Provider.of<ProductProvider>(context, listen: false);
    _productProvider.getAllProducts();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("All products"),
      ),
      body: _productProvider.productList.isEmpty ?Center(child: Text("No Product Found"),) : ListView.builder(
        itemCount: _productProvider.productList.length,
        itemBuilder: (context, index) {
          final product=_productProvider.productList[index];
          return Column(
            children: [
              Card(
                elevation: 3,
                child: ListTile(
                  // leading: Image.file(File(product.localImagePath!),fit: BoxFit.cover,height: 100,width: 100,),
                   title: Text(product.name!),
                  subtitle: Text(product.description!),
                  trailing: Chip(
                    label: Text('$taka ${product.price}'),
                  ),


                ),

              ),
            ],
          );
        },
      ),
    );
  }



}
