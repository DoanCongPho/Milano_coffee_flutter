import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_coffee_app/model/remote/city.dart';

class CityRepository {
  final FirebaseFirestore db;
  CityRepository(this.db);

  Stream<List<City>> listenMultipleCity() {
    return db
        .collection("cities")
        .where("capital", isEqualTo: true)
        .withConverter<City>(
          fromFirestore: City.fromFirestore,
          toFirestore: (City city, _) => city.toFirestore(),
        )
        .snapshots()
        .map(
          (querySnapshot) =>
              querySnapshot.docs.map((doc) => doc.data()).toList(),
        );
  }

  Stream<City?> listenCity(String id) {
    return db
        .collection("cities")
        .doc(id)
        .withConverter<City>(
          fromFirestore: City.fromFirestore,
          toFirestore: (City city, _) => city.toFirestore(),
        )
        .snapshots()
        .map((snap) => snap.data());
  }
}
