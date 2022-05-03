import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skilled_worker_app/shared/bottom_navigation.dart';
import 'package:skilled_worker_app/screens/worker_list/worker_card.dart';
import 'package:skilled_worker_app/models/worker.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:geolocator/geolocator.dart';
import 'package:skilled_worker_app/screens/worker_list/distance.dart';
import 'package:skilled_worker_app/screens/worker_list/Destination.dart';

import '../../shared/loading.dart';

class WorkerListScreen extends StatefulWidget {
  const WorkerListScreen({Key? key}) : super(key: key);

  @override
  State<WorkerListScreen> createState() => _WorkerListScreenState();
}

class _WorkerListScreenState extends State<WorkerListScreen> {


  late Position _currentPosition;
  final CollectionReference userCollection = FirebaseFirestore.instance.collection("worker");
  List<Destination> destinationlist = [];
  List<Destination> destinations = [];


  @override
  void initState() {


    super.initState();

  }

  Future<List<Destination>> getDestinationList() async {

    final arg = ModalRoute.of(context)!.settings.arguments as Map;
    String category = arg["category"];
    final destinationList = await convertWorkerDataToDestination(category);

    destinations = destinationList;
    _getCurrentLocation();
    return distanceCalculation();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("Worker List",style: TextStyle(fontSize: 22 , color: Colors.white, fontWeight: FontWeight.bold)),
        centerTitle: true,
        backgroundColor: Color(0xFF210D41),
      ),
      body: FutureBuilder<List<Destination>>(
        future: getDestinationList(), // function where you call your api
              builder: (BuildContext context, AsyncSnapshot<List<Destination>> snapshot) { // AsyncSnapshot<Your object type>
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Loading();
              }
              else {
                if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
                }
                else {

                return ListView.builder(
                  itemCount:snapshot.data?.length,
                  itemBuilder: (context,index){
                    return WorkerCard(
                      worker: snapshot.data![index],
                      index: index,

                );
              },
            );
          }}}),
    );
  }

  _getCurrentLocation() async {

    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.deniedForever) {
        // Permissions are denied forever, handle appropriately.
        return Future.error(
            'Location permissions are permanently denied, we cannot request permissions.');
      }

      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error(
            'Location permissions are denied');
      }
    }

    print("hi");
    distanceCalculation();
    // await Geolocator.getCurrentPosition(
    //     desiredAccuracy: LocationAccuracy.best,
    //     forceAndroidLocationManager: true)
    //     .then((Position position) {
    //       print(position);
    //   distanceCalculation(position);
    //   setState(() {
    //     _currentPosition = position;
    //     print(_currentPosition);
    //   });
    // }).catchError((e) {
    //   print(e);
    // });
  }
  distanceCalculation() {
    for(var d in destinations){
      var km = getDistanceFromLatLonInKm(19.391928,72.839729, d.lat,d.lng);
      // var m = Geolocator.distanceBetween(position.latitude,position.longitude, d.lat,d.lng);
      // d.distance = m/1000;
      d.distance = km;
      print(km);
      destinationlist.add(d);
      print(destinationlist);
      // print(getDistanceFromLatLonInKm(position.latitude,position.longitude, d.lat,d.lng));
    }
    destinationlist.sort((a, b) {
          return a.distance.compareTo(b.distance);
        });
    return destinationlist;
    // setState(() {
    //   destinationlist.sort((a, b) {
    //     return a.distance.compareTo(b.distance);
    //   });
    // });
  }

}