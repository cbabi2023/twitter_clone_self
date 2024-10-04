import 'package:flutter/material.dart';
import 'package:twitter_clone/view/database/dummydb.dart';
import 'package:twitter_clone/view/global_items/common_components.dart';
import 'package:twitter_clone/view/global_items/tweet_template.dart';
import 'package:twitter_clone/view/home_screen/home_screen.dart';
import 'package:twitter_clone/view/home_screen/single_tweet/single_tweet.dart';
import 'package:twitter_clone/view/utils/color_constants/color_constants.dart';

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
