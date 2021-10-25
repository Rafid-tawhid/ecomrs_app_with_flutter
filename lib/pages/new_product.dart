import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NewProductPage extends StatefulWidget {
  static const String routeName='/new_product_page';

  @override
  _NewProductPageState createState() => _NewProductPageState();
}

class _NewProductPageState extends State<NewProductPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Our Products"),
          centerTitle: true,
        )
        ,
      ),
    );
  }
}
