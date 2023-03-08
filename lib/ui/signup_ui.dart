

// ignore_for_file: deprecated_member_use

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:strix/input_content/input_data.dart';
//import 'package:strix/ui/googlesignin.dart';
import 'package:strix/ui/home_ui.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:strix/ui/googlesignin.dart';




class SignupUi extends StatefulWidget {
  const SignupUi({super.key});

  @override
  State<SignupUi> createState() => _SignupUiState();
}

class _SignupUiState extends State<SignupUi> {
  TextEditingController usernameinp = TextEditingController();
  TextEditingController emailInput = TextEditingController();
  TextEditingController passInput = TextEditingController();
  final user=FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(0, 205, 199, 199),
        // elevation: 0,
        title: const Text(
          'Sign UP',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        // decoration: const BoxDecoration(
        //   gradient: LinearGradient(
        //       begin: Alignment.bottomCenter,
        //       end: Alignment.topCenter,
        //       colors: [
        //         Color.fromARGB(189, 14, 11, 11),
        //         Color.fromRGBO(255, 247, 237, 0.829)
        //       ]),
        // ),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 200, 20, 0),
            child: Column(
              children: [
                inputData(
                    'Enter User name  ', Icons.person, false, usernameinp),
                const SizedBox(
                  height: 20,
                ),
                inputData('Enter Your Email ', Icons.email, false, emailInput),
                const SizedBox(
                  height: 20,
                ),
                inputData('Enter Your Password ', Icons.password_rounded, true,
                    passInput),
                const SizedBox(
                  height: 20,
                ),
                siginbutton(
                  context,
                  false,
                  () async {
                    if (usernameinp.text.isNotEmpty &&
                        emailInput.text.isNotEmpty &&
                        passInput.text.isNotEmpty) {
                      try {
                         await FirebaseAuth.instance
                            .createUserWithEmailAndPassword(
                                email: emailInput.text,
                                password: passInput.text,
                                )
                            .then(
                          (value) { 
                             if(user?.displayName==null){
                          user?.updateProfile(displayName: emailInput.text);
                              }
                            Fluttertoast.showToast(
                              msg: 'Account created',
                              backgroundColor: Colors.green,
                              
                            );
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const homePage(),
                              ),
                            );
                          
                          },
                        );
                      } catch (e) {
                        resolveerror(context, e);
                      }
                    } else {
                      resolveerror(context, 'Please Fill all the detailse');
                    }
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(children: const <Widget>[
                  Expanded(
                      child: Divider(
                    color: Colors.black38,
                    thickness: 2,
                  )),
                  Text(
                    "  or  ",
                    style: TextStyle(color: Colors.white, fontSize: 20),
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
                      Fluttertoast.showToast(
                              msg: 'Account created',
                              backgroundColor: Colors.green,
                            );
                            Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const homePage(),
                              ),(route)=>false
                            );
                            } );

                    },
                    hoverColor: Colors.green,
                    focusColor:  Colors.green,
                    hoverElevation: 3,
                    backgroundColor:  Colors.blue[200],
                  ),
                ),
              ],
            
            )
            ,
          ),
          
        ),
        
      ),
       backgroundColor: Colors.blue[400],
    );
  }
  











 
}



