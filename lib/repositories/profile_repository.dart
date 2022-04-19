import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth_bloc/constants/db_constants.dart';
import 'package:firebase_auth_bloc/models/custom_error.dart';

import '../models/user_model.dart';

class ProfileRepository {
  final FirebaseFirestore firebaseFirestore;
  ProfileRepository({
    required this.firebaseFirestore,
  });

  Future<User> getProfile({
    required String uid,
  }) async {
    try {
      final DocumentSnapshot userDoc = await usersRef.doc(uid).get();

      if (userDoc.exists) {
        final currentUser = User.fromDoc(userDoc);
        return currentUser;
      }

      throw 'User does not exist';
    } on FirebaseException catch (e) {
      throw CustomError(
        message: e.message!,
        code: e.plugin,
      );
    } catch (e) {
      throw CustomError(
          code: 'Exception',
          message: e.toString(),
          plugin: 'flutter_error/server_error');
    }
  }
}
