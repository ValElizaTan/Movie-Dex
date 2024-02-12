/* import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_firestoreapp/model/theatre.dart';

class FirestoreService {
  // Create a CollectionReference called theatreCollection that references
  // the firestore collection
  final CollectionReference theatreCollection =
      FirebaseFirestore.instance.collection('theatres');

  Future<void> addTheatreData(
      String theatrename, String location) async {
    var docRef = FirestoreService().theatreCollection.doc();
    print('add docRef:' + docRef.id);
    await theatreCollection.doc(docRef.id).set({
      "uid": docRef.id,
      "name": theatrename,
      "location": location,
    });
  }

  Future<List<Theatre>> readTheatreData() async {
    List<Theatre> theatreList = [];
    QuerySnapshot snapshot = await theatreCollection.get();

    snapshot.docs.forEach((document) {
      Theatre theatre = Theatre.fromMap(document.data());
      theatreList.add(theatre);
    });
    print('TheatreList: $theatreList');
    return theatreList;
  }

  Future<void> deleteTheatreData(String docId) async {
    theatreCollection.doc(docId).delete();

    print("deleting uid:" + docId);
  }

  Future<void> updateTheatreData(
      String theatrename, String location) async {
    var docRef = FirestoreService().theatreCollection.doc();
    print('update docRef:' + docRef.id);
    await theatreCollection.doc(docRef.id).update({
      "uid": docRef.id,
      "name": theatrename,
      "location": location,
    });
  }

  Future<void> deleteTheatreDoc() async {
    await theatreCollection.get().then((snapshot) {
      for (DocumentSnapshot ds in snapshot.docs) {
        ds.reference.delete();
      }
    });
  }
} */