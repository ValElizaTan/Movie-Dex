import "package:cloud_firestore/cloud_firestore.dart";
import "package:project_1/model/cinema.dart";

class FirestoreService {
  // Create a CollectionReference call cinemaCollection that references
  // the firestore collction
  final CollectionReference cinemaCollection =
      FirebaseFirestore.instance.collection('cinema');

  Future<void> addCinemaData(
      String name, String address, String latitude, String longitude) async {
    var docRef = FirestoreService().cinemaCollection.doc();
    print('add docRef:' + docRef.id);
    await cinemaCollection.doc(docRef.id).set({
      "uid": docRef.id,
      "name": name,
      "address": address,
      "latitude": latitude,
      "longitude": longitude,
    });
  }

  Future<List<Cinema>> readCinemaData() async {
    List<Cinema> cinemaList = [];
    QuerySnapshot snapshot = await cinemaCollection.get();

    snapshot.docs.forEach((document) {
      Cinema cinema = Cinema.fromMap(document.data());
      cinemaList.add(cinema);
    });
    print("CinemaList: $cinemaList");
    return cinemaList;
  }

  Future<void> deleteCinemaData(String docld) async {
    cinemaCollection.doc(docld).delete();

    print("deleting uid:" + docld);
  }

  Future<void> updateCinemaData(
      String name, String address, String latitude, String longitude) async {
    var docRef = FirestoreService().cinemaCollection.doc();
    print('update docRef:' + docRef.id);
    await cinemaCollection.doc(docRef.id).update({
      "uid": docRef.id,
      "name": name,
      "address": address,
      "latitude": latitude,
      "longitude": longitude,
    });
  }

  Future<void> deleteCinemaDoc() async {
    await cinemaCollection.get().then((snapshot) {
      for (DocumentSnapshot ds in snapshot.docs) {
        ds.reference.delete();
      }
    });
  }
}
