


import 'package:ecomrs_app_part1/models/product_model.dart';
import 'package:ecomrs_app_part1/provider/product_provider.dart';
import 'package:ecomrs_app_part1/utilities/constant.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:io';

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
    _productProvider.getAllCategories();
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
          return Card(
            elevation: 3,
            child: ListTile(
               title: Text(product.name!),
              trailing: Chip(
                label: Text('$taka ${product.price}'),
              ),
              

            ),
          );
        },
      ),
    );
  }



}
