import 'package:flutter/material.dart';

Widget homeBuild({
  required String image,
  required String title,
  required String subtitle,
}) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 30),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          height: 300,
          image,
          fit: BoxFit.contain,
          width: double.infinity,
        ),
        const SizedBox(
          height: 20,
        ),
        Text(
          title,
          style: const TextStyle(
            color: Colors.black,
            fontFamily: 'kurdish_bold',
            fontSize: 26,
          ),
        ),
        const SizedBox(
          height: 24,
        ),
        Text(
          textAlign: TextAlign.center,
          subtitle,
          style: const TextStyle(color: Colors.black, fontFamily: 'kurdish_regular', fontSize: 18),
        )
      ],
    ),
  );
}
