import 'package:apitest/locator.dart';
import 'package:apitest/pages/home_page.dart';
import 'package:apitest/view_model/view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main(){
  setup();
  runApp(ApiApp());
}

class ApiApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.orange
      ),
      home: ChangeNotifierProvider(
          create: (context)=>ViewModel(),
          child: HomePage()
      ),
    );
  }
}
