import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sello_via/logics/authLogics.dart';

import 'package:sello_via/widgets/custom_container.dart';
import 'package:sello_via/widgets/navbar.dart';
import '../appConts/routes.dart';
import '../widgets/custom_button.dart';
import '../widgets/customInput.dart';
import '../widgets/loadin_widget.dart';


class LogInscreen extends StatefulWidget {
  @override
  State<LogInscreen> createState() => _LogInscreenState();
}

class _LogInscreenState extends State<LogInscreen> {
  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();


  final FirebaseAuth _auth=FirebaseAuth.instance;


  ValueNotifier passwordVisible=ValueNotifier(true);

  bool _isObscured = true;

  void login(BuildContext context) {
    String email=emailController.text;
    String pwd=passwordController.text;

    if(email.isEmpty){
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Please enter your vaild email address"))
      );
    }
    else if (!isEmailValid(email)) {
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
      _authLogics.login(email: email,password: pwd,context: context);
    }
  }
  bool isEmailValid(String email) {
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    return emailRegex.hasMatch(email);
  }


  AuthLogics _authLogics=Get.put(AuthLogics());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding:
            const EdgeInsets.only(left: 20, right: 20, bottom: 40, top: 50),
        child: ListView(
          children: [
            Topbarlogin(),
            const SizedBox(
              height: 55,
            ),
            const Text(
              "Log In",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 35),
            ), // Log IN

            const SizedBox(
              height: 30,
            ),
            const Text(
              "Sign up with one of the following options",
              style: TextStyle(color: Colors.grey),
            ),
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
                Expanded(
                    child: Divider(
                  indent: 10.0,
                  endIndent: 10.0,
                  thickness: 1,
                  color: Colors.black26,
                )),
                Text(
                  "Or",
                  style: TextStyle(
                    color: Colors.black26,
                  ),
                ),
                Expanded(
                    child: Divider(
                  indent: 10.0,
                  endIndent: 10.0,
                  thickness: 1,
                  color: Colors.black26,
                )),
              ],
            ),
            const SizedBox(
              height: 30,
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

            ),// Email Input field
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
              buttonText: "Log in",
              onTap: (){
                login(context);
              },
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Not Have An Account? "),
                TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, Routes.registerRoute);

                    },
                    child: const Text(
                      "Register",
                      style: TextStyle(color: Colors.red),
                    ))
              ],
            )
          ],
        ),
      ),
    );
  }
}
