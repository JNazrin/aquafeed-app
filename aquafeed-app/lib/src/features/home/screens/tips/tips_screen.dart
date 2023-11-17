import 'package:flutter/material.dart';
import 'package:aquafeed_app/src/constants/colors.dart';
import 'package:aquafeed_app/src/components/widgets/card_widget.dart';

class Tips extends StatelessWidget {
  const Tips({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.fromLTRB(25, 50, 25, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Title page
              Text(
                'Tips Section',
                style: TextStyle(
                  color: primaryColor,
                  fontSize: 27,
                  fontWeight: FontWeight.bold,
                ),
              ),

              // Sub title
              Text(
                'Fish Education Tips',
                style: TextStyle(
                  color: textColor2,
                  fontSize: 17,
                ),
              ),

              SizedBox(height: 40),

              // Tips Cards
              CardWidget(
                textTitle: 'Proper pH Level',
                subTitle: 'For most freshwater aquarium fish, the recommended pH level is between 6.5 and 7.5. However, it\'s important to note that specific fish species may have preferences outside this range. Maintaining a stable pH within the suitable range is essential for the health and well-being of aquarium fish, as pH fluctuations can stress and harm them.',
              ),

              SizedBox(height: 10),

              // Tips Cards
              CardWidget(
                textTitle: 'Clean Your Aquarium Regularly',
                subTitle: 'Regular aquarium cleaning is crucial for fish health. Use a gravel vacuum for debris and uneaten food during water changes. Clean walls and decorations to remove algae. Rinse filter media in tank water to preserve beneficial bacteria. Trim dead plant matter, vacuum the substrate, and replace a portion of the water regularly.',
              ),

              SizedBox(height: 10),

              // Tips Cards
              CardWidget(
                textTitle: 'Do not overstock your tank',
                subTitle: 'A tank can be really peaceful and calming to look at. This can be ruined when you add too many fish to an aquarium, up to the point where the fish have not enough space to roam. You need to make sure that your fish have enough space to roam freely, and this differs per species.',
              ),

              SizedBox(height: 10),

              // Tips Cards
              CardWidget(
                textTitle: 'Wash your filter once a month',
                subTitle: 'You do not have to wash your filter every time you do a water change. In theory, you only have to wash your filter when it is getting slightly clogged. If your filter is clogged, water will not be able to flow properly. This is also a sign you need to clean your filter, when you are able to see the output above the water.',
              ),
            ],
          ),
        ),
      ),
    );
  }
}