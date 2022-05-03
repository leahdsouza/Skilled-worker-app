import 'package:skilled_worker_app/models/worker.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class WorkerDb{

  final CollectionReference userCollection = FirebaseFirestore.instance.collection("worker");



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

  // Future<List<Worker>> getCarpenters() async {
  //
  //   return await userCollection.where("category", isEqualTo: "Carpenter").get();
  // }
  //
  // Stream<List<Worker>?> get maids{
  //   return userCollection.where("category", isEqualTo: "Maid").snapshots().map(_brewListFromSnapshots);
  // }
  //
  // Stream<List<Worker>?> get electricians{
  //   return userCollection.where("category", isEqualTo: "Electrician").snapshots().map(_brewListFromSnapshots);
  // }
  //
  // Stream<List<Worker>?> get pest{
  //   return userCollection.where("category", isEqualTo: "Pest Control").snapshots().map(_brewListFromSnapshots);
  // }
  //
  // Stream<List<Worker>?> get cleaning{
  //   return userCollection.where("category", isEqualTo: "Cleaning").snapshots().map(_brewListFromSnapshots);
  // }
  // Stream<List<Worker>?> get plumbers{
  //   return userCollection.where("category", isEqualTo: "Plumber").snapshots().map(_brewListFromSnapshots);
  // }
  //
  // Stream<List<Worker>?> get drivers{
  //   return userCollection.where("category", isEqualTo: "Driver").snapshots().map(_brewListFromSnapshots);
  // }
  //
  // Stream<List<Worker>?> get painters{
  //   return userCollection.where("category", isEqualTo: "Painter").snapshots().map(_brewListFromSnapshots);
  // }




  }