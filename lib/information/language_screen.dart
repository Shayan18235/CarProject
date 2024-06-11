import 'package:carapi/information/language_card.dart';
import 'package:carapi/information/language_model.dart';
import 'package:flutter/material.dart';

class LanguageScreen extends StatelessWidget {
  const LanguageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              child: Image.asset('assets/images/lang.gif'),
            ),
            ...lang.map((e) => LanguageCard(languageModel: e))
          ],
        ),
      ),
    );
  }
}
