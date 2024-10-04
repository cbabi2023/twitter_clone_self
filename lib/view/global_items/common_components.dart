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
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: () {
              return Scaffold.of(context).openDrawer();
            },
            child: const CircleAvatar(
              radius: 15,
              backgroundImage: AssetImage(ImagesConstants.googlelogo),
              backgroundColor: ColorConstants.mainWhite,
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          const FaIcon(
            FontAwesomeIcons.xTwitter,
            color: Colors.white,
          ),
          const Row(
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

class RepliesWidgetFunctions extends StatelessWidget {
  final String textValue;
  final IconData iconValue;
  bool? spaceBetween;
  bool? textValueBold;
  RepliesWidgetFunctions({
    super.key,
    required this.textValue,
    required this.iconValue,
    this.spaceBetween,
    this.textValueBold,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: spaceBetween == true
          ? MainAxisAlignment.spaceBetween
          : MainAxisAlignment.start,
      children: [
        Text(
          textValue,
          style: TextStyle(
            fontWeight:
                textValueBold == true ? FontWeight.bold : FontWeight.normal,
            fontSize: 15,
          ),
        ),
        Icon(
          iconValue,
          color: ColorConstants.mainWhite,
        )
      ],
    );
  }
}
