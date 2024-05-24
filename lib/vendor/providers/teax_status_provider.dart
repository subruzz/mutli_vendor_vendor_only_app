import 'package:flutter/material.dart';

class TaxStatusProvider with ChangeNotifier {
  TaxStatus _taxStatus = TaxStatus.no;

  TaxStatus get taxStatus => _taxStatus;

  void setTaxStatus(TaxStatus value) {
    _taxStatus = value;
    notifyListeners();
  }
}

enum TaxStatus { yes, no }
