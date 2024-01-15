import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ChatLogic {
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;


  Future<void> addMessage(String id,
      String message,
      String time,
      ) async {
    final user = FirebaseAuth.instance.currentUser;
    await firebaseFirestore.collection('chats').doc(id)
        .collection('messages')
        .add(
        {
          'username': user!.displayName,
          'E-mail': user.email,
          'Profile pic': user.photoURL,
          'Message': message,
          'Time': time
        }
    )
        .then((value) {
      firebaseFirestore.collection('chats').doc(id).update({


        'time': time,
        'last message': message,
        'last user': user.displayName!.substring(
            0, user.displayName!.indexOf('')),
        'last user email': user.email,
      });
    });
  }
}
