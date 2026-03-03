import 'package:flutter/material.dart';
import 'package:sales_apps/core/features/auth/presentation/pages/login_page.dart';
import 'package:sales_apps/core/features/home/presentation/pages/home_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sales App',
      theme: ThemeData(primarySwatch: Colors.blue),
      initialRoute: '/',
      routes: {
        '/': (context) => LoginPage(),
        '/home': (context) => HomePage(),
        '/face-register': (context) => Scaffold(body: Center(child: Text("Face Register Page"))),
        '/face-scan': (context) => Scaffold(body: Center(child: Text("Face Scan Page"))),
      },
    );
  }
}