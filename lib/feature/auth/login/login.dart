
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tasks/feature/auth/register/register.dart';
import 'package:tasks/feature/auth/widget/default_button.dart';
import 'package:tasks/feature/auth/widget/textformfield.dart';
import 'package:tasks/feature/auth/widget/validation.dart';
import 'package:tasks/feature/home/home.dart';


class Login extends StatefulWidget{
 static const  String routeName="login";

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController  passwordController =TextEditingController();
  TextEditingController  EmailController =TextEditingController();
  var formKey=GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Scaffold(
        backgroundColor: Colors.grey,
        appBar: AppBar(backgroundColor: Colors.transparent ,title: Text("Login",style: Theme.of(context).textTheme.displayLarge,),centerTitle: true,),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
            children: [
              DefaultTextFormField(title: "Password",controller: passwordController,validator: validation.password ),
              DefaultTextFormField(title: "Email",controller: EmailController, validator: validation.email,),

               SizedBox(height: MediaQuery.of(context).size.height * 0.20,),
              DefaultButton(onPressed: (){
                if (formKey.currentState!.validate()) {
                  Login();
                }

              },title: "Login",),


              SizedBox(height: 10,),

              InkWell(
                  onTap: (){Navigator.of(context).pushNamed(Register.routeName);},
                  child: Text("Create an account",style: Theme.of(context).textTheme.displaySmall,)),
            ],
        ),

      ),
    );
  }
  void Login(){
      Navigator.of(context).pushNamed(Home.routeName);

  }

}