import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/car.dart';

class FirebaseCarDataStore {
  final FirebaseFirestore firestore;

  FirebaseCarDataStore({required this.firestore});

  Future<List<Car>> getCars() async {
    var snapshot = await firestore.collection("Cars").get();
    return snapshot.docs.map((e) => Car.fromMap(e.data())).toList();
  }
}
