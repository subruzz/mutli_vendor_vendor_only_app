import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:vendor_only_app/vendor/data/models/vendor_details_model.dart';

class VendorController {
  static final FirebaseStorage _storage = FirebaseStorage.instance;
  static final FirebaseFirestore _fireStore = FirebaseFirestore.instance;
  static final FirebaseAuth _auth = FirebaseAuth.instance;

  static Future<Either<String, String>> uploadVendorImage(File image) async {
 
    try {
      final user = _auth.currentUser;
      if (user == null) {
        return const Left('User not authenticated');
      }
      Reference ref = _storage.ref().child('vendorImages').child(user.uid);
      UploadTask task = ref.putFile(image);
      TaskSnapshot snapshot = await task;
      String downloadUrl = await snapshot.ref.getDownloadURL();
      return Right(downloadUrl);
    } catch (e) {
      return Left('Failed to upload vendor image: ${e.toString()}');
    }
  }

  static Future<Either<String, Unit>> uploadVendor(
      VendorDetailsModel vendor) async {
    try {
      final user = _auth.currentUser;
      if (user == null) {
        return const Left('User not authenticated');
      }
      await _fireStore
          .collection('vendorDetails')
          .doc(user.uid)
          .set(vendor.toJson());
      return const Right(unit);
    } catch (e) {
      return Left('Failed to upload vendor details: ${e.toString()}');
    }
  }
}
