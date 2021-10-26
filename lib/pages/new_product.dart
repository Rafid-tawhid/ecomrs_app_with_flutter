import 'dart:math';

import 'package:ecomrs_app_part1/provider/product_provider.dart';
import 'package:ecomrs_app_part1/utilities/helper_function.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NewProductPage extends StatefulWidget {
  static const String routeName = '/new_product_page';

  @override
  _NewProductPageState createState() => _NewProductPageState();
}

class _NewProductPageState extends State<NewProductPage> {
  final _form_key = GlobalKey<FormState>();
  DateTime? _dateTime;
  String? _category;

  late ProductProvider _productProvider;

  @override
  void didChangeDependencies() {
    _productProvider = Provider.of<ProductProvider>(context);

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            title: Text("Our Products"),
            centerTitle: true,
            leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            actions: [
              IconButton(onPressed: _saveProduct, icon: Icon(Icons.save)),
            ],
          ),
          body: Form(
            key: _form_key,
            child: ListView(padding: EdgeInsets.all(12), children: [
              TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty)
                    return 'This field must not be empty';
                  return null;
                },
                onSaved: (value) {},
                decoration: InputDecoration(
                  labelText: 'Product Name',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty)
                    return 'This field must not be empty';
                  return null;
                },
                onSaved: (value) {},
                decoration: InputDecoration(
                  labelText: 'Product Description',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty)
                    return 'This field must not be empty';
                  return null;
                },
                onSaved: (value) {},
                decoration: InputDecoration(
                  labelText: 'Product Price',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty)
                    return 'This field must not be empty';
                  return null;
                },
                onSaved: (value) {},
                decoration: InputDecoration(
                  labelText: 'Quantity',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              DropdownButtonFormField(
                hint: Text("Select Categories"),
                value: _category,
                onChanged: (value) {
                  setState(() {
                    _category = value as String?;
                  });
                },
                items: _productProvider.categorieList
                    .map((e) => DropdownMenuItem(
                          child: Text(e),
                          value: e,
                        ))
                    .toList(),
                validator: (value) {
                  if (value == null)
                    {return 'Please Select a Category';}
                  return null;
                },
              ),
              Row(
                children: [
                  ElevatedButton.icon(onPressed: _showDatePicker,icon: Icon(Icons.date_range_outlined),label: Text("Select Date"),),
                  Text(_dateTime==null? 'No Date Chosen' : getFormatedDate(_dateTime!,'dd/MM/yyyy'))
                  
                ],
              )
            ]),
          ),
        ));
  }

  void _saveProduct() {}

  void _showDatePicker() {
  }
}
