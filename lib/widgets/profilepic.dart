import 'dart:io';
import 'package:get/get.dart';

import '../logics/authLogics.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../logics/cloud_storage_logic.dart';
import 'loadin_widget.dart';

class ProfilepicWidget extends StatefulWidget {
  const ProfilepicWidget({super.key});

  @override
  State<ProfilepicWidget> createState() => _ProfilepicWidgetState();
}

class _ProfilepicWidgetState extends State<ProfilepicWidget> {
  AuthLogics authLogics = Get.put(AuthLogics());

  final FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseStorage storage = FirebaseStorage.instance;
  String? photoUrl;
  XFile? _selectedImage;

  final ImagePicker _picker = ImagePicker();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    authLogics.getUserData();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        _selectedImage = await _picker.pickImage(
            source: ImageSource.gallery);

        // TODO = add condition
        if (_selectedImage != null) {
          showLoading(context);

          photoUrl = await CloudStorageLogic(
              file: File(_selectedImage!.path),
              fileName: "${_selectedImage!.name}.png",
              folderName: "users"
          ).uploadFile();


          if (photoUrl != null) {
            await authLogics.updateUserProfile(photoUrl!);
          }
          Navigator.pop(context);

          setState(() {});
        }
      },
      child: Container(
          height: 60,
          width: 60,
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
              : GetBuilder<AuthLogics>(builder: (logic) {
            return CircleAvatar(
              backgroundImage: NetworkImage(
                  authLogics.user!.userprofileUrl!),
              foregroundColor: Colors.grey,
            );
          })),
    );
  }
}

