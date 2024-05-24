import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vendor_only_app/vendor/providers/vendor_form_provider.dart';

class SubmitButton extends StatelessWidget {
  const SubmitButton({super.key, required this.formKey});
  final GlobalKey<FormState> formKey;
  @override
  Widget build(BuildContext context) {
    return Consumer<VendorFormProvider>(
        builder: (context, formProvider, child) {
      return SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          style:
              ElevatedButton.styleFrom(backgroundColor: Colors.yellow.shade900),
          onPressed: () {
            if (formKey.currentState!.validate()) {
              formProvider.isLoading ? null : formProvider.addVendor();
            }
          },
          child: formProvider.isLoading
              ? const CircularProgressIndicator()
              : const Text('SAVE'),
        ),
      );
    });
  }
}
