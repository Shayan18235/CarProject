// ignore_for_file: sort_child_properties_last, prefer_const_constructors

import 'package:carapi/information/detail_page.dart';
import 'package:carapi/information/language_model.dart';
import 'package:flutter/material.dart';

class LanguageCard extends StatelessWidget {
  LanguageCard({super.key, required this.languageModel});
  final LanguageModel languageModel;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (languageModel.id == '1') {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => detailPageOne(),
              ));
        }
      },
      child: Container(
        margin: EdgeInsets.fromLTRB(60, 0, 60, 30),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          border: Border.all(color: Color(0xFF0098BA)),
          borderRadius: BorderRadius.circular(19),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(17.5),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(languageModel.image),
                  ),
                ),
                child: SizedBox(
                  width: 40,
                  height: 35,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(0, 9, 0, 5),
              child: Text(languageModel.name, style: TextStyle(fontFamily: 'kurdish_bold', fontSize: 18)),
            ),
          ],
        ),
      ),
    );
  }
}
