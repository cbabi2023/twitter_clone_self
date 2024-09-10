import 'package:flutter/material.dart';
import 'package:twitter_clone/view/utils/color_constants/color_constants.dart';
import 'package:twitter_clone/view/utils/image_constants/image_constants.dart';

class CreateAccountFillDetails extends StatefulWidget {
  const CreateAccountFillDetails({super.key});

  @override
  State<CreateAccountFillDetails> createState() =>
      _CreateAccountFillDetailsState();
}

class _CreateAccountFillDetailsState extends State<CreateAccountFillDetails> {
  final TextEditingController _dateController = TextEditingController();

  Future<void> _selectDate(BuildContext context) async {
    DateTime? selectedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(), // Set initial date to today
      firstDate: DateTime(1900), // Set the earliest selectable date
      lastDate: DateTime(2100), // Set the latest selectable date
    );

    if (selectedDate != null) {
      // Manually format the date to MM/dd/yyyy
      String formattedDate = '${selectedDate.month.toString().padLeft(2, '0')}/'
          '${selectedDate.day.toString().padLeft(2, '0')}/'
          '${selectedDate.year}';
      _dateController.text = formattedDate;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorConstants.mainBlack,
        appBar: AppBar(
          backgroundColor: Colors.black,
          iconTheme: const IconThemeData(color: ColorConstants.mainWhite),
          title: SizedBox(
            width: 210,
            child: Container(
              height: 50,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(ImagesConstants.xlogo),
                ),
              ),
            ),
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Heading Text

            headingSection(),

            // Text Field Forms

            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 30.0, vertical: 40),
              child: Column(
                children: [
                  // Name
                  nameTextForm(),

                  // Phone Number
                  const SizedBox(height: 20),

                  phoneNumberTextForm(),

                  // Date of Birth
                  const SizedBox(height: 20),

                  TextFormField(
                    controller: _dateController,
                    style: const TextStyle(color: Colors.white),
                    decoration: const InputDecoration(
                      label: Text('Date of Birth'),
                      suffixIcon: Icon(
                        Icons.error,
                        color: Colors.red,
                      ),
                      labelStyle: TextStyle(color: Colors.grey),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red),
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                      ),
                    ),
                    onTap: () {
                      // Prevent keyboard from showing
                      FocusScope.of(context).requestFocus(FocusNode());
                      _selectDate(context);
                    },
                  ),
                ],
              ),
            )
          ],
        ),
        floatingActionButton: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: 40,
            width: 80,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
            ),
            child: FloatingActionButton(
              backgroundColor: ColorConstants.mainWhite,
              onPressed: () {},
              child: const Text(
                'Next',
                style: TextStyle(fontSize: 16),
              ),
            ),
          ),
        ));
  }

  TextFormField phoneNumberTextForm() {
    return TextFormField(
      style: const TextStyle(color: ColorConstants.mainWhite),
      keyboardType: TextInputType.number,
      decoration: const InputDecoration(
        label: Text('Phone Number'),
        suffixIcon: Icon(
          Icons.error,
          color: ColorConstants.errorRed,
        ),
        labelStyle: TextStyle(color: ColorConstants.mainGrey),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: ColorConstants.mainWhite),
          borderRadius: BorderRadius.all(Radius.circular(5)),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: ColorConstants.mainWhite),
          borderRadius: BorderRadius.all(Radius.circular(5)),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: ColorConstants.errorRed),
          borderRadius: BorderRadius.all(Radius.circular(5)),
        ),
      ),
    );
  }

  TextFormField nameTextForm() {
    return TextFormField(
      style: const TextStyle(color: ColorConstants.mainWhite),
      decoration: const InputDecoration(
        label: Text('Name'),
        suffixIcon: Icon(
          Icons.check_circle,
          color: ColorConstants.correctGreen,
        ),
        labelStyle: TextStyle(color: ColorConstants.mainGrey),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: ColorConstants.mainWhite),
          borderRadius: BorderRadius.all(Radius.circular(5)),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: ColorConstants.mainWhite),
          borderRadius: BorderRadius.all(Radius.circular(5)),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: ColorConstants.errorRed),
          borderRadius: BorderRadius.all(Radius.circular(5)),
        ),
      ),
    );
  }

  Padding headingSection() {
    return const Padding(
      padding: EdgeInsets.only(left: 30, top: 20),
      child: Text(
        'Create your account',
        style: TextStyle(
            color: ColorConstants.mainWhite,
            fontSize: 25,
            fontWeight: FontWeight.w400),
      ),
    );
  }
}
