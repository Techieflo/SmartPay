import 'package:assessment/controllers/signup_controllers.dart';
import 'package:assessment/views/signin_page.dart';
import 'package:assessment/views/subwidgets/backbutton.dart';
import 'package:assessment/views/subwidgets/signinrow.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';

class Signup extends StatelessWidget {
  Signup({super.key});
  final SignUpController signUpController = Get.put(SignUpController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(5.0),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const SizedBox(
          height: 50,
        ),
        Row(
          children: [
            const SizedBox(
              width: 20,
            ),
            InkWell(
                onTap: () {
                  Get.back();
                },
                child: backbutton()),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20.0),
          child: Row(
            children: [
              Text(
                "Create a ",
                style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: HexColor("#111827")),
              ),
              Text(
                "Smartpay",
                style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: HexColor("#0A6375")),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20.0),
          child: Text(
            "account",
            style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: HexColor("#111827")),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Form(
          child: Column(
            children: [
              Container(
                height: 70,
                padding: const EdgeInsets.symmetric(horizontal: 5.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: Obx(
                  () => TextFormField(
                    autofocus: false,
                    maxLines: 1,
                    autovalidateMode: AutovalidateMode.disabled,
                    onChanged: signUpController.email,
                    decoration: InputDecoration(
                      errorText: signUpController.isEmailValid.value
                          ? null
                          : 'Enter a valid email',
                      hintText: 'Email',
                      hintStyle: const TextStyle(fontFamily: "SFPro"),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.transparent),
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.blue, width: 2.0),
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 15),
                      fillColor: HexColor("#eceff4"),
                      filled: true,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                height: 70,
                padding: const EdgeInsets.symmetric(horizontal: 5.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: Obx(
                  () => TextFormField(
                    autovalidateMode: AutovalidateMode.disabled,
                    onChanged: signUpController.password,
                    maxLines: 1,
                    obscureText: true,
                    obscuringCharacter: ".",
                    decoration: InputDecoration(
                      errorText: signUpController.isPasswordValid.value
                          ? null
                          : 'Enter at least 6 characters',
                      suffixIcon: const Icon(
                        Icons.visibility_off_rounded,
                        color: Colors.grey,
                      ),
                      hintText: 'Password',
                      hintStyle: const TextStyle(fontFamily: "SFPro"),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.transparent),
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.blue, width: 2.0),
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 15),
                      fillColor: HexColor("#eceff4"),
                      filled: true,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 50),
          height: 50,
          decoration: BoxDecoration(
            color: HexColor("#111827").withOpacity(.7),
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: GestureDetector(
            onTap: () {
              signUpController.signUp();
              // Get.to(() => VerifyEmail());
            },
            child: const Center(
                child: Text(
              "Sign Up",
              style: TextStyle(
                  color: Color.fromARGB(255, 190, 178, 178),
                  fontSize: 20,
                  fontFamily: "SFPro"),
            )),
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        Stack(
          children: [
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Divider(),
            ),
            Center(
                child: Container(
                    margin: const EdgeInsets.only(top: 5),
                    color: Colors.white,
                    child: const Text(
                      "or",
                      style: TextStyle(fontSize: 16),
                    )))
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        LogosRow(),
        const SizedBox(
          height: 100,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Already have an account? ",
              style: TextStyle(fontSize: 16),
            ),
            InkWell(
              onTap: () {
                Get.to(
                  () => Signin(),
                  transition: Transition.fade,
                  duration: const Duration(milliseconds: 500),
                );
              },
              child: Text(" Sign In",
                  style: TextStyle(
                      fontSize: 16,
                      color: HexColor("#0A6375"),
                      fontFamily: "SFPro",
                      fontWeight: FontWeight.w800)),
            ),
          ],
        ),
      ]),
    ));
  }
}
