import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vendor_only_app/firebase_options.dart';
import 'package:vendor_only_app/vendor/providers/vendor_status_provider.dart';
import 'package:vendor_only_app/vendor/utils/messenger.dart';
import 'package:vendor_only_app/vendor/providers/teax_status_provider.dart';
import 'package:vendor_only_app/vendor/providers/vendor_form_provider.dart';
import 'package:vendor_only_app/vendor/utils/routes.dart';
import 'package:vendor_only_app/vendor/views/screens/auth/vendor_auth_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => VendorProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => TaxStatusProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => VendorFormProvider(),
        )
      ],
      child: MaterialApp(
        scaffoldMessengerKey: Messenger.scaffoldKey,
        navigatorKey: Routes.navigationKey,
        debugShowCheckedModeBanner: false,
        home: const VendorAuthScreen(),
      ),
    );
  }
}
