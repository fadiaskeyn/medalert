import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_core/firebase_core.dart'; // Add this for Firebase initialization
import 'package:medalert/screens/setting/setting.dart';
import 'cubit/home_cubit.dart';
import 'screens/home_screen.dart';
import 'screens/outlook_screen.dart';
import 'screens/suggestion.dart';
import 'screens/setting/setting_account.dart';
import 'screens/setting/general_setting.dart';
import 'screens/splash.dart';

void main() async {
  WidgetsFlutterBinding
      .ensureInitialized(); // Ensures proper setup for async Firebase initialization
  await Firebase.initializeApp(); // Initialize Firebase
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),
      home: BlocProvider(
        create: (context) => HomeCubit(),
        child: HomeScreen(),
      ),
      initialRoute: '/home',
      routes: {
        '/outlook': (context) => Outlook(),
        '/home': (context) => HomeScreen(),
        '/suggestion': (context) => Suggestion(),
        '/setting': (context) => SettingsPage(),
        '/setting_account': (context) => SettingAccount(),
        '/general_setting': (context) => GeneralSettingsPage(),
        '/splash': (context) => SplashScreen(),
      },
    );
  }
}
