import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vendor_only_app/vendor/data/models/vendor_details_model.dart';
import 'package:vendor_only_app/vendor/providers/vendor_status_provider.dart';
import 'package:vendor_only_app/vendor/utils/constants.dart';

class VendorReqPendingScreen extends StatelessWidget {
  const VendorReqPendingScreen({super.key, required this.vendor});
  final VendorDetailsModel vendor;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 60,
              backgroundImage: NetworkImage(vendor.storeImage),
            ),
            Text(
              vendor.businessName,
              style: mainTitle,
            ),
            const Text(
              textAlign: TextAlign.center,
              style: mediumTitle,
              'Your application has been sent to shop Admin.\nYou can continue to use the app after the admin verifies your account',
            ),
            TextButton(
              onPressed: () {
                context.read<VendorProvider>().signoutUser();
              },
              child: const Text(
                'Sign Out',
                style: mediumTitle,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
