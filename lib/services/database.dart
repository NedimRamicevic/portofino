import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:portofino/models/brew.dart';
import 'package:portofino/models/user.dart';

class DataBaseService {
  // reference to collection
  final CollectionReference brewCollection =
      FirebaseFirestore.instance.collection("brew");

  final String uid;

  DataBaseService({required this.uid});

  Future updateUser(
      {String name = "new member",
      String sugar = "0",
      int strength = 100}) async {
    return await brewCollection.doc(uid).set(
        {'name': name, 'sugar': sugar, 'strength': strength},
        SetOptions(merge: true));
  }

  List<Brew> _brewListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((e) {
      return Brew(name: e['name'], sugar: e["sugar"], strength: e["strength"]);
    }).toList();
  }

  UserData _userDataSnapshot(DocumentSnapshot snapshot) {
    return UserData(
        uid: uid,
        name: snapshot.data()["name"],
        sugars: snapshot.data()["sugar"],
        strength: snapshot.data()["strength"]);
  }

  Stream<List<Brew>> get brews {
    return brewCollection.snapshots().map(_brewListFromSnapshot);
  }

  Stream<UserData> get userData {
    return brewCollection.doc(uid).snapshots().map(_userDataSnapshot);
  }
}
