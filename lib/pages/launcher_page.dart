import 'dart:async';

import 'package:ecomrs_app_part1/auth/firebase_auth.dart';
import 'package:ecomrs_app_part1/pages/dashboard_page.dart';
import 'package:ecomrs_app_part1/pages/loginPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LauncherPage extends StatefulWidget {
  static const String routeName='/';

  @override
  _LauncherPageState createState() => _LauncherPageState();
}

class _LauncherPageState extends State<LauncherPage> {

  @override
  void initState() {

  Future.delayed(Duration.zero,(){
    if(FirebaseAuthServices.currentUser == null)
    {
      Navigator.pushReplacementNamed(context, LoginPage.routeName);
    }
    else
    {
      Navigator.pushReplacementNamed(context, Dashboard.routeName);
    }
  });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}

