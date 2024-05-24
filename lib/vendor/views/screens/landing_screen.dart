import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vendor_only_app/vendor/providers/vendor_status_provider.dart';
import 'package:vendor_only_app/vendor/views/screens/auth/vendor_registration.dart';
import 'package:vendor_only_app/vendor/views/screens/main_screen.dart';
import 'package:vendor_only_app/vendor/views/widgets/landing_screen/vendor_req_pending_screen.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final vendorProvider = context.watch<VendorProvider>();

    if (vendorProvider.isLoading) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    final vendor = vendorProvider.vendor;

    if (vendor == null) {
      return VendorRegistrationScreen();
    }
    if (vendor.isApproved) {
      return const MainScreen();
    }
    return VendorReqPendingScreen(
      vendor: vendor,
    );
  }
}
