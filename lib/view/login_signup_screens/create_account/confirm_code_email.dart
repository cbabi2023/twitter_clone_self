import 'package:flutter/material.dart';
import 'package:twitter_clone/view/login_signup_screens/create_account/choose_new_password.dart';
import 'package:twitter_clone/view/login_signup_screens/create_account/email_confirmation_code_send.dart';
import 'package:twitter_clone/view/utils/color_constants/color_constants.dart';
import 'package:twitter_clone/view/utils/image_constants/image_constants.dart';

class ConfirmCodeEmail extends StatelessWidget {
  const ConfirmCodeEmail({super.key});

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
              'We sent you a code',
              style: TextStyle(
                color: ColorConstants.mainWhite,
                fontWeight: FontWeight.w600,
                fontSize: 24,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              'Check your email to get you confirmation code. If you need to request a new code, go back and reselect a confirmation.',
              style: TextStyle(
                color: ColorConstants.mainGrey,
                fontWeight: FontWeight.normal,
                fontSize: 15,
              ),
            ),
            const SizedBox(
              height: 20,
            ),

            // Textfield Box

            TextField(
              style: const TextStyle(
                color: ColorConstants.mainWhite,
              ),
              decoration: InputDecoration(
                labelText: 'Enter your code',
                hintText: 'Enter your code',
                hintStyle: const TextStyle(
                  color: ColorConstants.mainGrey,
                ),
                labelStyle: const TextStyle(
                  color: ColorConstants.mainGrey,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(
                    color: ColorConstants.mainGrey,
                    width: 1,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(
                    color: ColorConstants.mainGrey,
                    width: 1,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(
                    color: ColorConstants.bordersideBlue,
                    width: 2,
                  ),
                ),
              ),
            ),

            // Floating button to next page

            const Spacer(),

            // Next Button

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 70,
                  height: 35,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: ColorConstants.mainWhite,
                        width: 2,
                      )),
                  child: FloatingActionButton(
                    backgroundColor: ColorConstants.mainBlack,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              const EmailConfirmationCodeSend(),
                        ),
                      );
                    },
                    child: const Text(
                      "Cancel",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: ColorConstants.mainWhite,
                      ),
                    ),
                  ),
                ),
                Container(
                  width: 70,
                  height: 35,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: FloatingActionButton(
                    backgroundColor: ColorConstants.mainWhite,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ChooseNewPassword(),
                        ),
                      );
                    },
                    child: const Text(
                      "Next",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
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
