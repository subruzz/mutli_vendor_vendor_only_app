import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vendor_only_app/vendor/providers/vendor_status_provider.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TextButton(
          onPressed: () {
            context.read<VendorProvider>().signoutUser();
          },
          child: const Text(
            'Sign Out',
            style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.w500, color: Colors.blue),
          ),
        ),
      ),
    );
  }
}
