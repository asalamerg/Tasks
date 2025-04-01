import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:tasks/feature/auth/data/user_provder.dart';
import 'package:tasks/feature/auth/widget/default_button.dart';
import 'package:tasks/feature/auth/widget/validation.dart';
import 'package:tasks/feature/home/home.dart';


import '../data/firebaseFunctionUser.dart';
import '../widget/textformfield.dart';

class Register extends StatefulWidget{
 static const String routeName="register";

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  TextEditingController  passwordController =TextEditingController();
  TextEditingController  EmailController =TextEditingController();
  TextEditingController NameController =TextEditingController();
  TextEditingController  idController =TextEditingController();
  var formKey=GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key:formKey ,
      child: Scaffold(
        backgroundColor: Colors.grey,
        appBar: AppBar(title: Text("Register" ,style: Theme.of(context).textTheme.displayLarge,),centerTitle: true,),
        body: SingleChildScrollView(
          child: Column(
             mainAxisAlignment: MainAxisAlignment.center,
            children: [
            DefaultTextFormField(title: "Name",controller: NameController,validator: validation.name, ),
            DefaultTextFormField(title: "Email",controller: EmailController, validator: validation.email,),
            DefaultTextFormField(title: "Password",controller: passwordController,validator: validation.password, ),
            DefaultTextFormField(title: "ID",controller: idController, validator: validation.id,),
              SizedBox(height: MediaQuery.of(context).size.height * 0.10,),
              DefaultButton(onPressed: register,title: "Register",),
          
          
          
          ],),
        ),
      ),
    );
  }
  void register(){
    if (formKey.currentState!.validate()) {
      FunctionFirebaseUser.RegisterAccount(
          EmailController.text,
          NameController.text,
          idController.text,
          passwordController.text).
      then((user){
        Provider.of<UserProvider>(context ,listen: false).UpdateUser(user);
        Navigator.of(context).pushReplacementNamed(Home.routeName);
      }).
      catchError((error){
        String ? messages ;
        if(error is FirebaseAuthException){
          messages =error.message;
        }
        Fluttertoast.showToast(
            msg: messages ??  "error",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.blue,
            textColor: Colors.white,
            fontSize: 16.0
        );
      });

    }
  }

}