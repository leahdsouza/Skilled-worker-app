import 'package:skilled_worker_app/models/worker.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uuid/uuid.dart';

class WorkerDb{

  final CollectionReference userCollection = FirebaseFirestore.instance.collection("workers");

  List<Map> listOfMaps = [
    {"name":"Monaj Yadav","rate":400,"category":"Plumber","address":"42 -b-c Mahavir Bldg Navneet Showroom Bhandark Matunga, Mumbai,Mumbai,400019,India"},
  ];
  var uuid = Uuid();

  void getAllWorkers() async{

    QuerySnapshot querySnapshot =await userCollection.get() as QuerySnapshot<Object?>;
    final allData = querySnapshot.docs.map((doc) => doc.data()).toList();

    print(allData);
  }

  Future<List> getAllWorkerCategoryWise(String category) async{

    QuerySnapshot querySnapshot =await userCollection.where("category", isEqualTo: category).get() as QuerySnapshot<Object?>;
    final allData = querySnapshot.docs.map((doc) => doc.data()).toList();

    return allData;
  }

  Future<String> getWorker(String name) async{

    QuerySnapshot querySnapshot =await userCollection.where("name", isEqualTo: name).get() as QuerySnapshot<Object?>;
    final allData = querySnapshot.docs.map((doc) => doc.data()).toList();
    // for (var snapshot in querySnapshot.docs) {
    //   var documentID = snapshot.id;
    //   print(documentID.runtimeType);// <-- Document ID
    // }
    var docID = querySnapshot.docs[0].id;
    print("Document id:${docID}");
    print(allData);
    return docID;
  }

  Future<List> getWorkerLowestRate() async{

    QuerySnapshot querySnapshot =await userCollection.orderBy("rate", descending: true).limit(10).get() as QuerySnapshot<Object?>;
    final allData = querySnapshot.docs.map((doc) => doc.data()).toList();

    return allData;
  }



  Future updateWorkerData(String name, int rate, String category, String address) async {
    return await FirebaseFirestore.instance.collection("worker").doc(uuid.v4()).set({
      "name":name,
      "rate":rate,
      "category": category,
      "address": address

    });
  }

  Future addReview(String docID,String review,String username,double rating) async{
    await FirebaseFirestore.instance.collection("workers").doc(docID).collection("reviews").doc(uuid.v4()).set({
      "review":review,
      "username":username,
      "rating":rating,

    });
  }
  Future<List> getAllReviews(String docID) async{


    QuerySnapshot querySnapshot =await FirebaseFirestore.instance.collection("workers").doc(docID).collection("reviews").get() as QuerySnapshot<Object?>;
    final allData = querySnapshot.docs.map((doc) => doc.data()).toList();

    print(allData);
    return allData;
  }

  Future addWorkerData() async{

    for (var i = 0; i < listOfMaps.length; i++) {
      // TO DO
      var currentElement = listOfMaps[i];
      print(i);

      await updateWorkerData(currentElement["name"], currentElement["rate"], currentElement["category"], currentElement["address"]);
      print(currentElement["name"]);
      print(currentElement["rate"]);
      print(currentElement["category"]);
      print(currentElement["address"]);
    }

  List<Worker> _brewListFromSnapshots(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      return Worker(
        name: doc.get('name') ?? '',
        address: doc.get('address') ?? '',
        category: doc.get('category') ?? '',
        rate: doc.get('rate') ?? 0,

      );
    }).toList();
  }





  }}