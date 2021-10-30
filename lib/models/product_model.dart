import 'dart:core';
import 'package:cloud_firestore/cloud_firestore.dart';

class ProductModel{
  String? id;
  String? name;
  String? catagory;
  num? price;
  String? localImagePath;
  String? imageName;
  String? downloadImageUrl;
  String? description;
  int stock;
  bool isAvailable;
  Timestamp? purchaseDate;

  ProductModel({
    this.id,
    this.name,
    this.catagory,
    this.price,
    this.localImagePath,
    this.downloadImageUrl,
    this.description,
    this.stock=1,
    this.isAvailable=true,
    this.purchaseDate,
    this.imageName}
);

  Map<String,dynamic> toMap(){
    var map=<String,dynamic>{
      'id':id,
      'name':name,
      'catagory':catagory,
      'price':price,
      'localImgPath':localImagePath,
      'imageName':imageName,
      'downloadImageUrl':downloadImageUrl,
      'description':description,
      'stock':stock,
      'isAvailable':isAvailable,
      'timestamp':purchaseDate,

    };

    return map;
  }


  factory ProductModel.fromMap(Map<String,dynamic> map)=> ProductModel(
  id:map['id'],
  name:map['name'],
  catagory:map['catagory'],
  localImagePath:map['localImgPath'],
    imageName:map['imageName'],
  downloadImageUrl:map['downloadImageUrl'],
  description:map['description'],
  stock:map['stock'],
  isAvailable:map['isAvailable'],
  price:map['price'],

  );

  @override
  String toString() {
    return 'ProductModel{id: $id, name: $name, catagory: $catagory, price: $price, localImagePath: $localImagePath, imageName: $imageName, downloadImageUrl: $downloadImageUrl, description: $description, stock: $stock, isAvailable: $isAvailable, purchaseDate: $purchaseDate}';
  }
}