
import 'package:flutter/material.dart';
import 'package:gawean/constants.dart';
import 'package:gawean/screens/onboarding/welcome_screen.dart';
import 'package:splash_view/source/presentation/pages/splash_view.dart';
import 'package:splash_view/source/presentation/presentation.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 40.0),
        child: SplashView(
          logo: Image.asset("assets/images/logo.png"),
          bottomLoading: true,
          duration: const Duration(seconds: 3),
          loadingIndicator: const CircularProgressIndicator(
            color: AppColor.kPrimaryColor,
          ),
          done: Done(
            const WelcomeScreen(),
          ),
        ),
      ),
    );
  }
}
