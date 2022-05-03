import'dart:math' as Math;
import 'package:skilled_worker_app/screens/worker_list/Destination.dart';
import 'package:skilled_worker_app/services/workerDb.dart';

//HaverSine formula
double getDistanceFromLatLonInKm(lat1,lon1,lat2,lon2) {
  var R = 6371; // Radius of the earth in km
  var dLat = deg2rad(lat2-lat1);  // deg2rad below
  var dLon = deg2rad(lon2-lon1);
  var a =
      Math.sin(dLat/2) * Math.sin(dLat/2) +
          Math.cos(deg2rad(lat1)) * Math.cos(deg2rad(lat2)) *
              Math.sin(dLon/2) * Math.sin(dLon/2)
  ;
  var c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1-a));
  var d = R * c; // Distance in km
  return d;
}

double deg2rad(deg) {
  return deg * (Math.pi/180);
}

Future<List<Destination>> convertWorkerDataToDestination(String category) async{

  WorkerDb db = new WorkerDb();
  List<Destination> destinations = [];

  List workers = await db.getAllWorkerCategoryWise(category);

  for (var i=0; i<workers.length; i++){
    Map worker = workers[i] as Map;
    String address = worker['address'];
    print(address);
    destinations.add(
      Destination(worker['latitude'], worker['longitude'], worker['name'], 0 , address, worker['category'], worker['rate'])
    );


  }

  return destinations;

}
