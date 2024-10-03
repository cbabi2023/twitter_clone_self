import 'package:flutter/material.dart';
import 'package:twitter_clone/view/login_signup_screens/create_account/confirm_code_email.dart';
import 'package:twitter_clone/view/login_signup_screens/create_account/email_enter.dart';

import 'package:twitter_clone/view/utils/color_constants/color_constants.dart';
import 'package:twitter_clone/view/utils/image_constants/image_constants.dart';

class EmailConfirmationCodeSend extends StatefulWidget {
  const EmailConfirmationCodeSend({super.key});

  @override
  State<EmailConfirmationCodeSend> createState() =>
      _EmailConfirmationCodeSendState();
}

class _EmailConfirmationCodeSendState extends State<EmailConfirmationCodeSend> {
  String? selectedOptionRadio;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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

      // body

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Heading title

            const Text(
              'Where should we send a confirmation code?',
              style: TextStyle(
                color: ColorConstants.mainWhite,
                fontWeight: FontWeight.w600,
                fontSize: 28,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              "Before you can change your password. we need to make sure it' s really you.",
              style: TextStyle(
                color: ColorConstants.mainGrey,
                fontWeight: FontWeight.normal,
                fontSize: 15,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              "Start by choosing where to send a \nconfirmation code.",
              style: TextStyle(
                color: ColorConstants.mainGrey,
                fontWeight: FontWeight.normal,
                fontSize: 15,
              ),
            ),
            const SizedBox(
              height: 20,
            ),

            // send an email text and radio button

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Send an email to ',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: ColorConstants.mainWhite,
                    fontSize: 18,
                  ),
                ),

                // radio button

                Radio(
                  value: 'email',
                  groupValue: selectedOptionRadio,
                  onChanged: (value) {
                    setState(() {
                      selectedOptionRadio = value;
                    });
                  },
                  activeColor: ColorConstants.bordersideBlue,
                )
              ],
            ),
            const Text(
              'ab*********@g**** ***** ',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: ColorConstants.mainWhite,
                fontSize: 18,
              ),
            ),

            // Floating button to next page

            const Spacer(),

            // Next Button and cancel button

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
                      )),
                  child: FloatingActionButton(
                    backgroundColor: ColorConstants.mainBlack,
                    onPressed: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const EmailEnterScreen(),
                          ));
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
                          builder: (context) => const ConfirmCodeEmail(),
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
