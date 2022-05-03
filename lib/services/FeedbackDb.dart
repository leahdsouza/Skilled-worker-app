
import 'package:uuid/uuid.dart';
import 'package:provider/provider.dart';
import 'package:skilled_worker_app/models/user_detail.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/user.dart';

class FeedbackDb {

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



  }







