import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ShoppingScreen extends StatefulWidget {
  const ShoppingScreen({super.key});

  @override
  State<ShoppingScreen> createState() => _ShoppingScreenState();
}

class _ShoppingScreenState extends State<ShoppingScreen> {
  @override
  Widget build(BuildContext context) {
    return
    Scaffold( 
      body:Container(
      child: Center(
        child: Text('shopping cart page ',style: TextStyle(fontSize: 20,fontWeight:FontWeight.w500 ),),
      ),
    ),
    backgroundColor: Colors.grey.shade200,
    );
  }
}