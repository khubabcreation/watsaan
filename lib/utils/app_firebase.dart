
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
FirebaseAuth firebaseAuth = FirebaseAuth.instance;
FirebaseFirestore fireStore = FirebaseFirestore.instance;


Future signInUser(String email, String password) async {
  UserCredential userCredential = await firebaseAuth.signInWithEmailAndPassword(
      email: email, password: password);

  return userCredential;
}


Future addAdminDetailToFireStore(String firstName, String secondName,
    String email, String cnic, String mobileNo) async {
  // String? superAdminId = await getSuperAdminId();

  await fireStore
  // .collection('users')
  // .doc(superAdminId)
      .collection('admins')
      .doc(cnic)
      .set({
    'firstName': firstName,
    'secondName': secondName,
    'email': email,
    'cnic': cnic,
    'mobileNo': mobileNo,
  });
}