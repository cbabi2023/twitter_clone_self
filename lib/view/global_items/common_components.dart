import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:twitter_clone/view/utils/color_constants/color_constants.dart';
import 'package:twitter_clone/view/utils/image_constants/image_constants.dart';

class XtopappBar extends StatelessWidget {
  const XtopappBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CircleAvatar(
            radius: 15,
            backgroundImage: AssetImage(ImagesConstants.googlelogo),
            backgroundColor: ColorConstants.mainWhite,
          ),
          SizedBox(
            width: 10,
          ),
          FaIcon(
            FontAwesomeIcons.xTwitter,
            color: Colors.white,
          ),
          Row(
            children: [
              Text(
                'Upgrade',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(
                width: 20,
              ),
              Icon(
                Icons.more_vert,
                color: ColorConstants.mainWhite,
              ),
            ],
          )
        ],
      ),
    );
  }
}

// Activity Buttons in tweets like , post , retweet , comments , insights
class ActivityButtons extends StatelessWidget {
  final IconData iconName;
  final String textValue; // Changed from String? to String since it is required

  const ActivityButtons({
    super.key,
    required this.iconName,
    required this.textValue,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          iconName, // Use iconName directly, no need for Icon() constructor
          color: ColorConstants.mainGrey,
          size: 15,
        ),
        const SizedBox(
          width: 5,
        ),
        Text(
          textValue, // No need to interpolate if it's already a string
          style: const TextStyle(
            color: ColorConstants.mainGrey,
            fontSize: 12,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}

