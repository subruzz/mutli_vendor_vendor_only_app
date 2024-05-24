import 'package:country_state_city_picker/country_state_city_picker.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vendor_only_app/vendor/providers/vendor_form_provider.dart';

class SelectCountry extends StatelessWidget {
  const SelectCountry({super.key});

  @override
  Widget build(BuildContext context) {
    final formProvider = context.read<VendorFormProvider>();
    return SelectState(
      onCountryChanged: (value) {
        formProvider.setCountry(value);
      },
      onStateChanged: (value) {
        formProvider.setStateValue(value);
      },
      onCityChanged: (value) {
        formProvider.setCity(value);
      },
    );
  }
}
