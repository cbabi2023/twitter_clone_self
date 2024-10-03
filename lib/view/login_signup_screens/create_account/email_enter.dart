import 'package:flutter/material.dart';
import 'package:twitter_clone/view/login_signup_screens/create_account/email_confirmation_code_send.dart';
import 'package:twitter_clone/view/login_signup_screens/create_account_fill_details.dart';
import 'package:twitter_clone/view/utils/color_constants/color_constants.dart';
import 'package:twitter_clone/view/utils/image_constants/image_constants.dart';

class EmailEnterScreen extends StatelessWidget {
  const EmailEnterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // App bar section

      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const CreateAccountFillDetails(),
              ),
            );
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
          children: [
            // Heading title

            const Text(
              'To get started, first enter your phone, email, or @username',
              style: TextStyle(
                color: ColorConstants.mainWhite,
                fontWeight: FontWeight.w600,
                fontSize: 24,
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
                labelText: 'Phone,email, or username',
                hintText: 'Phone,email, or username',
                hintStyle: const TextStyle(
                  color: ColorConstants.mainGrey,
                ),
                labelStyle: const TextStyle(
                  color: ColorConstants.mainGrey,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(
                    color: ColorConstants.bordersideBlue,
                    width: 1,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(
                    color: ColorConstants.bordersideBlue,
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
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
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
                          builder: (context) => const EmailConfirmationCodeSend(),
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
