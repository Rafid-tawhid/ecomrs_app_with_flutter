import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecomrs_app_part1/models/product_model.dart';

class FireStoreHelper{
  static const String _collectionAdmins='Admins';
  static const String _collectionProducts='Products';
  static const String _collectionCategories='Categories';
  static FirebaseFirestore _db=FirebaseFirestore.instance;


  static Stream<QuerySnapshot<Map<String, dynamic>>> getAllCategories()=>_db.collection(_collectionCategories).orderBy('name').snapshots();
  static Stream<QuerySnapshot<Map<String, dynamic>>> getAllProducts()=>_db.collection(_collectionProducts).snapshots();

  static Future<void> addNewProduct(ProductModel productModel)
  {
    final docRef=_db.collection(_collectionProducts).doc();
    productModel.id=docRef.id;
    return docRef.set(productModel.toMap());
  }

  static Future<bool> checkAdmins(String email) async{

   final snapshot=await _db.collection(_collectionAdmins).where('email',isEqualTo: email).get();
   if(snapshot.docs.isNotEmpty)
     {
       return true;
     }
   else{
     return false;
   }
  }

}