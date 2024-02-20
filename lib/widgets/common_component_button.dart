import 'package:flutter/material.dart';

import '../constants.dart';

class CommonComponentButton extends StatelessWidget {
  const CommonComponentButton({super.key, required this.text, required this.onPress});

  final String text;
  final VoidCallback onPress;

  @override
  Widget build(BuildContext context) {
    return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              gradient: const LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment(1, 1),
                colors: <Color>[
                  Color(0xff2972FE),
                  Color(0xff6499FF),
                ],
                tileMode: TileMode.mirror,
              ),
            ),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.transparent,
                shadowColor: Colors.transparent,
                minimumSize: const Size.fromHeight(50),
                elevation: 3,
                textStyle: const TextStyle(
                    fontSize: 14,
                    letterSpacing: 0.2,
                    fontWeight: FontWeight.w600,
                ),
              ),
              onPressed: onPress,
              child: Text(
                text,
                  style: const TextStyle(
                    color: Colors.white,

          ),
        ),
      ),
    );
  }
}
