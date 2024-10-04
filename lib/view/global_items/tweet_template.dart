import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:twitter_clone/view/utils/color_constants/color_constants.dart';

class BuildTweetBox extends StatefulWidget {
  final String profileImageUrl;
  final String authorName;
  final String userId;
  final String postTime;
  final String tweetContent;
  final bool?
      isBlueTick; // true for blue tick, false for golden, null for no tick
  final String? xAppVerification; // pass xAppVerification for blue/golden tick
  final String? mediaUrl; // optional media URL
  final String commentCount;
  final String repostCount;
  final String likeCount;
  final String analyticsCount;

  const BuildTweetBox({
    super.key,
    required this.profileImageUrl,
    required this.authorName,
    required this.userId,
    required this.postTime,
    required this.tweetContent,
    this.isBlueTick,
    this.xAppVerification,
    this.mediaUrl,
    required this.commentCount,
    required this.repostCount,
    required this.likeCount,
    required this.analyticsCount,
  });

  @override
  State<BuildTweetBox> createState() => _BuildTweetBoxState();
}

class _BuildTweetBoxState extends State<BuildTweetBox> {
  bool _isFavorited = false; // State to track if the icon is filled

  void _toggleFavorite() {
    setState(() {
      _isFavorited = !_isFavorited; // Toggle the state
    });
  }

  @override
  Widget build(BuildContext context) {
    // Define a maximum length for the tweet content
    const int maxLength = 200;

    // Check if the tweet content is longer than maxLength
    bool isLongTweet = widget.tweetContent.length > maxLength;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Profile picture
            CircleAvatar(
              backgroundImage: NetworkImage(widget.profileImageUrl),
            ),
            const SizedBox(width: 10),

            // Tweets and post
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      // Profile name
                      Text(
                        widget.authorName,
                        style: const TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 15,
                        ),
                      ),
                      const SizedBox(width: 5),

                      // Verified tick if applicable
                      if (widget.isBlueTick == true)
                        const Icon(
                          Icons.verified,
                          color: ColorConstants.textBlue,
                          size: 15,
                        )
                      else if (widget.isBlueTick == false)
                        const Icon(
                          Icons.verified,
                          color: ColorConstants
                              .mainGold, // Replace with your golden color constant
                          size: 15,
                        ),
                      const SizedBox(width: 5),

                      // X app verification logo if applicable
                      if (widget.isBlueTick == true ||
                          widget.isBlueTick == false)
                        const FaIcon(
                          FontAwesomeIcons.xTwitter,
                          color: ColorConstants.mainGrey,
                          size: 8,
                        ),
                      const SizedBox(width: 5),

                      // User ID name
                      Text(
                        widget.userId,
                        style: const TextStyle(
                          color: ColorConstants.mainGrey,
                        ),
                      ),
                      const SizedBox(width: 5),

                      // Post time
                      Text(
                        widget.postTime,
                        style: const TextStyle(
                          color: ColorConstants.mainGrey,
                        ),
                      ),
                    ],
                  ),

                  // Tweet content
                  // Tweet content with truncation
                  Text(
                    isLongTweet
                        ? '${widget.tweetContent.substring(0, maxLength)}... '
                        : widget.tweetContent,
                  ),
                  if (isLongTweet)
                    GestureDetector(
                      onTap: () {
                        // Implement your "Read more" functionality here, such as navigating to a detailed view
                      },
                      child: const Text(
                        'Read more',
                        style: TextStyle(
                          color: Colors.blue, // Use your desired blue color
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  const SizedBox(height: 10),

                  // Media (optional)
                  if (widget.mediaUrl != null &&
                      widget.mediaUrl!.isNotEmpty) ...[
                    Container(
                      width: double.infinity,
                      height: 200, // Adjust height as needed
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(widget.mediaUrl!),
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    const SizedBox(height: 10),
                  ],

                  // Activity buttons
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ActivityButtons(
                        iconName: Icons.message,
                        textValue: widget.commentCount,
                      ),

                      // Icon(

                      ActivityButtons(
                        iconName: Icons.repeat,
                        textValue: widget.repostCount,
                      ),
                      GestureDetector(
                        onTap: _toggleFavorite,
                        child: ActivityButtons(
                          iconName: _isFavorited
                              ? Icons.favorite
                              : Icons.favorite_border,
                          textValue: widget.commentCount,
                          iconColor: _isFavorited
                              ? Colors.red
                              : null, // Set icon color to red if favorited
                        ),
                      ),
                      ActivityButtons(
                        iconName: Icons.analytics_outlined,
                        textValue: widget.analyticsCount,
                      ),
                      const Row(
                        children: [
                          Icon(
                            Icons.bookmark_outline,
                            color: ColorConstants.mainGrey,
                            size: 18,
                          ),
                          SizedBox(width: 10),
                          Icon(
                            Icons.share,
                            color: ColorConstants.mainGrey,
                            size: 18,
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // More vertical icon
            const Icon(
              Icons.more_vert,
              color: ColorConstants.mainGrey,
              size: 15,
            ),
          ],
        ),
      ],
    );
  }
}

class ActivityButtons extends StatelessWidget {
  final IconData iconName;
  final String textValue;
  final Color? iconColor; // Optional color parameter

  const ActivityButtons({
    super.key,
    required this.iconName,
    required this.textValue,
    this.iconColor, // Add the optional parameter
  });

  @override
  Widget build(BuildContext context) {
    // Use red if iconColor is explicitly set to red, otherwise fallback to mainGrey
    final colorToUse = (iconColor == Colors.red)
        ? Colors.red
        : (iconColor ?? ColorConstants.mainGrey);

    return Row(
      children: [
        Icon(
          iconName,
          color: colorToUse, // Use the determined color
          size: 18,
        ),
        const SizedBox(width: 5),
        Text(
          textValue,
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
