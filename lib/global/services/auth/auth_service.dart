
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {

  // get isntance of fireabsae auth
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  // get current user
  User? getCurrentUser() {
    return _firebaseAuth.currentUser;
  }

  // sign in 
  Future<UserCredential> signInWithEmailAndPassword(String email, password) async {
    // Try sign in user
    try {
      UserCredential userCredential = await _firebaseAuth.signInWithEmailAndPassword(
        email: email, 
        password: password
      );

      return userCredential;

      // catch any erros
    } on FirebaseAuthException catch(err) {
      throw Exception(err.code);
    }
  }

  // sign up

   Future<UserCredential> signUpWithEmailAndPassword(String email, password) async {
    // Try sign in user
    try {
      UserCredential userCredential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email, 
        password: password
      );

      return userCredential;

      // catch any erros
    } on FirebaseAuthException catch(err) {
      throw Exception(err.code);
    }
  }

  // sign out 
  Future<void> signOut() async {
    return await _firebaseAuth.signOut();
  }
}