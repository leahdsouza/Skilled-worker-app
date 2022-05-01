import 'package:firebase_auth/firebase_auth.dart';
import 'package:skilled_worker_app/models/user.dart';



class AuthService {

  final FirebaseAuth _auth = FirebaseAuth.instance;

  // sign in using phone number


  // create a user obj

  MyUser? userFromFirebase ( User user){
    return user!= null ? MyUser(uid: user.uid) : null;
  }

  // auth changes user streams

  Stream<MyUser?> get user{
    return _auth.authStateChanges().map((User? user) => userFromFirebase(user!));
  }

  // sign in anon
  Future SignInAnon() async{
    try{
      UserCredential userCredential = await _auth.signInAnonymously();
      User user = userCredential.user!;

      return userFromFirebase(user);


    }catch(e){
      print(e.toString());
      return null;

    }

  }



  // sign in email and password
  Future signInWithEmailAndPassword(String email, String password) async{
    try{
      UserCredential result = await _auth.signInWithEmailAndPassword(email: email, password: password);
      User user = result.user!;

      return userFromFirebase(user);
    }catch(e){
      print(e.toString());
      return null;
    }
  }

  // register with email and password

  Future registerWithEmailAndPassword(String email, String password) async {
    try{
      UserCredential result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      User user = result.user!;

      // create a new document for the user with the uid

      // await DatabaseService(uid: user.uid).updateUserData("0", "New crew member", 100);

      return userFromFirebase(user);
    }catch(e){
      print(e.toString());
      return null;
    }
  }

  // logout

  Future signOut() async {

    try{
      return await _auth.signOut();
    }catch(e){
      print(e.toString());
      return null;
    }

  }


}

