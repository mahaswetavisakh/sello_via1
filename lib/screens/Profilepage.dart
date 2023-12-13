import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sello_via/logics/authLogincs.dart';
import 'package:sello_via/widgets/loadin_widget.dart';
import '../logics/cloudStorageLogic.dart';
import '../widgets/customButton.dart';
import '../widgets/customInput.dart';
import '../appConts/routes.dart';

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

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _nameController.text = _auth.currentUser!.displayName!;
    _emailController.text = _auth.currentUser!.email!;
    if(_auth.currentUser!.phoneNumber!=null){
      _phoneController.text = _auth.currentUser!.phoneNumber!;
    }

  }

  void updateProfile()async{
    if(_nameController.text.isEmpty){
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content:Text("Please enter your name") )
      );
    }else if(_emailController.text.isEmpty){
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content:Text("Please enter your email") )
      );
    }else if(_phoneController.text.isEmpty){
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content:Text("Please enter your mobile number") )
      );
    }else{
      AuthLogics().updateUser(
        isUpdate: true,
        profileUrl: photoUrl,
        name: _nameController.text,
        phoneNumber: _phoneController.text,
        address: _addressController.text
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: ListView(
            //mainAxisAlignment: MainAxisAlignment.start,
           // crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              appBar(),

              Text("Name:",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
              CustomInput(
                hint: "Enter your name",
                controller: _nameController,
              ),

              const SizedBox(
                height: 12,
              ),
              Text("Email:",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
              CustomInput(
                readOnly: true,
                hint: "Email",
                controller: _emailController,
              ),

              const SizedBox(
                height: 12,
              ),
              Text("PhoneNumber:",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
              CustomInput(
                hint: "Phone number",
                controller: _phoneController,
              ),

              const SizedBox(
                height: 12,
              ),
              Text("Address:",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
              CustomInput(
                hint: "Enter your Address",
                controller: _addressController,
              ),


              const SizedBox(
                height: 12,
              ),
              Text("Change Password:",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
              CustomInput(
                hint: "Enter your New Password",
                controller: _newPasswordController,
              ),



              const SizedBox(
                height: 26,
              ),
              CustomButton(
                buttonText: "Update Profile",
                onTap: (){
                  updateProfile();
                },
              )
            ],
          ),
        ),
      ),
    );
  }


  Widget appBar(){
    return SizedBox(
      height:  MediaQuery.of(context).size.height*0.13,
      width: MediaQuery.of(context).size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width*0.6,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InkWell(
                  onTap: () async {
                    _selectedImage = await _picker.pickImage(
                        source: ImageSource.gallery);

                    showLoading(context);

                     photoUrl = await CloudStorageLogic(
                      file: File(_selectedImage!.path),
                      fileName: "${_selectedImage!.name}.png",
                      folderName: "users"
                    ).uploadFile();

                    print("URL===${photoUrl}");
                    await _auth.currentUser!.updatePhotoURL(photoUrl);
                    Navigator.pop(context);

                    setState(() {});
                  },
                  child: Container(
                      height: 50,
                      width: 50,
                      padding: const EdgeInsets.all(2),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                              color: Colors.black, width: 3)),
                      child: _auth.currentUser!.photoURL == null
                          ? const Icon(
                        Icons.account_circle_rounded,
                        size: 40,
                      )
                          : CircleAvatar(
                        backgroundImage: NetworkImage(
                            _auth.currentUser!.photoURL!),
                        foregroundColor: Colors.grey,
                      )),
                ),
                const SizedBox(
                  width: 5,
                ),


                Flexible(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                       Text(
                        _auth.currentUser!.displayName!,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        softWrap: true,
                        style: TextStyle(
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
              onPressed: () {
                _auth.signOut();
                Navigator.pushNamed(context, Routes.loginRoute);
              },
            ),
          )
        ],
      ),
    );
  }
}
