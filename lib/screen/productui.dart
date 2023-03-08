import 'package:flutter/material.dart';
import 'dart:convert';

import 'package:fluttertoast/fluttertoast.dart';

class productUi extends StatefulWidget {
  final String name;
  final String image;

  const productUi({super.key, required this.name, required this.image});
  @override
  State<productUi> createState() => _productUiState();
}

class _productUiState extends State<productUi> {
//final String items;
//late final String name;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
 scrolledUnderElevation: 34,
       // title: Text('$usernameinp'),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(20),
            top: Radius.circular(20),
          ),
        ),


      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
            ClipRRect(
    borderRadius: BorderRadius.circular(30.0),
    child: Image.network(widget.image,
        height:200
       // width: 100.0,
    ),
),
              const SizedBox(
                height: 20,
              ),
              Text(
                'Item Name :  ${widget.name}',
                style:
                    const TextStyle(fontSize: 15, fontWeight: FontWeight.w800),
              ),
              SizedBox(
                height: 30,
              ),
              ElevatedButton(
                style:ElevatedButton.styleFrom(
                  backgroundColor: Colors.redAccent.shade200,
                   
                ),
                
              
                  onPressed: () {
                    Fluttertoast.showToast(
                     
                              msg: 'Wait till next Update !',
                              backgroundColor: Colors.green,
                            );


                  },
                  child: const Text(
                    'Make Payment',
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),)
            ],
          ),
        ),
      ),
      backgroundColor: Colors.grey.shade200,
    );

    // return Padding(padding: EdgeInsets.all(10.0),
    // child: Container(
    //   height: 200,
    //   child: Center(child: Text(items,style: TextStyle(fontSize: 38), ),),
    //   decoration:  BoxDecoration(borderRadius:BorderRadius.circular(20.0),color:Colors.orange.shade200 ,),
    // ));
  }
}
