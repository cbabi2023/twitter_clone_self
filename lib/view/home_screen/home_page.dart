import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:twitter_clone/view/database/dummydb.dart';
import 'package:twitter_clone/view/global_items/common_components.dart';
import 'package:twitter_clone/view/global_items/tweet_template.dart';
import 'package:twitter_clone/view/home_screen/home_screen.dart';
import 'package:twitter_clone/view/home_screen/single_tweet/single_tweet.dart';
import 'package:twitter_clone/view/utils/color_constants/color_constants.dart';
import 'package:twitter_clone/view/utils/image_constants/image_constants.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        initialIndex: 0,
        length: 2,
        child: Scaffold(
          floatingActionButton: Container(
            margin: const EdgeInsets.only(bottom: 10, right: 10),
            child: FloatingActionButton(
              backgroundColor: ColorConstants.bordersideBlue,
              onPressed: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const HomeScreen(),
                    ));
              },
              shape: RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.circular(30), // Adjust the radius as needed
              ),
              child: const Icon(
                Icons.add,
                color: ColorConstants.mainWhite,
              ),
            ),
          ),
          body: const Column(
            children: [
              XtopappBar(),
              TabBar(
                dividerColor: ColorConstants.mainGrey,
                indicatorColor: ColorConstants.bordersideBlue,
                indicatorSize: TabBarIndicatorSize.tab,
                labelColor: ColorConstants.mainWhite,
                tabs: [
                  Tab(text: 'For you'),
                  Tab(text: 'Following'),
                ],
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    ForyouTab(),
                    ForyouTab(),
                  ],
                ),
              ),
            ],
          ),

          // Drawer || side bar

          drawer: Drawer(
            child: Container(
              color: ColorConstants.mainBlack,
              height: double.infinity,
              child: ListView(
                padding: EdgeInsets.zero,
                children: <Widget>[
                  const DrawerHeader(
                    decoration: BoxDecoration(
                      color: ColorConstants.mainBlack,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Profile

                        CircleAvatar(
                          radius: 18,
                          backgroundImage:
                              AssetImage(ImagesConstants.googlelogo),
                          backgroundColor: ColorConstants.mainWhite,
                        ),

                        SizedBox(
                          height: 10,
                        ),

                        // Profile Name

                        Text(
                          'Abijith C B',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        // userid

                        Text(
                          '@abijithcb2024',
                          style: TextStyle(
                            color: ColorConstants.mainGrey,
                            fontSize: 15,
                          ),
                        ),

                        SizedBox(
                          height: 15,
                        ),

                        // 6 following 1 follower

                        Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: '6',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: ColorConstants.mainWhite,
                                  fontSize: 15,
                                ),
                              ),
                              TextSpan(
                                text: ' Following ',
                                style: TextStyle(
                                  fontWeight: FontWeight.normal,
                                  color: ColorConstants.mainGrey,
                                  fontSize: 13,
                                ),
                              ),
                              TextSpan(
                                text: ' 1 ',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: ColorConstants.mainWhite,
                                  fontSize: 15,
                                ),
                              ),
                              TextSpan(
                                text: 'Follower ',
                                style: TextStyle(
                                  fontWeight: FontWeight.normal,
                                  color: ColorConstants.mainGrey,
                                  fontSize: 13,
                                ),
                              ),
                            ],
                          ),
                        ),

                        // Profiel Header section ended
                      ],
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        children: [
                          const SizedBox(
                            height: 30,
                          ),

                          ListTile(
                            leading: const Icon(
                              Icons.person_outline,
                              color: ColorConstants.mainWhite,
                              size: 30,
                            ),
                            title: const Text(
                              'Profile',
                              style: TextStyle(
                                  color: ColorConstants.mainWhite,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20),
                            ),
                            onTap: () {
                              // Handle settings tap
                            },
                          ),
                          const SizedBox(
                            height: 5,
                          ),

                          // Premium section

                          ListTile(
                            leading: const FaIcon(
                              FontAwesomeIcons.xTwitter,
                              color: ColorConstants.mainWhite,
                            ),
                            title: const Text(
                              'Premium',
                              style: TextStyle(
                                  color: ColorConstants.mainWhite,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20),
                            ),
                            onTap: () {
                              // Handle settings tap
                            },
                          ),
                          const SizedBox(
                            height: 5,
                          ),

                          // Bookmark section

                          ListTile(
                            leading: const FaIcon(
                              FontAwesomeIcons.bookmark,
                              color: ColorConstants.mainWhite,
                            ),
                            title: const Text(
                              'Bookmarks',
                              style: TextStyle(
                                  color: ColorConstants.mainWhite,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20),
                            ),
                            onTap: () {
                              // Handle settings tap
                            },
                          ),

                          const SizedBox(
                            height: 5,
                          ),

                          // Lists section

                          ListTile(
                            leading: const FaIcon(
                              FontAwesomeIcons.book,
                              color: ColorConstants.mainWhite,
                            ),
                            title: const Text(
                              'Lists',
                              style: TextStyle(
                                  color: ColorConstants.mainWhite,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20),
                            ),
                            onTap: () {
                              // Handle settings tap
                            },
                          ),

                          const SizedBox(
                            height: 5,
                          ),
                          // Spaces section

                          ListTile(
                            leading: const FaIcon(
                              FontAwesomeIcons.podcast,
                              color: ColorConstants.mainWhite,
                            ),
                            title: const Text(
                              'Spaces',
                              style: TextStyle(
                                  color: ColorConstants.mainWhite,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20),
                            ),
                            onTap: () {
                              // Handle settings tap
                            },
                          ),

                          const SizedBox(
                            height: 5,
                          ),
                          // Monetization section

                          ListTile(
                            leading: const FaIcon(
                              FontAwesomeIcons.moneyBill1,
                              color: ColorConstants.mainWhite,
                            ),
                            title: const Text(
                              'Monetization',
                              style: TextStyle(
                                  color: ColorConstants.mainWhite,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20),
                            ),
                            onTap: () {
                              // Handle settings tap
                            },
                          ),

                          Divider(
                            color: ColorConstants.mainGrey.withOpacity(0.3),
                          ),

                          const SizedBox(
                            height: 5,
                          ),

                          // Settings & Support

                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 15.0),
                            child: RepliesWidgetFunctions(
                              textValueBold: true,
                              textValue: 'Settings & Support',
                              iconValue: Icons.keyboard_arrow_down,
                              spaceBetween: true,
                            ),
                          ),
                        ],
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 60.0, left: 20),
                        child: FaIcon(
                          FontAwesomeIcons.moon,
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class ForyouTab extends StatelessWidget {
  const ForyouTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
      child: ListView.separated(
        separatorBuilder: (context, index) => Divider(
          color: ColorConstants.mainGrey.withOpacity(0.5),
        ),
        itemCount: Dummydb.tweetTemplateData.length,
        itemBuilder: (context, index) {
          final tweet = Dummydb.tweetTemplateData[index];
          return InkWell(
            onTap: () {
              // Navigate to the tweet details page
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SingleTweetScreen(
                    commentCount: tweet['commentCount'],
                    repostCount: tweet['repostCount'],
                    likeCount: tweet['likeCount'],
                    analyticsCount: tweet['analyticsCount'],
                    profileImageUrl: tweet['profileImageUrl'],
                    authorName: tweet['authorName'],
                    tweetContent: tweet['tweetContent'],
                    postTime: tweet['postTime'],
                    mediaUrl: tweet['mediaUrl'],
                    userId: tweet['userId'],
                    isBlueTick: tweet.containsKey('isBlueTick')
                        ? tweet['isBlueTick']
                        : false,
                  ),
                ),
              );
            },
            child: BuildTweetBox(
              profileImageUrl: tweet['profileImageUrl'],
              authorName: tweet['authorName'],
              userId: tweet['userId'],
              postTime: tweet['postTime'],
              tweetContent: tweet['tweetContent'],
              commentCount: tweet['commentCount'],
              repostCount: tweet['repostCount'],
              likeCount: tweet['likeCount'],
              analyticsCount: tweet['analyticsCount'],
              mediaUrl: tweet['mediaUrl'],
              isBlueTick:
                  tweet.containsKey('isBlueTick') ? tweet['isBlueTick'] : false,
            ),
          );
        },
      ),
    );
  }
}
