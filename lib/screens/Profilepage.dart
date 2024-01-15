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
    _nameController.text = _authLogics.getUserData().userName!;
    _emailController.text = _authLogics.getUserData().userEmail!;
    _phoneController.text = _authLogics.getUserData().userPhoneNumber ?? "";
    _addressController.text = _authLogics.getUserData().userAddress ?? "";
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
              SizedBox(
                height: 20,
              ),
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
                autoFocus: true,
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
                autoFocus: true,
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
                autoFocus: true,


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
                autoFocus: true,
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
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,

      children: [
        Row(

          children: [
            InkWell(
                onTap: () {
                  Navigator.pushNamed(context, Routes.profileRoute);
                },
                child: const ProfilepicWidget()),
            const SizedBox(
              width: 10,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Align(
                  alignment: Alignment.centerLeft,
                ),
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
          ],
    ),
            IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.close, size: 35),
            ),



      ],
    );
  }
}
