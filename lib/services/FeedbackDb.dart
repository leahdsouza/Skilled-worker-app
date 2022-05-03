
import 'package:uuid/uuid.dart';
import 'package:provider/provider.dart';
import 'package:skilled_worker_app/models/user_detail.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/user.dart';

class FeedbackDb {

  List<Map> listOfMaps = [
   {"name":"Monaj Yadav","rate":400,"category":"Plumber","address":"42 -b-c Mahavir Bldg Navneet Showroom Bhandark Matunga, Mumbai,Mumbai,400019,India"},
  ];

  var uuid = Uuid();

  // collection reference
  final CollectionReference userCollection = FirebaseFirestore.instance.collection("feedback");

  Future updateFeedbackData(String feedback, double rating, String? uid) async {
    return await userCollection.doc(uuid.v4()).set({
      "feedback":feedback,
      "rating":rating,
      "uid": uid

    });
  }

  Future updateWorkerData(String name, int rate, String category, String address) async {
    return await FirebaseFirestore.instance.collection("worker").doc(uuid.v4()).set({
      "name":name,
      "rate":rate,
      "category": category,
      "address": address

    });
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

  }







}