import 'package:ecomrs_app_part1/auth/firebase_auth.dart';
import 'package:ecomrs_app_part1/pages/loginPage.dart';
import 'package:ecomrs_app_part1/pages/new_product.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  static const String routeName='/dashboard_page';

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Dashboard'),
          actions: [
            IconButton(onPressed: (){
              FirebaseAuthServices.logoutAdmin();
              Navigator.pushReplacementNamed(context, LoginPage.routeName);
            }, icon: Icon(Icons.logout_outlined,color: Colors.white,)),
            
          ],
        ),
        body: GridView.count(crossAxisCount: 2,mainAxisSpacing: 2,crossAxisSpacing: 2,children: [
          ElevatedButton(onPressed: (){Navigator.pushNamed(context, NewProductPage.routeName);}, child: Text("Add Product",style: TextStyle(fontSize: 22),)),
          ElevatedButton(onPressed: (){Navigator.pushNamed(context, NewProductPage.routeName);}, child: Text("View Product",style: TextStyle(fontSize: 22),)),
          ElevatedButton(onPressed: (){Navigator.pushNamed(context, NewProductPage.routeName);}, child: Text("Customer",style: TextStyle(fontSize: 22),)),
          ElevatedButton(onPressed: (){Navigator.pushNamed(context, NewProductPage.routeName);}, child: Text("Orders",style: TextStyle(fontSize: 22),)),
          ElevatedButton(onPressed: (){Navigator.pushNamed(context, NewProductPage.routeName);}, child: Text("Catagories",style: TextStyle(fontSize: 22),)),
          ElevatedButton(onPressed: (){Navigator.pushNamed(context, NewProductPage.routeName);}, child: Text("Reports",style: TextStyle(fontSize: 22),)),
        ],),
      ),
    );
  }
}
