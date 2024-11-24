import 'package:flutter/material.dart';
import 'package:inovokasi_rebuild/screens/login_screen.dart';
import 'package:inovokasi_rebuild/screens/dashboard.dart'; // Pastikan import file sesuai struktur Anda

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Hilangkan banner debug
      title: 'IQACS Duck',
      theme: ThemeData(
        primarySwatch: Colors.brown, // Sesuaikan dengan tema Anda
      ),
      initialRoute: '/login', // Route awal saat aplikasi dibuka
      routes: {
        '/login': (context) => LoginScreen(), // Halaman Login
        '/dashboard': (context) => Dashboard(), // Halaman Dashboard
      },
    );
  }
}
