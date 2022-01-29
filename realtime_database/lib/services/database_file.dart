
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:realtime_database/models/brew_model.dart';
import 'package:realtime_database/models/user.dart';


class DatabaseService{
  final uid ;
  DatabaseService({this.uid});
  //collection reference
  final CollectionReference brewCollection = FirebaseFirestore.instance.collection('brews');

  //updating the data
  Future updateUserData(String sugars ,String name , int strength )async{
   return await brewCollection.doc(uid).set({
     'sugars':sugars,
     'name':name,
     'strength':strength,
   });

    }

  //brew list from snapshot of fireBase store
  List<Brew> _brewListFromSnapshot(QuerySnapshot snapshot) {
    // print(snapshot.docs.length); // return 0.
    // print(snapshot.docs.toString()); // here this returns [].
    return snapshot.docs.map( (doc) {
      return Brew(
        name: doc.data().toString().contains('name') ? doc['name'] : '',
        strength:doc.data().toString().contains('strength') ? doc['strength'] : 0,
        sugars:doc.data().toString().contains('sugars') ? doc['sugars'] : '0',
      );
    }).toList();
  }

  //get brews strem
  Stream<List<Brew>> get brews {
    return brewCollection.snapshots()
        .map(_brewListFromSnapshot);
  }

  //UserData from SnapShot
  UserData _userDataFromSnapshot(DocumentSnapshot snapshot){
    return UserData(
        uid: uid,
        name: snapshot.data().toString().contains('name') ? snapshot['name'] : '',
        sugars: snapshot.data().toString().contains('sugars') ? snapshot['sugars'] : '0',
        strength: snapshot.data().toString().contains('strength') ? snapshot['name'] : 0,
            );
  }

  //UserData model to take data of loginIn User only
  Stream<UserData> get userData{
    return brewCollection.doc(uid).snapshots().map(_userDataFromSnapshot);
  }



}