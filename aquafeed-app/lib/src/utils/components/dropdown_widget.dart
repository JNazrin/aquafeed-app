import 'package:aquafeed_app/src/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class DropDown extends StatelessWidget {
  final String textTitle;
  final String subTitle;

  const DropDown({super.key, required this.textTitle, required this.subTitle});

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
              padding: const EdgeInsets.all(10.0),
              child: ExpansionTile(
                textColor: primaryColor,
                title: Text(textTitle),
                iconColor: primaryColor,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10.0, 15.0, 10.0, 20.0),
                    child: Text(
                      subTitle,
                      style: const TextStyle(
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
