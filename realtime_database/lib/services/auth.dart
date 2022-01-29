
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:realtime_database/models/user.dart';
import 'package:realtime_database/services/database_file.dart';

class AuthService{

  final FirebaseAuth _auth = FirebaseAuth.instance;
  //create userobject based on firebase object
  //nullabletype miantype?
  UserModel? _userFromFirebaseUser(User? user){
  return user!=null ? UserModel(uid: user.uid) : null;
  }

  //auth user change strem
  Stream<UserModel?> get  user {
    return _auth.authStateChanges()
        .map(_userFromFirebaseUser);
  }

  //sign as anon
  Future signInAnon() async{
    try{
      // AuthResult is replaced with UserCredential
       UserCredential result = await  _auth.signInAnonymously();
       User? user = result.user;
       return _userFromFirebaseUser(user!);
    }
    catch(e){
       print(e.toString());
       return null;
    }

  }

  //sign using with email password
  Future signInWithEmailAndPassword(String email, String password)async{
    try{
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email,
          password: password);
      User? user = result.user;
      return _userFromFirebaseUser(user);
    }catch(e){
      print(e.toString());
      return null;
    }
  }

  // register with email
  Future registerWithEmailAndPassword(String email, String password)async{
  try{
    UserCredential result = await _auth.createUserWithEmailAndPassword(
      email: email,
      password: password);
    User? user = result.user;

    //crearting database
    await DatabaseService(uid: user?.uid).updateUserData(
        '0', 'new_user', 100);
    return _userFromFirebaseUser(user);
  }catch(e){
    print(e.toString());
    return null;
  }
  }

  //sign out
    Future signOut() async{

    try{
    return await _auth.signOut();
    }
    catch(e){
      print(e.toString());
      return null;
    }

}
}