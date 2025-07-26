import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vikn_codes/controller/invoice_controller.dart';
import 'package:vikn_codes/controller/landingpage_controller.dart';
import 'package:vikn_codes/controller/login_controller.dart';
import 'package:vikn_codes/controller/profile_controller.dart';
import 'package:vikn_codes/utils/app_colors.dart';
import 'package:vikn_codes/view/login_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => LandingPageController()),
        ChangeNotifierProvider(create: (context) => LoginController()),
        ChangeNotifierProvider(create: (context) => InvoiceController()),
        ChangeNotifierProvider(create: (context) => ProfileController()),
      ],
      child: MaterialApp(
        theme: ThemeData(scaffoldBackgroundColor: AppColors.scaffoldbgColor),
        // themeMode: ThemeMode.light,
        debugShowCheckedModeBanner: false,
        home: LoginScreen(),
      ),
    );
  }
}
