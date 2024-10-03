import 'package:flutter/material.dart';
import 'package:twitter_clone/view/login_signup_screens/create_account/you_are_all_set.dart';
import 'package:twitter_clone/view/utils/color_constants/color_constants.dart';
import 'package:twitter_clone/view/utils/image_constants/image_constants.dart';

class ChooseNewPassword extends StatelessWidget {
  const ChooseNewPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Heading title
                    const SizedBox(
                      height: 20,
                    ),

                    const Text(
                      'Choose a new password',
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
                      'Make sure your new password is 8 characters or more. Try including numbers, letters, and punctuations marks for a strong password',
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
                      "You'll be logged out of all active X session after your password is changed.",
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
                      enabled: false,
                      style: const TextStyle(
                        color: ColorConstants.mainWhite,
                      ),
                      decoration: InputDecoration(
                        hintText: 'yourmail@gmail.com',
                        hintStyle: const TextStyle(
                          color: ColorConstants.mainWhite,
                        ),
                        labelStyle: const TextStyle(
                          color: ColorConstants.mainGrey,
                        ),
                        disabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                            color: ColorConstants.mainGrey,
                            width: 1,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),

                    // password field and confirm password field

                    PasswordTextFiled(
                      hintText: 'Enter a new password',
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    PasswordTextFiled(
                      hintText: 'Confirm your password',
                    ),
                  ],
                ),
                const SizedBox(
                  height: 250,
                ),
                // Floating button to next page

                // Next Button

                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      width: 150,
                      height: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: FloatingActionButton(
                        backgroundColor: ColorConstants.mainWhite,
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const YouAreAllSet(),
                            ),
                          );
                        },
                        child: const Text(
                          "Change password",
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
        ),
      ),
    );
  }
}

class PasswordTextFiled extends StatelessWidget {
  String? hintText;
  PasswordTextFiled({super.key, required this.hintText});

  @override
  Widget build(BuildContext context) {
    return TextField(
      enabled: true,
      style: const TextStyle(
        color: ColorConstants.mainWhite,
      ),
      decoration: InputDecoration(
        hintText: hintText,
        labelText: hintText,
        hintStyle: const TextStyle(
          color: ColorConstants.mainGrey,
        ),
        labelStyle: const TextStyle(
          color: ColorConstants.mainGrey,
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
            width: 1,
          ),
        ),
      ),
    );
  }
}
