
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sello_via/logics/authLogics.dart';
import 'package:sello_via/widgets/custombuttons.dart';
import 'package:sello_via/widgets/navbar.dart';
import '../appConts/routes.dart';
import '../widgets/custom_button.dart';
import '../widgets/customInput.dart';
import '../widgets/loadin_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';



class RegisterScreen extends StatefulWidget{
  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController nameController=TextEditingController();

  TextEditingController emailController=TextEditingController();

  TextEditingController passwordController=TextEditingController();

  FirebaseFirestore _firestore=FirebaseFirestore.instance;

  ValueNotifier passwordVisible=ValueNotifier(true);

  final FirebaseAuth _auth=FirebaseAuth.instance;
  final FirebaseFirestore _db=FirebaseFirestore.instance;

  FocusNode _nameFocus = FocusNode();
  FocusNode _emailFocus = FocusNode();
  FocusNode _passwordFocus = FocusNode();

  bool _isObscured = true;

 void  createAccount(BuildContext context){
   String name=nameController.text;
   String emailId=emailController.text;
   String pwd=passwordController.text;

   if(name.isEmpty){
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Please enter your full name"))
    );
   }
   else if(emailId.isEmpty){
     ScaffoldMessenger.of(context).showSnackBar(
         const SnackBar(content: Text("Please enter your vaild email address"))
     );
   }
   else if (!isEmailValid(emailId)) {
     ScaffoldMessenger.of(context).showSnackBar(
         const SnackBar(content: Text("Please enter a valid email format")));
   }
   else if(pwd.isEmpty){
     ScaffoldMessenger.of(context).showSnackBar(
         const SnackBar(content: Text("Please enter your vaild password"))
     );
   }
   else{
     showLoading(context);
     AuthLogics().register(email: emailId, password: pwd, name: name, context: context);
   }

  }
  bool isEmailValid(String email) {
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    return emailRegex.hasMatch(email);
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left:20,right: 20,bottom: 40,top: 50),
        child:
        ListView(

          children: [
            Topbarlogin(),
            const SizedBox(
              height: 55,
            ),
            const Text(
              "Sign Up",
              style: TextStyle(fontWeight: FontWeight.bold,fontSize: 35),
            ),

            const SizedBox(
              height: 30,
            ),
            const Text("Sign up with one of the following options",style: TextStyle(color: Colors.grey),),
            const SizedBox(
              height: 20,
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                LoginWithSocial("assets/Google.png"),

                LoginWithSocial('assets/x.png'),

                LoginWithSocial('assets/Apple.png'),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            const Row(
              children: [
                Expanded(child: Divider(
                  indent: 10.0,
                  endIndent: 10.0,
                  thickness: 1,
                  color: Colors.black,
                )),
                Text("Or"),
                Expanded(child: Divider(
                  indent: 10.0,
                  endIndent: 10.0,
                  thickness: 1,
                  color: Colors.black,
                )),
              ],
            ),
            const SizedBox(
              height: 30,
            ),

            CustomInput(
              hint: "Please Enter Your Name",
              controller: nameController,
              textInputAction: TextInputAction.next,
              onSubmitted: (_) {
                FocusScope.of(context).nextFocus();
              },

            ),
            const SizedBox(
              height: 10,
            ),

            CustomInput(
              hint: "Please Enter Your Email",
              controller: emailController,
              textInputAction: TextInputAction.next,
              onSubmitted: (_) {
                FocusScope.of(context).nextFocus();
              },

            ),
            const SizedBox(
              height: 10,
            ),
            CustomInput(
              hint: "Enter your Password",
              controller: passwordController,
              inputType: TextInputType.visiblePassword,
              textInputAction: TextInputAction.done,
              obscureText: _isObscured,
              firstSuffixWidget: IconButton(
                icon: Icon(_isObscured ? Icons.visibility : Icons.visibility_off),
                onPressed: () {
                  setState(() {
                    _isObscured = !_isObscured; // Toggle password visibility
                  });
                },
              ),
            ),
            const SizedBox(
              height: 10,
            ),


            CustomButton(
              buttonText: "Create Account",
              onTap: (){
                createAccount(context);
              },
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Already have an account? "),
                TextButton(onPressed:() {
                  Navigator.pushNamed(context, Routes.loginRoute);
                }, child: const Text("Log In",
                    style: TextStyle(color: Colors.red)))
                // Text("Log in",style: TextStyle(color: Colors.red),),
              ],
            )

          ],
        ),
      ),
    );
  }
}