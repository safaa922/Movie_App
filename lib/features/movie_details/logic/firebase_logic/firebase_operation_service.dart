

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseOperationService {

  final firebaseFirestore = FirebaseFirestore.instance;

  Future<void> AddToFavorite(int movieId) async {
    final uid = FirebaseAuth.instance.currentUser!.uid;
    await FirebaseFirestore.instance.collection("Users").doc(uid).collection("Favorites").add({
      "id": movieId
    });
  }

  // Future<void> AddToWatchlist(int movieId) async {
  //   await firebaseFirestore.collection("Watchlist").add({
  //     "id": movieId
  //   });
  // }

  Future<void> AddToWatchlist(int movieId) async {
    await firebaseFirestore.collection("Users").doc(FirebaseAuth.instance.currentUser!.uid).collection("Watchlist").add({
      "id": movieId
    });
  }

  Future<void> DeleteFavorite(int movieId) async {
    final uid = FirebaseAuth.instance.currentUser!.uid;
    final docs = await FirebaseFirestore.instance.collection("Users").doc(uid).collection("Favorites").where("id",isEqualTo: movieId).get();
    for (final doc in docs.docs){
      await doc.reference.delete();
    }
  }

  Future<void> DeleteWatchlist(int movieId) async {
    //// await firebaseFirestore.collection("Watchlist").doc("id").delete();
    // final docs = await firebaseFirestore.collection("Watchlist").where("id",isEqualTo: movieId).get();
    // for (final doc in docs.docs){
    //   await doc.reference.delete();
    // }

    final uid = FirebaseAuth.instance.currentUser!.uid;
    final docs = await FirebaseFirestore.instance.collection("Users").doc(uid).collection("Watchlist").where("id",isEqualTo: movieId).get();
    for(final doc in docs.docs){
      await doc.reference.delete();
    }
  }

  Future<List<int>> GetFav() async {
    final uid = FirebaseAuth.instance.currentUser!.uid;
    final response =await FirebaseFirestore.instance.collection("Users").doc(uid).collection("Favorites").get();
    List<int> favIds = response.docs.map((doc)=>doc["id"] as int).toList();
    print("##############################################################################");
    for (final doc in response.docs) {
      print(doc.id);
      print(doc.data());
    }
    return favIds;
  }

  Future<List<int>> GetWatchlist() async {
    final uid = FirebaseAuth.instance.currentUser!.uid;
    final response = await FirebaseFirestore.instance.collection("Users").doc(uid).collection("Watchlist").get();
    List<int> watchIds = response.docs.map((doc)=>doc["id"] as int).toList();
    return watchIds;
  }
}