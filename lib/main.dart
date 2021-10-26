import 'package:ecomrs_app_part1/pages/dashboard_page.dart';
import 'package:ecomrs_app_part1/pages/launcher_page.dart';
import 'package:ecomrs_app_part1/pages/loginPage.dart';
import 'package:ecomrs_app_part1/pages/new_product.dart';
import 'package:ecomrs_app_part1/pages/product_list_page.dart';
import 'package:ecomrs_app_part1/provider/product_provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async{

  WidgetsFlutterBinding.ensureInitialized();
 await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context)=>ProductProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue
        ),
        initialRoute: LauncherPage.routeName,
        routes: {
          LauncherPage.routeName: (context) =>LauncherPage(),
          LoginPage.routeName: (context) =>LoginPage(),
          Dashboard.routeName: (context) =>Dashboard(),
          NewProductPage.routeName: (context) =>NewProductPage(),
          ProductListPage.routeName: (context) =>ProductListPage()
        },
      ),
    );
  }
}
