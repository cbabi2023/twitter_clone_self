import 'package:flutter/material.dart';
import 'package:twitter_clone/view/database/dummydb.dart';
import 'package:twitter_clone/view/global_items/common_components.dart';
import 'package:twitter_clone/view/global_items/tweet_template.dart';

import 'package:twitter_clone/view/utils/color_constants/color_constants.dart';

class SingleTweetScreen extends StatelessWidget {
  final String profileImageUrl;
  final String userId;
  final String repostCount;
  final String commentCount;
  final String likeCount;
  final String analyticsCount;
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
    required this.analyticsCount,
    required this.repostCount,
    required this.commentCount,
    required this.likeCount,
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
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Top Profile  Heading Section

              PostHeaderSection(
                  profileImageUrl: profileImageUrl,
                  authorName: authorName,
                  isBlueTick: isBlueTick,
                  userId: userId),
              const SizedBox(height: 15),

              // Tweet content
              Text(
                tweetContent,
                textAlign: TextAlign.left,
                style: const TextStyle(
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 20),

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

              // Time constant value

              const SizedBox(
                height: 10,
              ),
              Text.rich(
                TextSpan(
                  children: [
                    const TextSpan(
                      text: '10:27 . 03 Oct 24 . ', // Regular text
                      style: TextStyle(
                          color: ColorConstants.mainGrey), // Default style
                    ),
                    TextSpan(
                      text: analyticsCount, // Analytics count
                      style: const TextStyle(
                        fontWeight: FontWeight.bold, // Bold text
                        color: ColorConstants.mainWhite, // White color
                      ),
                    ),
                    const TextSpan(
                      text: ' Views', // Regular text
                      style: TextStyle(
                          color: ColorConstants.mainGrey), // Default style
                    ),
                  ],
                ),
              ),
              Divider(
                color: ColorConstants.mainGrey.withOpacity(0.3),
              ),
              const SizedBox(
                height: 5,
              ),

              // analysisc values

              AnalaysisValuesForReading(
                  repostCount: repostCount,
                  commentCount: commentCount,
                  likeCount: likeCount),

              const SizedBox(
                height: 20,
              ),

              // List generate of the replies

              Column(
                children: List.generate(
                  Dummydb.tweetTemplateData.length,
                  (index) => InkWell(
                    onTap: () {},
                    child: Column(
                      children: [
                        BuildTweetBox(
                            profileImageUrl: Dummydb.tweetTemplateData[index]
                                ['profileImageUrl'],
                            authorName: Dummydb.tweetTemplateData[index]
                                ['authorName'],
                            userId: Dummydb.tweetTemplateData[index]['userId'],
                            postTime: Dummydb.tweetTemplateData[index]
                                ['postTime'],
                            tweetContent: Dummydb.tweetTemplateData[index]
                                ['tweetContent'],
                            commentCount: Dummydb.tweetTemplateData[index]
                                ['commentCount'],
                            repostCount: Dummydb.tweetTemplateData[index]
                                ['repostCount'],
                            likeCount: Dummydb.tweetTemplateData[index]
                                ['likeCount'],
                            analyticsCount: Dummydb.tweetTemplateData[index]
                                ['analyticsCount']),
                        Divider(
                          color: ColorConstants.mainGrey.withOpacity(0.5),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              // bottom Navigation bar
            ],
          ),
        ),
      ),

      // Bottom Navigation Bar

      bottomNavigationBar: Container(
        height: 50, // Slightly increased for better usability
        decoration: const BoxDecoration(
          color: ColorConstants.mainBlack,
        ),
        padding: const EdgeInsets.symmetric(
            horizontal: 16.0,
            vertical: 8.0), // Added vertical padding for aesthetics

        child: Row(
          children: [
            const Expanded(
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Post your reply',
                  hintStyle: TextStyle(
                    color: ColorConstants.mainGrey,
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide:
                        BorderSide(color: ColorConstants.bordersideBlue),
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide:
                        BorderSide(color: ColorConstants.bordersideBlue),
                  ),
                  contentPadding: EdgeInsets.symmetric(
                      vertical: 10.0), // Adjusted padding for better height
                ),
              ),
            ),
            IconButton(
              icon: const Icon(
                Icons.camera_alt,
                color: ColorConstants.bordersideBlue,
              ),
              onPressed: () {
                // Your camera action here
              },
            ),
          ],
        ),
      ),
    );
  }
}

class AnalaysisValuesForReading extends StatefulWidget {
  const AnalaysisValuesForReading({
    super.key,
    required this.repostCount,
    required this.commentCount,
    required this.likeCount,
  });

  final String repostCount;
  final String commentCount;
  final String likeCount;

  @override
  State<AnalaysisValuesForReading> createState() =>
      _AnalaysisValuesForReadingState();
}

