import 'dart:async';
import 'dart:ui';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:strix/ui/home_ui.dart';
import 'package:strix/ui/signin_ui.dart';
//import 'package:strix/ui/signin_ui.dart';
import 'package:strix/ui/splash_screen.dart';
import 'package:awesome_notifications/awesome_notifications.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  AwesomeNotifications().initialize(
    null,
    [
      NotificationChannel(
          channelKey: 'Strix',
          channelName: 'Strix',
          channelDescription: 'Notification Description',
          playSound: true,
          defaultColor: Colors.amberAccent,
          channelShowBadge: true,
          importance: NotificationImportance.High),
    ],
    // debug: true,
  );

  

  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
 static const String EMAIL='false';

  @override

  void initSate()
{
  super.initState();

  checkInfo();
}
 
  // This widget is the root of your application.
  @override
  Widget  build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Strix',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SplashScreen(),
    );
  }


void checkInfo() async {

var data=await SharedPreferences.getInstance();
var userPresent=data.getBool(EMAIL);
Timer(Duration(seconds: 2), () { 
if(userPresent!=null){
  if(userPresent==true){
    
     Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => homePage(),),);
  }
  else{
   Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => homePage()),);
  }
}
else{
     Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => homePage()),);
}
});

}


}


