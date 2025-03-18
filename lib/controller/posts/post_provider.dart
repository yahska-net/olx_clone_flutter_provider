import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class PostProvider extends ChangeNotifier {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  bool _isLoading = false;

  bool get isLoading => _isLoading;
  void setLoading(bool val) {
    _isLoading = val;
    notifyListeners();
  }

  Future<void> addPost(
    String name,
    String desc,
    double price,
    String location,
    String image,
  ) async {
    try {
      setLoading(true);
      await _firestore.collection("posts").add({
        "name": name,
        "desc": desc,
        "price": price,
        "location": location,
        "image": image,
        "createdAt": Timestamp.now(),
      });

      Fluttertoast.showToast(
        msg: "Product added successfully!",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.green,
        textColor: Colors.white,
      );
    } catch (e) {
      Fluttertoast.showToast(
        msg: "Failed to add product: $e",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.red,
        textColor: Colors.white,
      );
      print(e.toString());
    } finally {
      setLoading(false);
      notifyListeners();
    }
  }

  Stream<QuerySnapshot> fetchProducts() {
    return _firestore
        .collection("posts")
        .orderBy("createdAt", descending: true)
        .snapshots();
  }
}
