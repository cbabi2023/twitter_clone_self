import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:twitter_clone/view/utils/color_constants/color_constants.dart';

class SingleTweetScreen extends StatelessWidget {
  final String profileImageUrl;
  final String userId;
  final String authorName;
  final String tweetContent;
  final String postTime;
  final bool? isBlueTick;
  final String? mediaUrl; // Make mediaUrl nullable

  const SingleTweetScreen({
    super.key,
    required this.profileImageUrl,
    required this.authorName,
    required this.tweetContent,
    required this.postTime,
    this.mediaUrl,
    required this.userId,
    this.isBlueTick,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: ColorConstants.mainWhite),
        title: const Text(
          'Post',
          style: TextStyle(color: ColorConstants.mainWhite),
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(2.0),
          child: Container(
            height: 1.0,
            color: ColorConstants.mainGrey.withOpacity(0.5),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Profile picture
            Row(
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage(profileImageUrl),
                  radius: 25, // Adjust radius as needed
                ),
                const SizedBox(
                  width: 15,
                ),

                // Author name and userid
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          authorName,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 17,
                          ),
                        ),
                        SizedBox(width: 10),
                        // Verified tick if applicable
                        if (isBlueTick == true)
                          const Icon(
                            Icons.verified,
                            color: ColorConstants.textBlue,
                            size: 20,
                          )
                        else if (isBlueTick == false)
                          const Icon(
                            Icons.verified,
                            color: ColorConstants
                                .mainGold, // Replace with your golden color constant
                            size: 20,
                          ),
                        const SizedBox(width: 5),
                      ],
                    ),
                    Text(
                      userId,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color: ColorConstants.mainGrey,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 10),

            const SizedBox(height: 5),

            // Post time
            Text(
              postTime,
              style: const TextStyle(
                color: ColorConstants.mainGrey,
                fontSize: 14,
              ),
            ),
            const SizedBox(height: 10),

            // Tweet content
            Text(
              tweetContent,
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 10),

            // Media (optional)
            if (mediaUrl != null && mediaUrl!.isNotEmpty)
              Container(
                height: 200, // Adjust height as needed
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(mediaUrl!),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
