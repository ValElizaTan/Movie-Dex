/* import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:project_1/screen/addtheatre.dart';

class FirestoreService {
  // Create a CollectionReference call bookCollection that references
  // the firestore collction
  final CollectionReference bookCollection =
      FirebaseFirestore.instance.collection('books');

  Future<void> addBookData(
      String bookAuthor, String bookTitle, String bookDescription) async {
    var docRef = FirestoreService().bookCollection.doc();
    print('add docRef:' + docRef.id);
    await bookCollection.doc(docRef.id).set({
      "uid": docRef.id,
      "author": bookAuthor,
      "title": bookTitle,
      "description": bookDescription,
    });
  }

  Future<List<AddTheatre>> readBookData() async {
    List<AddTheatre> bookList = [];
    QuerySnapshot snapshot = await bookCollection.get();

    snapshot.docs.forEach((document) {
      AddTheatre book = AddTheatre.fromMap(document.data());
      bookList.add(book);
    });
    print('Booklist: $bookList');
    return bookList;
  }

  Future<void> deleteBookData(String docld) async {
    bookCollection.doc(docld).delete();

    print("deleting uid:" + docld);
  }

  Future<void> updateBookData(
      String bookAuthor, String bookTitle, String bookDescription) async {
    var docRef = FirestoreService().bookCollection.doc();
    print('update docRef:' + docRef.id);
    await bookCollection.doc(docRef.id).update({
      "uid": docRef.id,
      "author": bookAuthor,
      "title": bookTitle,
      "description": bookDescription,
    });
  }

  Future<void> deleteBookDoc() async {
    await bookCollection.get().then((snapshot) {
      for (DocumentSnapshot ds in snapshot.docs) {
        ds.reference.delete();
      }
    });
  }
}
 */