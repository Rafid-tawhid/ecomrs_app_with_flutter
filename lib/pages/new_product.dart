
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecomrs_app_part1/models/product_model.dart';
import 'package:ecomrs_app_part1/provider/product_provider.dart';
import 'package:ecomrs_app_part1/utilities/helper_function.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'dart:io';


class NewProductPage extends StatefulWidget {
  static const String routeName = '/new_product_page';

  @override
  _NewProductPageState createState() => _NewProductPageState();
}

class _NewProductPageState extends State<NewProductPage> {
  final _form_key = GlobalKey<FormState>();
  DateTime? _dateTime;
  String? _category;
  ProductModel _productModel=ProductModel();
  ImageSource _imageSource=ImageSource.camera;
  String? _imgPath;

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
                onSaved: (value) {
                  _productModel.name=value;
                },
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
                onSaved: (value) {
                  _productModel.description=value;
                },
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
                onSaved: (value) {
                  _productModel.price=int.parse(value!);
                },
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
                onSaved: (value) {
                  _productModel.stock=int.parse(value!);
                },
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
                  _productModel.catagory=value as String?;
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
              SizedBox(
                height: 10,
              ),
              Card(

                elevation: 5,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton.icon(onPressed: _showDatePicker,icon: Icon(Icons.date_range_outlined),label: Text("Select Date"),),
                    Text(_dateTime==null? 'No Date Chosen' : getFormatedDate(_dateTime!,'MMM dd yyyy'))

                  ],
                ),
              ),
              SizedBox(height: 10,),
              Card(
                elevation: 5,
                child: Column(
                  children: [
                    Container(
                      height: 200,
                      width: double.maxFinite,
                      decoration: BoxDecoration(
                        // borderRadius: BorderRadius.circular(15),
                        border: Border.all(color: Colors.grey,width: 2),
                      ),
                      child: _imgPath==null ?Image.asset('images/ph1.png'):Image.file(File(_imgPath!),fit: BoxFit.cover,),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(onPressed: (){
                          _imageSource=ImageSource.camera;
                          _pickImage();
                        }, child: Text("Camera")),
                        SizedBox(width: 10,),
                        ElevatedButton(onPressed: (){
                          _imageSource=ImageSource.gallery;
                          _pickImage();
                        }, child: Text("Gallery")),
                      ],
                    ),
                  ],
                ),
              ),
            ]),
          ),
        ));
  }

  void _saveProduct() {
    if(_form_key.currentState!.validate())
      {
        _form_key.currentState!.save();
        print(_productModel);
        _productProvider.insertNewProduct(_productModel).then((_) => Navigator.pop(context));
      }
  }

  void _showDatePicker() async{
   final dt= await showDatePicker(context: context, initialDate: DateTime.now(), firstDate: DateTime(DateTime.now().year), lastDate: DateTime.now());
    if(dt!=null)
      {
        setState(() {
          _dateTime=dt as DateTime?;
        });
        _productModel.purchaseDate=Timestamp.fromDate(_dateTime!);
      }
  }
  void _pickImage() async {
    final pickedFile=await ImagePicker().pickImage(source: _imageSource);

    if(pickedFile!=null)
      {
        setState(() {
          _imgPath=pickedFile.path;
        });
        _productModel.localImagePath=_imgPath;
      }

  }
}
