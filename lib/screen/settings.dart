import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  
  final user = FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Icon(Icons.account_circle_rounded,size: 180),
           const SizedBox(
            height: 10,
          ),
          Center(
            child: Text('Email :  ${user?.email}',style: const TextStyle(fontWeight: FontWeight.w900,fontSize:16 ),),
          ),
          const SizedBox(
            height: 20,
          ),
          Center(
              child: Text(
            'Login Time : ${DateFormat('yyy-MM-dd hh:mm:ss').format(DateTime.now()).toString()}',
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          )),
          const SizedBox(
            height: 20,
          ),
          Center(
            child: Text(
              'Account Creation time ${user?.metadata.creationTime!.toLocal().toString().substring(0, 19)}',
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
      backgroundColor: Colors.grey.shade200,
    );
    
  }
}
