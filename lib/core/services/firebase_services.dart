import 'package:ammlagbe/core/constants/firebase_constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirestoreService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> saveUserData({
    required String uid,
    required String email,
    required String username,
    required String? password,
  }) async {
    await _firestore
        .collection(FirebaseConstants.usersCollection)
        .doc(uid)
        .set({
          'username': username,
          'email': email,
          'password': password,
          'created_at': FieldValue.serverTimestamp(),
        });
    await _firestore
        .collection(FirebaseConstants.userInfoCollection)
        .doc(uid)
        .set({'username': username});
  }

  Future<Map<String, dynamic>> getUserData(String uid) async {
    DocumentSnapshot doc =
        await _firestore
            .collection(FirebaseConstants.usersCollection)
            .doc(uid)
            .get();
    return doc.data() as Map<String, dynamic>;
  }

  // Future<void> updateUserData({
  //   required String uid,
  //   required String username,
  // }) async {
  //   await _firestore
  //       .collection(FirebaseConstants.usersCollection)
  //       .doc(uid)
  //       .update({
  //         'username': username,
  //         'updated_at': FieldValue.serverTimestamp(),
  //       });
  // }

  // Fetch the username from Firestore
  Future<String> getUsername(String uid) async {
    final doc = await _firestore.collection('user_auth').doc(uid).get();
    if (doc.exists) {
      return doc.data()?['username'] ?? 'Unknown User';
    } else {
      throw Exception('User document does not exist.');
    }
  }

  // Get the current user's UID
  String getCurrentUserId() {
    final user = _auth.currentUser;
    if (user != null) {
      return user.uid;
    } else {
      throw Exception('No user is currently signed in.');
    }
  }

  // Future<Map<String, dynamic>> getUserData(String uid) async {
  //   final doc = await _db.collection('user_info').doc(uid).get();
  //   return doc.data() ?? {};
  // }

  Future<Map<String, dynamic>> getUserInfo(String uid) async {
    DocumentSnapshot doc =
        await _firestore
            .collection(FirebaseConstants.userInfoCollection)
            .doc(uid)
            .get();
    return doc.data() as Map<String, dynamic>;
  }

  Future<void> updateUserData({
    required String uid,
    required Map<String, dynamic> updatedData,
  }) async {
    await _firestore
        .collection(FirebaseConstants.userInfoCollection)
        .doc(uid)
        .update(updatedData);
  }
}
