import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sello_via/logics/authLogics.dart';
import 'package:sello_via/widgets/loadin_widget.dart';
import '../logics/cloud_storage_logic.dart';
import '../widgets/custom_button.dart';
import '../widgets/customInput.dart';
import '../appConts/routes.dart';
import '../widgets/profilepic.dart';

class Profilepage extends StatefulWidget {
  @override
  State<Profilepage> createState() => _ProfilepageState();
}

class _ProfilepageState extends State<Profilepage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  final ImagePicker _picker = ImagePicker();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _addressController = TextEditingController();
  TextEditingController _newPasswordController = TextEditingController();

  FirebaseStorage storage = FirebaseStorage.instance;
  String? photoUrl;
  XFile? _selectedImage;
  final AuthLogics _authLogics = AuthLogics();



  @override
  void initState() {
    super.initState();
    _authLogics.getUserData().then((value) {
      setState(() {
        _nameController.text = _authLogics.user!.userName!;
        _emailController.text = _authLogics.user!.userEmail!;
        _phoneController.text = _authLogics.user!.userPhoneNumber ?? "";
        _addressController.text = _authLogics.user!.userAddress ?? "";
        print(_authLogics.user!.toMap());
      });
    });
  }

  void updateProfile() async {
    if (_nameController.text.isEmpty) {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("Please enter your name")));
    } else if (_emailController.text.isEmpty) {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("Please enter your email")));
    } else if (_phoneController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Please enter your mobile number")));
    }
    else if (_phoneController.text.length != 13 ||
        !_phoneController.text.startsWith('+')) {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Please ensure the phone number has a country code and is 10 digits")));
    } else {
      showLoading(context);
      await _authLogics.updateUserName(_nameController.text);
      await _authLogics.updateUserPhoneNumber(_phoneController.text);
      await _authLogics.updateUserAddress(_addressController.text);


      Navigator.pop(context);
      setState(() {ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("Profile updated successfully"),
        duration: Duration(seconds: 2), // Adjust the duration as needed
      ));});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: ListView(
            children: [
              appBar(),
              const Text(
                "Name:",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              CustomInput(
                hint: "Enter your name",
                controller: _nameController,
                textInputAction: TextInputAction.next,
                onSubmitted: (_) {
                  FocusScope.of(context).nextFocus();
                },

              ),
              const SizedBox(
                height: 12,
              ),
              const Text(
                "Email:",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              CustomInput(
                readOnly: true,
                hint: "Email",
                controller: _emailController,
                textInputAction: TextInputAction.next,
                onSubmitted: (_) {
                  FocusScope.of(context).nextFocus();
                },
              ),
              const SizedBox(
                height: 12,
              ),
              const Text(
                "PhoneNumber:",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              CustomInput(
                hint: "Phone number",
                controller: _phoneController,
                inputType: TextInputType.phone,
                textInputAction: TextInputAction.next,
                onSubmitted: (_) {
                  FocusScope.of(context).nextFocus();
                },


              ),
              const SizedBox(
                height: 12,
              ),
              const Text(
                "Address:",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              CustomInput(
                hint: "Enter your Address",
                controller: _addressController,
                textInputAction: TextInputAction.done,
              ),
              const SizedBox(
                height: 12,
              ),
              // Text(
              //   "Change Password:",
              //   style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              // ),
              // CustomInput(
              //   hint: "Enter your New Password",
              //   controller: _newPasswordController,
              // ),
              const SizedBox(
                height: 26,
              ),
              CustomButton(
                buttonText: "Update Profile",
                onTap: () {
                  updateProfile();
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget appBar() {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.13,
      width: MediaQuery.of(context).size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.6,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, Routes.profileRoute);
                    },
                    child: const ProfilepicWidget()),
                const SizedBox(
                  width: 10,
                ),
                Flexible(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        _authLogics.user!.userName!,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        softWrap: true,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.red,
                            fontSize: 20),
                      ),
                      Text(_auth.currentUser!.email!)
                    ],
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            right: 0,
            child: IconButton(
              iconSize: 30,
              icon: const Icon(Icons.login),
              onPressed: () async {
                _auth.signOut();
                await _authLogics.logOut();
                Navigator.pushNamed(context, Routes.loginRoute);
              },
            ),
          )
        ],
      ),
    );
  }
}
