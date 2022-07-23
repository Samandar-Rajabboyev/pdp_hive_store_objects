import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/brandico_icons.dart';
import 'package:fluttericon/font_awesome_icons.dart';
import 'package:pdp_hive_store_objects/constants/colors.dart';
import 'package:pdp_hive_store_objects/models/account_model.dart';
import 'package:pdp_hive_store_objects/pages/sign_in_page.dart';
import 'package:pdp_hive_store_objects/widgets/my_text_field.dart';

import '../services/db_services.dart';

class SignUpPage extends StatefulWidget {
  static const String id = "sign_up_page";
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _numberController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();

  void _createAccount() {
    String email = _emailController.text.toString().trim();
    String number = _numberController.text.toString().trim();
    String address = _addressController.text.toString().trim();

    Account account = Account(email: email, number: number, address: address);

    HiveDB.storeAccount(account);

    Account a = HiveDB.loadAccount();

    if (kDebugMode) {
      print(a.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: clrPrimary,
          padding: const EdgeInsets.only(top: 25),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  height: h * .2,
                  width: w,
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Spacer(flex: 3),
                      Text(
                        'Welcome',
                        style: TextStyle(color: Colors.white24, fontSize: 20, fontWeight: FontWeight.w500),
                      ),
                      Spacer(),
                      Text(
                        'Sign Up',
                        style: TextStyle(color: Colors.white, fontSize: 38, fontWeight: FontWeight.w500),
                      ),
                      Spacer(flex: 5),
                    ],
                  ),
                ),
                Container(
                  height: h * .7,
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(40), topRight: Radius.circular(40)),
                  ),
                  child: Column(
                    children: [
                      const Spacer(),
                      buildTextField(hint: 'Email', controller: _emailController),
                      buildTextField(hint: 'Number', controller: _numberController),
                      buildTextField(hint: 'Address', controller: _addressController),
                      const Spacer(flex: 4),
                      SizedBox(
                        width: w,
                        child: MaterialButton(
                          onPressed: _createAccount,
                          color: clrPrimary,
                          padding: const EdgeInsets.symmetric(vertical: 15),
                          elevation: 0,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                          child: const Text(
                            "Sign Up",
                            style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.w400),
                          ),
                        ),
                      ),
                      const Spacer(),
                      Row(
                        children: [
                          buildLine(),
                          Text(
                            '   OR   ',
                            style: TextStyle(color: clrLightGrey, fontSize: 16, fontWeight: FontWeight.w600),
                          ),
                          buildLine(),
                        ],
                      ),
                      const Spacer(flex: 2),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: const [
                          Icon(
                            Brandico.facebook_1,
                            color: Color(0xff5F7DBE),
                          ),
                          Icon(
                            Brandico.twitter_bird,
                            color: Color(0xff13b5f9),
                          ),
                          Icon(
                            FontAwesome.instagram,
                            color: Color(0xffff007d),
                          ),
                        ],
                      ),
                      const Spacer(flex: 3),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamedAndRemoveUntil(context, SignInPage.id, (route) => false);
                        },
                        child: RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: 'Already have an account ?  ',
                                style: TextStyle(
                                  color: clrLightGrey,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              const TextSpan(
                                text: 'SignIn',
                                style: TextStyle(
                                  color: clrPrimary,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const Spacer(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Expanded buildLine() {
    return Expanded(
      child: Container(
        height: 1,
        color: clrLightGrey,
      ),
    );
  }
}
