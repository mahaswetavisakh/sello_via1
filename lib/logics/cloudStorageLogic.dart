import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';

class CloudStorageLogic{
 final FirebaseStorage storage = FirebaseStorage.instance;
 final String folderName;
 final String fileName;
 final File file;

 CloudStorageLogic({required this.fileName,required this.file,required this.folderName});


 Future<String> uploadFile() async {
  Reference reference = storage.ref('$folderName/$fileName');
  final TaskSnapshot snapshot = await reference.putFile(file);
  final downloadUrl = await snapshot.ref.getDownloadURL();
  return downloadUrl;
 }
}