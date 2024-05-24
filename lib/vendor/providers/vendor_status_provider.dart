import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:vendor_only_app/vendor/data/models/vendor_details_model.dart';

class VendorProvider with ChangeNotifier {
  final CollectionReference _vendorCollection =
      FirebaseFirestore.instance.collection('vendorDetails');
  final FirebaseAuth _auth = FirebaseAuth.instance;
  VendorDetailsModel? _vendor;
  String? _errorMessage;
  bool _isLoading = true;

  VendorDetailsModel? get vendor => _vendor;
  String? get errorMessage => _errorMessage;
  bool get isLoading => _isLoading;

  VendorProvider() {
    // Fetch vendor details when the provider is initialized
    _fetchVendorDetails();
    // Listen to authentication state changes
    _auth.authStateChanges().listen((User? user) {
      if (user != null) {
        // User signed in, fetch vendor details
        _fetchVendorDetails();
      } else {
        // User signed out, reset vendor details
        _resetVendorDetails();
      }
    });
  }

  Future<void> _fetchVendorDetails() async {
    try {
      /*This case can possible never occur but we still check it
    because this function will be only called if the user is authenticated 
    but still we need to ensure it
    */
      final uid = FirebaseAuth.instance.currentUser?.uid;
      if (uid == null) {
        _errorMessage = 'User not authenticated';
        _isLoading = false;
        notifyListeners();
        return;
      }
     //checking if document with uid is in the firebase 
     //and listening to the changes
      _vendorCollection.doc(uid).snapshots().listen((snapshot) {
        if (snapshot.exists) {
          _vendor = VendorDetailsModel.fromJson(
              snapshot.data() as Map<String, dynamic>);
        } else {
          _errorMessage = 'No vendor data found';
        }
        _isLoading = false;
        notifyListeners();
      });
    } catch (e) {
      _errorMessage = 'Failed to fetch vendor details: ${e.toString()}';
      _isLoading = false;
      notifyListeners();
    }
  }

  /*when user signout we have to clear the state of the provider 
  otherwise the state will be containing the previous user details*/
  void _resetVendorDetails() {
    _vendor = null;
    _errorMessage = null;
    _isLoading = true;
    notifyListeners();
  }

  void signoutUser() async {
    await _auth.signOut();
    _resetVendorDetails();
  }
}
