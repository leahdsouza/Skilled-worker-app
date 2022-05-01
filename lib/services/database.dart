import 'package:skilled_worker_app/models/user_detail.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {

  late String? uid;
  DatabaseService({ required this.uid});

  // collection reference
  final CollectionReference userCollection = FirebaseFirestore.instance.collection("users");

  Future updateUserData(String address, String name, String phoneNumber) async {
    return await userCollection.doc(uid).set({
      "name":name,
      "address":address,
      "phoneNumber":phoneNumber,
    }); 
  }

  // // brew list from snapshots
  // List<UserDetail> _brewListFromSnapshots(QuerySnapshot snapshot){
  //   return snapshot.docs.map((doc){
  //     return UserDetail(
  //       name: doc.get('name') ?? '',
  //       address: doc.get('address') ?? '',
  //       phoneNumber: doc.get('phoneNumber') ?? '0',
  //
  //     );
  //   }).toList();
  // }
  //
  // //
  // UserDetail _currentUserDetailFromSnapshots(QuerySnapshot snapshot){
  //   for (var queryDocumentSnapshot in snapshot.docs) {
  //     Map<String, dynamic> data = queryDocumentSnapshot.getData();
  //     var name = data['name'];
  //     var phone = data['phone'];
  //   }
  // }
  //
  // // get brew stream
  // Stream<List<UserDetail>?> get users{
  //   return userCollection.snapshots()
  //       .map(_brewListFromSnapshots);
  // }
  //
  // // current details stream
  // Stream<UserDetail>? get currentuser{
  //   return userCollection.doc(uid).snapshots()
  //       .map(_currentUserDetailFromSnapshots);
  // }

  Future<UserDetail> getUser() async{

    String name,address, phoneNumber;

    var documentSnapshot = await userCollection
        .doc(uid)
        .get();
    if (documentSnapshot.exists) {
      Map<String, dynamic>? data = documentSnapshot.data() as Map<String, dynamic>?;


        print('Document exists on the database');
        print('Document data:${documentSnapshot.data()}');
    }



    return UserDetail(
      name: documentSnapshot.get(FieldPath(['name'])),
      address: documentSnapshot.get(FieldPath(['address'])),
      phoneNumber: documentSnapshot.get(FieldPath(['phoneNumber']))

    );
  }


}