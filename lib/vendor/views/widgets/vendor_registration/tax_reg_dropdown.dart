import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vendor_only_app/vendor/providers/teax_status_provider.dart';

class TaxRegDropDown extends StatelessWidget {
  const TaxRegDropDown({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Text(
          'Tax Registered?',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        const SizedBox(width: 20),
        SizedBox(
          width: 100,
          child: DropdownButtonFormField(
            value: context.read<TaxStatusProvider>().taxStatus,
            items: TaxStatus.values.map((e) {
              return DropdownMenuItem(
                value: e,
                child: Text(e.name),
              );
            }).toList(),
            onChanged: (value) =>
                context.read<TaxStatusProvider>().setTaxStatus(value!),
          ),
        ),
      ],
    );
  }
}
