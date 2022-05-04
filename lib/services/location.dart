import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skilled_worker_app/shared/bottom_navigation.dart';
import 'package:skilled_worker_app/screens/worker_list/worker_card.dart';
import 'package:skilled_worker_app/models/worker.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:geocoding/geocoding.dart';
import 'package:uuid/uuid.dart';



class Locationdb{

  final CollectionReference userCollection = FirebaseFirestore.instance.collection("worker");
  var uuid = Uuid();


  Future<List<Location>> getAllWorkersAndAddLongLat() async{

    QuerySnapshot querySnapshot =await userCollection.get() as QuerySnapshot<Object?>;
    final allData = querySnapshot.docs.map((doc) => doc.data()).toList();

    for (var i=0; i<allData.length; i++){
      Map worker = allData[i] as Map;
      String address = worker['address'];
      print(address);

      List<Location> locations = await locationFromAddress(address);
      double latitute = locations[0].latitude;
      double longitude = locations[0].longitude;
      print("lat ${latitute} long ${longitude}");

      await updateWorkersData(worker['name'], worker['rate'], worker['category'], worker['address'], latitute, longitude);

    }




    print(allData[0]);
    Map worker = allData[0] as Map;
    // print();

    List<Location> locations = await locationFromAddress(worker['address']);
    print(locations);
    return locations;


    // var addresses = await Geocoder.local.findAddressesFromQuery(worker['address']);
    // var first = addresses.first;
    // print("${first.featureName} : ${first.coordinates}");
  }

  Future updateWorkersData(String name, int rate, String category, String address, double latitude, double longitude) async {
    return await FirebaseFirestore.instance.collection("workers").doc(uuid.v4()).set({
      "name":name,
      "rate":rate,
      "category": category,
      "address": address,
      "latitude": latitude,
      "longitude":longitude

    });
  }
}