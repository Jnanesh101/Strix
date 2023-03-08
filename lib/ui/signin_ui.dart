
// ignore_for_file: deprecated_member_use

import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:strix/input_content/input_data.dart';
import 'package:strix/main.dart';
import 'package:strix/ui/googlesignin.dart';
import 'package:strix/ui/home_ui.dart';
import 'package:strix/ui/signup_ui.dart';
import  'package:intl/intl.dart';



class SigninUi extends StatefulWidget {
  const SigninUi({super.key});

  @override
  State<SigninUi> createState() => _SigninUiState();
}

class _SigninUiState extends State<SigninUi> {
  TextEditingController emailInput = TextEditingController();
  TextEditingController passInput = TextEditingController();
  final user=FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
       Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        // decoration: const BoxDecoration(
        //   gradient: LinearGradient(
        //       begin: Alignment.bottomCenter,
        //       end: Alignment.topCenter,
        //       colors: [
        //         Color.fromARGB(255, 8, 8, 8),
        //         Color.fromRGBO(255, 247, 237, 0.829)
        //       ]),
        // ),
      
        
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 180, 20, 0),
            child: Column(
              children: [
                inputData('Enter Your Email ', Icons.email, false, emailInput),
                const SizedBox(
                  height: 40,
                ),
                inputData('Enter Your Password ', Icons.password_rounded, true,
                    passInput),
                const SizedBox(
                  height: 30,
                ),
                siginbutton(
                  context,
                  true,
                  ()async {
                    if( emailInput.text.isNotEmpty &&passInput.text.isNotEmpty )
                    {
                      try{
                        await FirebaseAuth.instance.signInWithEmailAndPassword(
                            email: emailInput.text, password: passInput.text,)
                        .then((value) async{
                          if(user?.displayName==null){
                          user?.updateProfile(displayName: emailInput.text);
                              }
                              //shared 
                              var data=await SharedPreferences.getInstance();
                              data.setBool(MyAppState.EMAIL, true);




                           Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                              builder: (context) => homePage(),
                            ),(route)=>false);
                      }
                        );}
                        catch(e){
                           resolveerror(context, e);
                        }
                  }else{
                    resolveerror(context, 'Please fill all the detalise');
                  }
                  },
                ),
                
               const SizedBox(
                  height: 10,
                ),

                newuser(),

               const SizedBox(
                  height: 30,
                ),

                 Row(children: const <Widget>[
                  Expanded(
                      child: Divider(
                    color: Colors.black38,
                    thickness: 2,
                  )),
                  Text(
                    "   Login with   ",
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  Expanded(
                      child: Divider(
                    color: Colors.black38,
                    thickness: 2,
                  )),
                ]),
                const SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SignupUi(),
                      ),
                    );
                  },
                  child: FloatingActionButton(
                    child: Image(
                      image: AssetImage('images/google.png'),
                      height: 30,
                    ),
                    onPressed: () {

                     GoogleSignin.signInWithGoogle().then((value) {

                    
                      if(user?.metadata.creationTime.toString().substring(0,19)!=DateFormat('yyy-mm-dd hh:mm:ss').format(DateTime.now()) ){
                        Fluttertoast.showToast(
                              msg: 'Login successful',
                              backgroundColor: Colors.green,
                            );
                            Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const homePage(),
                              ),(route)=>false
                            );}
                      else{
                          Fluttertoast.showToast(
                              msg: 'User not found',
                              backgroundColor: Colors.green,
                            );
                        
                      }
                            }, );
                    
                    },

                  
                    hoverColor: Colors.green,
                    focusColor:  Colors.green,
                    hoverElevation: 3,
                    backgroundColor:  Colors.blue[200],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
       backgroundColor: Colors.blue[400],
    );
  }

  Row newuser() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'Dont have Account',
          style: TextStyle(
            color: Colors.white60,
            fontSize: 16,
          ),
        ),
        GestureDetector(

          onTap: () {
            const TextStyle(color: Colors.red);
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const SignupUi(),
              ),
            );
          },

          child: const Text(
            ' Sign UP',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }

}
