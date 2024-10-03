import 'package:flutter/material.dart';
import 'package:twitter_clone/view/home_screen/home_screen.dart';
import 'package:twitter_clone/view/utils/color_constants/color_constants.dart';
import 'package:twitter_clone/view/utils/image_constants/image_constants.dart';

class YouAreAllSet extends StatelessWidget {
  const YouAreAllSet({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // App bar section

      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.close,
            color: ColorConstants.mainWhite,
          ),
        ),
        title: SizedBox(
          width: 250,
          child: Container(
            height: 40,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(ImagesConstants.xlogo),
              ),
            ),
          ),
        ),
      ),

      // Text Heading Section

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Heading title
            const SizedBox(
              height: 20,
            ),

            const Text(
              "You' re all set",
              style: TextStyle(
                color: ColorConstants.mainWhite,
                fontWeight: FontWeight.w600,
                fontSize: 38,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              "You' ve successfully changed your password.",
              style: TextStyle(
                color: ColorConstants.mainGrey,
                fontWeight: FontWeight.normal,
                fontSize: 16,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              "Add an extra layer of security to your account with two-factor authentication. Enable it in your settings to help make sure that you, and only you, can access your account.",
              style: TextStyle(
                color: ColorConstants.mainGrey,
                fontWeight: FontWeight.normal,
                fontSize: 16,
              ),
            ),
            const SizedBox(
              height: 20,
            ),

            // Continue to X

            Row(
              children: [
                Expanded(
                  child: Container(
                    width: 70,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: FloatingActionButton(
                      backgroundColor: ColorConstants.mainWhite,
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>  HomeScreen(),
                          ),
                        );
                      },
                      child: const Text(
                        "Continue to X",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