class _AnalaysisValuesForReadingState extends State<AnalaysisValuesForReading> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // first row

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            AnalyticsWidgetValues(
                readingValue: widget.repostCount, label: 'Reposts'),
            AnalyticsWidgetValues(
                readingValue: widget.commentCount, label: 'Quotes'),
            AnalyticsWidgetValues(
                readingValue: widget.likeCount, label: 'Likes'),
            const AnalyticsWidgetValues(readingValue: '20', label: 'Bookmark'),
          ],
        ),
        Divider(
          color: ColorConstants.mainGrey.withOpacity(0.3),
        ),

        const SizedBox(
          height: 10,
        ),

        // Second Row with 5 Icons
        const AnalysisButtonsForClicking(),

        // Divider
        const SizedBox(
          height: 5,
        ),
        Divider(
          color: ColorConstants.mainGrey.withOpacity(0.3),
        ),

        // most Relevant Replies || more functions with replies

         RepliesWidgetFunctions(
          textValue: 'Most relevant replies ',
          iconValue: Icons.keyboard_arrow_down,
        ),

        // Replies sections
      ],
    );
  }
}

class AnalysisButtonsForClicking extends StatelessWidget {
  const AnalysisButtonsForClicking({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        IconFunctionWidget(
          iconData: Icons.chat_bubble_outline,
          onPressed: () {},
        ),
        IconFunctionWidget(
          clickedColor: ColorConstants.mainWhite,
          iconData: Icons.repeat,
          onPressed: () {
            showModalBottomSheet(
              context: context,
              builder: (context) {
                return Container(
                  padding: const EdgeInsets.only(top: 10),
                  height: 200,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: ColorConstants.mainWhite,
                  ),
                  child: Column(
                    children: [
                      Container(
                        width: 40,
                        height: 3,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: ColorConstants.mainGrey,
                        ),
                      ),
                      const Row(
                        children: [Icon(Icons.abc), Text('data')],
                      )
                    ],
                  ),
                );
              },
            );
          },
        ),
        IconFunctionWidget(
          clickedColor: Colors.red,
          clickedIconData: Icons.favorite,
          iconData: Icons.favorite_outline,
          onPressed: () {},
        ),
        IconFunctionWidget(
          clickedColor: ColorConstants.bordersideBlue,
          clickedIconData: Icons.bookmark,
          iconData: Icons.bookmark_outline,
          onPressed: () {},
        ),
        IconFunctionWidget(
          iconData: Icons.share_outlined,
          onPressed: () {},
        ),
      ],
    );
  }
}

class IconFunctionWidget extends StatefulWidget {
  final IconData iconData; // Icon data
  final IconData? clickedIconData; // Icon data when clicked
  final VoidCallback onPressed; // Function to call when the icon is clicked
  final Color initialColor; // Initial color of the icon
  final Color clickedColor; // Color when the icon is clicked

  const IconFunctionWidget({
    super.key,
    required this.iconData,
    this.clickedIconData, // Optional clicked icon
    required this.onPressed,
    this.initialColor = ColorConstants.mainGrey, // Default initial color
    this.clickedColor = Colors.red, // Default clicked color
  });

  @override
  State<IconFunctionWidget> createState() => _IconFunctionWidgetState();
}

class _IconFunctionWidgetState extends State<IconFunctionWidget> {
  late Color currentColor;
  late IconData currentIcon;

  @override
  void initState() {
    super.initState();
    currentColor = widget.initialColor; // Set initial color
    currentIcon = widget.iconData; // Set initial icon
  }

  void _handlePress() {
    setState(() {
      // Toggle the color and icon when the icon is pressed
      if (currentColor == widget.initialColor) {
        currentColor = widget.clickedColor;
        currentIcon = widget.clickedIconData ??
            currentIcon; // Use clicked icon if provided
      } else {
        currentColor = widget.initialColor;
        currentIcon = widget.iconData; // Reset to initial icon
      }
    });
    widget.onPressed(); // Call the passed function
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _handlePress, // Call the function on tap
      child: SizedBox(
        child: Icon(
          currentIcon,
          color: currentColor, // Use the current color
        ),
      ),
    );
  }
}

class AnalyticsWidgetValues extends StatelessWidget {
  final String readingValue;
  final String label;

  const AnalyticsWidgetValues({
    super.key,
    required this.readingValue,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          readingValue,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        Text(
          ' $label',
          style: const TextStyle(
            fontWeight: FontWeight.normal,
            color: ColorConstants.mainGrey,
          ),
        ),
      ],
    );
  }
}

class PostHeaderSection extends StatelessWidget {
  const PostHeaderSection({
    super.key,
    required this.profileImageUrl,
    required this.authorName,
    required this.isBlueTick,
    required this.userId,
  });

  final String profileImageUrl;
  final String authorName;
  final bool? isBlueTick;
  final String userId;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          children: [
            // Profile picture
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
                    const SizedBox(width: 10),
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

        // Row for subscribe button and 3 dot icon

        Row(
          children: [
            // Subscribe button

            InkWell(
              onTap: () {},
              child: Container(
                width: 90,
                height: 25,
                decoration: BoxDecoration(
                    color: ColorConstants.mainWhite,
                    borderRadius: BorderRadius.circular(20)),
                child: const Center(
                  child: Text(
                    'Subscribe',
                    style: TextStyle(
                      color: ColorConstants.mainBlack,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),

            // 3 dot Icon

            const SizedBox(
              width: 10,
            ),

            const Icon(
              Icons.more_vert,
              color: ColorConstants.mainGrey,
              size: 20,
            ),
          ],
        )
      ],
    );
  }
}
