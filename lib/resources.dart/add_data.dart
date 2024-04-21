import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

final FirebaseStorage _storage = FirebaseStorage.instance;
final FirebaseFirestore _firestore = FirebaseFirestore.instance;

class StoreData {
  Future<String> uploadImageToStorage(String childName, Uint8List file) async {
    Reference ref = _storage.ref().child(childName);
    UploadTask uploadTask = ref.putData(file);
    TaskSnapshot snapshot = await uploadTask;
    String downloadUrl = await snapshot.ref.getDownloadURL();
    return downloadUrl;
  }

  Future<String> saveData({
    required Timestamp date,
    required String jakkaNo,
    required String problem,
    required String status,
    required String user,
    required Uint8List file,
  }) async {
    String resp = " Some Error Occured ";
    try {
      String imageUrl = await uploadImageToStorage('report', file);
      await _firestore.collection('Report').add({
        'Date': date,
        'Jakka_No': jakkaNo,
        'Pic': imageUrl,
        'Problem': problem,
        'Status': status,
        'User': user,
      });
      resp = 'success';
    } catch (err) {
      resp = err.toString();
    }
    return resp;
  }
}
