import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:strix/screen/ShoppingScreen.dart';
import 'package:strix/screen/homescreen.dart';
import 'package:strix/screen/notificationscreen.dart';
import 'package:strix/screen/settings.dart';
import 'package:strix/ui/signin_ui.dart';
import 'package:strix/ui/signup_ui.dart';
import 'package:intl/intl.dart';

import 'googlesignin.dart';

class homePage extends StatefulWidget {
  const homePage({super.key});

  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  final user = FirebaseAuth.instance.currentUser;
  final screens = [
    const HomeScreen(),
    const ShoppingScreen(),
    const NotificationScreen(),
    const SettingsScreen(),
  ];
  int currentindex = 0;

  //String username='';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.menu_rounded),
          ),
          scrolledUnderElevation: 34,
          // title: Text('$usernameinp'),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(20),
              top: Radius.circular(20),
            ),
          ),
          actions: [
            IconButton(onPressed: (){}, icon: const Icon(Icons.search)),
            IconButton(
              onPressed: () {
                FirebaseAuth.instance.signOut();
                GoogleSignin.signout();

                Fluttertoast.showToast(
                  msg: 'Successfully Logged Out ',
                  backgroundColor: Colors.green,
                );

                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => const SigninUi()),
                    (route) => false);
              },
              icon: const Icon(
                Icons.logout,
              ),
            ),
            
          ],
        ),
        body: screens[currentindex],
        // Column(
        //   children: [
        //     Center(child:
        //      Text('HEllO ${user?.displayName}'),
        //      ),
        //       Text('HEllO ${DateFormat('yyy-MM-dd hh:mm:ss').format(DateTime.now()).toString() }'),
        //       Text('HEllO ${user?.metadata.creationTime!.toLocal().toString().substring(0,19)}'),

        //   ],
        // ),
        backgroundColor: Colors.grey.shade200,

        //userinfo(),
        bottomNavigationBar: CurvedNavigationBar(
          items: const [
            Icon(Icons.home),
            Icon(Icons.shopping_cart),
            Icon(Icons.notifications),
            Icon(Icons.account_circle),
          ],
          height: 60,
          animationDuration: const Duration(milliseconds: 200),
          backgroundColor: Colors.grey.shade200,
          color: Color.fromRGBO(100, 181, 246, 1),
          onTap: (int index) {
            setState(() {
              currentindex = index;
            });
          },
        ));
  }
  //userinfo(){
//     User? user=FirebaseAuth.instance.currentUser;
//  if(user!=null)
//   {
//     final username=user.displayName;
//   }
//}
}
