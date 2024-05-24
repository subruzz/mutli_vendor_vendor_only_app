import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vendor_only_app/vendor/providers/teax_status_provider.dart';
import 'package:vendor_only_app/vendor/providers/vendor_form_provider.dart';
import 'package:vendor_only_app/vendor/utils/extensions.dart';
import 'package:vendor_only_app/vendor/views/widgets/common_widgets/custom_textfield.dart';
import 'package:vendor_only_app/vendor/views/widgets/vendor_registration/select_country.dart';
import 'package:vendor_only_app/vendor/views/widgets/vendor_registration/select_image.dart';
import 'package:vendor_only_app/vendor/views/widgets/vendor_registration/submit_button.dart';
import 'package:vendor_only_app/vendor/views/widgets/vendor_registration/tax_reg_dropdown.dart';

class VendorRegistrationScreen extends StatelessWidget {
  VendorRegistrationScreen({super.key});

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
              toolbarHeight: size.height * .2,
              flexibleSpace: const SelectImage()),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Consumer<VendorFormProvider>(
                builder: (context, formProvider, child) {
                  return Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        CustomTextField(
                          label: 'Business Name',
                          onChanged: (value) {
                            formProvider.setBusinessName(value);
                          },
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your business name';
                            }
                            return null;
                          },
                        ),
                        CustomTextField(
                          label: 'e-mail address',
                          onChanged: (value) => formProvider.setEmail(value),
                          keyboardType: TextInputType.emailAddress,
                          validator: (value) {
                            if (value == null || !value.validateEmail()) {
                              return 'Please enter a valid email';
                            }
                            return null;
                          },
                        ),
                        CustomTextField(
                          label: 'Phn No',
                          onChanged: (value) => formProvider.setPhone(value),
                          keyboardType: TextInputType.number,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your phone number';
                            } else if (!value.isNumeric()) {
                              return 'Please enter a valid phone number';
                            }
                            return null;
                          },
                        ),
                        const SelectCountry(),
                        const TaxRegDropDown(),
                        if (context.watch<TaxStatusProvider>().taxStatus ==
                            TaxStatus.yes)
                          CustomTextField(
                            label: 'Tax No',
                            onChanged: (value) {},
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your tax number';
                              }
                              return null;
                            },
                          ),
                        const SizedBox(height: 15),
                        SubmitButton(formKey: _formKey),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
