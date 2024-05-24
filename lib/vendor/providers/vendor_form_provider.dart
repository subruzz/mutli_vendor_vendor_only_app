import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:vendor_only_app/vendor/controllers/vendor_registration.dart';
import 'package:vendor_only_app/vendor/data/models/vendor_details_model.dart';
import 'package:vendor_only_app/vendor/utils/messenger.dart';


class VendorFormProvider with ChangeNotifier {
  String _country = '';
  String _state = '';
  String _city = '';
  String _businessName = '';
  String _email = '';
  String _phone = '';

  String get country => _country;
  String get state => _state;
  String get city => _city;
  String get businessName => _businessName;
  String get email => _email;
  String get phone => _phone;
  bool get isLoading => _isLoading;
  bool _isLoading = false;
  final ImagePicker _imgPicker = ImagePicker();
  File? _selectedImage;
  String? _fileName;
  File? get selectedImage => _selectedImage;
  String? get fileName => _fileName;
  void selecteImage() async {
    final result = await _imgPicker.pickImage(source: ImageSource.gallery);
    if (result != null) {
      _selectedImage = File(result.path);
      _fileName = result.name;
    } else {
      // User canceled the picker
    }
    notifyListeners();
  }

  void clearImage() {
    _selectedImage = null;
    _fileName = null;
    notifyListeners();
  }

  void setCountry(String value) {
    _country = value;
    notifyListeners();
  }

  void setStateValue(String value) {
    _state = value;
    notifyListeners();
  }

  void setCity(String value) {
    _city = value;
    notifyListeners();
  }

  void setBusinessName(String value) {
    _businessName = value;
    notifyListeners();
  }

  void setEmail(String value) {
    _email = value;
    notifyListeners();
  }

  void setPhone(String value) {
    _phone = value;
    notifyListeners();
  }

  Future<void> addVendor() async {
    if (_country.isEmpty ||
        _state.isEmpty ||
        _city.isEmpty ||
        _selectedImage == null) {
      Messenger.showSnackBar(
        message:
            'Make sure you entered all required details  It is mandatory!\n, Then only admin can verify you',
      );
      return;
    }
    _isLoading = true;
    notifyListeners();

    final imgResult = await VendorController.uploadVendorImage(_selectedImage!);
    int phone = int.parse(_phone);
    await imgResult.fold(
      (failure) async {
        Messenger.showSnackBar(message: failure, color: Colors.red);
        _isLoading = false;
        notifyListeners();
      },
      (imgUrl) async {
        final VendorDetailsModel vendor = VendorDetailsModel(
          isApproved: false,
          businessName: _businessName,
          emailAddress: _email,
          phoneNumber:phone,
          storeImage: imgUrl,
          country: _country,
          state: _state,
          city: _city,
          isTaxRegistered: false,
        );

        final vendorResult = await VendorController.uploadVendor(vendor);

        await vendorResult.fold(
          (failure) async {
            _isLoading = false;
            notifyListeners();
            Messenger.showSnackBar(message: failure, color: Colors.red);
          },
          (_) async {
            Messenger.showSnackBar(
                message: 'Registered SuccessFully', color: Colors.green);
            // Routes.push(screen: const LandingScreen());
            _isLoading = false;
            notifyListeners();
          },
        );
      },
    );
  }
}
