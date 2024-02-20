import 'package:flutter/material.dart';
import 'package:gawean/screens/onboarding/splash_screen.dart';
import 'package:gawean/theme/themes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'dart:io';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Platform.isAndroid?
  await Firebase.initializeApp(
    options: const FirebaseOptions(
        apiKey: 'AIzaSyAeBogR9i0CB-lO7ieKinStOAly23l4_Vk',
        appId: '1:444533938414:android:f0379971b732b47ab1bbff',
        messagingSenderId: '444533938414',
        projectId: 'gawean-app',
    ),
  ) : await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: ThemeClass.lightTheme,
      darkTheme: ThemeClass.darkTheme,
      home: const SplashScreen(),
    );
  }
}

