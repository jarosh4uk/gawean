import 'package:flutter/material.dart';
import 'package:gawean/constants.dart';
import 'package:gawean/screens/onboarding/signin_account_screen.dart';
import 'package:gawean/widgets/common_component_button.dart';


class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override


  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: MediaQuery.of(context).size.height * 0.18,),
            const SizedBox(height: 55,),
            Image.asset("assets/images/logo.png"),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 60.0),
              child: Text(
                  "The best portal job of this century",
                style: TextStyle(
                  fontSize: 18,
                  letterSpacing: 0.4,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
                  child: CommonComponentButton(
                    text: "Continue",
                    onPress: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SignInScreen()),
                      );
                    },
                  )
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
