import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:strix/ui/googlesignin.dart';

import '../ui/home_ui.dart';
// -- TEXT FIELDS FOR ALL PAGES------
TextField inputData(String text, IconData icon, bool isPassword,
    TextEditingController controller) {
  return TextField(
    controller: controller,
    obscureText: isPassword,
    enableSuggestions: isPassword,
    autocorrect: isPassword,
    cursorColor: Colors.black,
    style: TextStyle(color: Colors.black.withOpacity(0.9)),
    decoration: InputDecoration(
      prefixIcon: Icon(
        icon,
        color: Colors.white70,
      ),
      labelText: text,
      labelStyle: TextStyle(color: Colors.white.withOpacity(0.9)),
      filled: true,
      floatingLabelBehavior: FloatingLabelBehavior.never,
      fillColor: Colors.white.withOpacity(0.3),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30.0),
        borderSide: const BorderSide(width: 0, style: BorderStyle.none),
      ),
    ),
    keyboardType:
        isPassword ? TextInputType.visiblePassword : TextInputType.emailAddress,
  );
}


//---BUTTONS FOR ALL PAGES ---//
Container siginbutton(BuildContext context, bool islogin, Function onTap) {
  return Container(
    width: MediaQuery.of(context).size.width,
    height: 60,
    margin: const EdgeInsets.fromLTRB(0, 10, 0, 20),
    decoration: BoxDecoration(borderRadius: BorderRadius.circular(90)),
    child: ElevatedButton(
      onPressed: () {
        onTap();
      },
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.resolveWith(
          (states) {
            if (states.contains(MaterialState.pressed)) {
              return Color.fromARGB(255, 128, 244, 62);
            }
            return Colors.white;
          },
        ),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
         RoundedRectangleBorder(borderRadius: BorderRadius.circular(30),),

      )
       
      ),
      child: Text(
        islogin ? 'Log in ' : 'Sign in',
        style: const TextStyle(
            color: Colors.black87, fontWeight: FontWeight.bold, fontSize: 22),
      ),
    ),
  );
}


//--TEXT FIELD ERROR ---//
resolveerror(context,e)
{
     showDialog(context: context, builder: (context){
                  return AlertDialog(
                      elevation: 8,
                      backgroundColor: Colors.white,
              //  title:  const Text('Error',style:TextStyle(color: Colors.black),),
               
                content: Text(e.toString()),
                  
                );
     }
            );
                 
}
//---checking firebase auth//
