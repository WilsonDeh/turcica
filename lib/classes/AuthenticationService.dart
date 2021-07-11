import 'package:firebase_auth/firebase_auth.dart';

class AuthenticationService {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  Stream<User?> get authStateChanges => firebaseAuth.authStateChanges();

  //getCurrentUser
  getCurrentUser<User>() {
    return firebaseAuth.currentUser;
  }

  //signedIn

  //AuthenticationService(this.firebaseAuth);

  //create user
  Future<String?> signUp(String email, String password) async {
    try {
      await firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      return "Signed Up";
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }

  //sign in
  Future<String?> signIn(String email, String password) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      return "Signed In";
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
  }

  //signOut
  Future<void> signOut() async {
    await firebaseAuth.signOut();
  }

  //Delete User
  Future<void> delete() async {
    try {
      await FirebaseAuth.instance.currentUser!.delete();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'requires-recent-login') {
        print(
            'The user must reauthenticate before this operation can be executed.');
      }
    }
  }

  //authState

}
