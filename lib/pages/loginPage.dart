import 'package:ecomrs_app_part1/auth/firebase_auth.dart';
import 'package:ecomrs_app_part1/pages/dashboard_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  static const String routeName='/login_page';

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String? _email,_pass;
  String _errorMsg='';

  final form_key=GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Login Page'),
        ),
        body: Center(
          child: Container(
            child: Form(
              key: form_key,
                child: ListView(
                  shrinkWrap: true,
                  padding: EdgeInsets.all(15),
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Center(child: Text('ADMIN LOGIN',style: TextStyle(fontSize: 25,letterSpacing: 2),)),
                    ),
                    TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      validator: (value){
                        if(value==null || value.isEmpty)
                          return 'This field must not be empty';
                        return null;
                      },
                      onSaved: (value){
                        _email=value;
                      },
                      decoration: InputDecoration(
                        labelText: 'Email Address',
                        border: OutlineInputBorder(),

                      ),
                    ),
                    SizedBox(height: 20,),
                    TextFormField(
                      obscureText: true,
                      validator: (value){
                        if(value==null || value.isEmpty)
                          return 'This field must not be empty';
                        return null;
                      },
                      onSaved: (value){
                        _pass=value;
                      },
                      decoration: InputDecoration(
                        labelText: 'Password',
                        border: OutlineInputBorder(),

                      ),
                    ),
                    SizedBox(height: 40,),
                    Center(child: ElevatedButton(onPressed: _adminLogin, child: Text('Login'))),
                    Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: Center(child: Text(_errorMsg,style: TextStyle(fontSize: 15,color: Colors.red),)),
                    ),



                  ],
            )),
          ),
        ),
      ),
    );
  }

  void _adminLogin() async{
    if(form_key.currentState!.validate())
      {
        form_key.currentState!.save();

        try{
          final user= await FirebaseAuthServices.loginAdmin(_email!, _pass!);
          if(user != null)
            {
              Navigator.pushReplacementNamed(context, Dashboard.routeName);
            }
        }
        on FirebaseAuthException catch(e){
          setState(() {
            _errorMsg=e.message!;
          });
        }
      }
  }
}
