import 'package:aquafeed_app/src/constants/colors.dart';
import 'package:flutter/material.dart';

class CardWidget extends StatelessWidget {
  final String textTitle;
  final String subTitle;

  const CardWidget({super.key, required this.textTitle, required this.subTitle});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            color: boxColor,
            child: Padding(
              padding: EdgeInsets.all(10.0),
              child: ExpansionTile(
                textColor: primaryColor,
                title: Text(textTitle),
                iconColor: primaryColor,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10.0, 15.0, 10.0, 20.0),
                    child: Text(
                      subTitle,
                      style: TextStyle(
                        color: textColor,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
