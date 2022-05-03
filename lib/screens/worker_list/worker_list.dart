import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skilled_worker_app/shared/bottom_navigation.dart';
import 'package:skilled_worker_app/screens/worker_list/worker_card.dart';
import 'package:skilled_worker_app/models/worker.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class WorkerListScreen extends StatefulWidget {
  const WorkerListScreen({Key? key}) : super(key: key);

  @override
  State<WorkerListScreen> createState() => _WorkerListScreenState();
}

class _WorkerListScreenState extends State<WorkerListScreen> {


  final CollectionReference userCollection = FirebaseFirestore.instance.collection("worker");



  @override
  Widget build(BuildContext context) {

    final arg = ModalRoute.of(context)!.settings.arguments as Map;

    print(arg["category"]);
    String category = arg["category"];

    return Scaffold(
      appBar: AppBar(),
      body: StreamBuilder(
          stream: userCollection.where("category", isEqualTo: category).snapshots(),
          builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){
            if (snapshot.hasError) {
              return Text('Something went wrong');
            }

            if (snapshot.connectionState == ConnectionState.waiting) {
              return Text("Loading");
            }

            return ListView.builder(
              itemCount:snapshot.data?.docs.length,
              itemBuilder: (context,index){
                return WorkerCard(
                  worker: Worker(
                    name: snapshot.data?.docs[index]['name'],
                    address: snapshot.data?.docs[index]['address'],
                    rate: snapshot.data?.docs[index]['rate'],
                    category: snapshot.data?.docs[index]['category'],
                  ),
                  index: index,

                );
              },
            );
          }),
    );
  }
}