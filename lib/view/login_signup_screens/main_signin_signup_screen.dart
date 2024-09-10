import 'package:flutter/material.dart';
import 'package:twitter_clone/view/login_signup_screens/create_account_fill_details.dart';
import 'package:twitter_clone/view/utils/color_constants/color_constants.dart';
import 'package:twitter_clone/view/utils/image_constants/image_constants.dart';

class MainSigninSignupScreen extends StatelessWidget {
  const MainSigninSignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.mainBlack,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 30),

            // Logo Display top section
            _logoDisplay(),
            const Spacer(),

            // Text Section at middle
            _middleSectionText(),
            const Spacer(),

            // Sign in Button and Create Account Button

            // Google sign in Button
            const _googleSignInButton(),

            // Divider and or
            dividerSection(),

            // Create account button
            createAccountButton(context),

            const SizedBox(height: 20),

            // Text for Terms and Policy
            const TermsAndPolicyText(),

            const SizedBox(height: 40),

            // Have an account already? Log in
            loginText(),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

// Detailed Code

  Padding loginText() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          RichText(
            text: const TextSpan(
              text: 'Have an account already?',
              children: [
                TextSpan(
                  text: 'Log in',
                  style: TextStyle(color: ColorConstants.textBlue),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Padding createAccountButton(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 20, right: 20),
      child: InkWell(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => CreateAccountFillDetails(),
              ));
        },
        child: Container(
          margin: const EdgeInsets.all(10.0),
          height: 40,
          decoration: BoxDecoration(
            color: ColorConstants.mainWhite,
            borderRadius: BorderRadius.circular(30),
          ),
          child: const Center(
            child: Text(
              "Create account",
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
          ),
        ),
      ),
    );
  }

  Padding dividerSection() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 40.0),
      child: Row(
        children: [
          Expanded(
            child: Divider(thickness: 1, color: ColorConstants.mainGrey),
          ),
          Text(
            ' or ',
            style: TextStyle(color: ColorConstants.mainGrey),
          ),
          Expanded(
            child: Divider(thickness: 1, color: ColorConstants.mainGrey),
          ),
        ],
      ),
    );
  }

  Padding _middleSectionText() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 30.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            "See what' s\nhappening in the\nworld right now.",
            style: TextStyle(
              color: ColorConstants.mainWhite,
              fontSize: 30,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Container _logoDisplay() {
    return Container(
      height: 50,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(ImagesConstants.xlogo),
        ),
      ),
    );
  }
}

class TermsAndPolicyText extends StatelessWidget {
  const TermsAndPolicyText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30.0, right: 20),
      child: RichText(
        text: const TextSpan(
          text: 'By signing up, you agree to our ',
          children: [
            TextSpan(
              text: 'Terms, Privacy Policy,',
              style: TextStyle(color: ColorConstants.textBlue),
            ),
            TextSpan(
              text: ' and',
            ),
            TextSpan(
              text: ' Cookie Use.',
              style: TextStyle(color: ColorConstants.textBlue),
            ),
          ],
        ),
      ),
    );
  }
}

// ignore: camel_case_types
class _googleSignInButton extends StatelessWidget {
  const _googleSignInButton();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: Container(
        margin: const EdgeInsets.all(10.0),
        height: 40,
        decoration: BoxDecoration(
          color: ColorConstants.mainWhite,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 30,
              width: 30,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                image: AssetImage(ImagesConstants.googlelogo),
              )),
            ),
            const SizedBox(width: 10),
            const Text(
              "Continue with Google",
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
    );
  }
}
