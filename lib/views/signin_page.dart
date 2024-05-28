import 'package:assessment/controllers/login_controller.dart';
import 'package:assessment/views/homescreen.dart';
import 'package:assessment/views/sign_up.dart';
import 'package:assessment/views/subwidgets/backbutton.dart';
import 'package:assessment/views/subwidgets/signinrow.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';

class Signin extends StatelessWidget {
  Signin({super.key});
  final UserController userController = Get.put(UserController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading: false,
          leading: GestureDetector(
              onTap: () {
                Get.off(() => Homescreen());
              },
              child: Row(
                children: [
                  const SizedBox(
                    width: 10,
                  ),
                  backbutton(),
                ],
              ))),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(
              "Hi There! 👋",
              style: TextStyle(
                fontSize: 26,
                // fontFamily: "SFPro",
                fontWeight: FontWeight.bold,
                color: HexColor("#111827"),
              ),
            ),
            const Text(
              "Welcome back, Sign into your account",
              style: TextStyle(
                fontFamily: "SFPro",
                fontSize: 16,
              ),
            ),
            const SizedBox(
              height: 35,
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
                        onChanged: userController.setEmail,
                        decoration: InputDecoration(
                          errorText: userController.emailValid.value
                              ? null
                              : 'Invalid email',
                          hintText: 'Email',
                          hintStyle: const TextStyle(fontFamily: "SFPro"),
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                const BorderSide(color: Colors.transparent),
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Colors.blue, width: 2.0),
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
                        maxLines: 1,
                        onChanged: userController.setPassword,
                        obscureText: true,
                        obscuringCharacter: ".",
                        decoration: InputDecoration(
                          errorText: userController.passwordValid.value
                              ? null
                              : 'Password must be at least 6 characters',
                          suffixIcon: const Icon(
                            Icons.visibility_off_rounded,
                            color: Colors.grey,
                          ),
                          hintText: 'Password',
                          hintStyle: const TextStyle(fontFamily: "SFPro"),
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                const BorderSide(color: Colors.transparent),
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Colors.blue, width: 2.0),
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
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                "Forgot password?",
                style: TextStyle(
                    fontSize: 18,
                    color: HexColor("#0A6375"),
                    fontWeight: FontWeight.bold,
                    fontFamily: "SFPro"),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 50),
              height: 50,
              decoration: BoxDecoration(
                color: HexColor("#111827"),
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: GestureDetector(
                onTap: () {
                  userController.submit();
                },
                child: const Center(
                    child: Text(
                  "Get Started",
                  style: TextStyle(
                      color: Colors.white, fontSize: 20, fontFamily: "SFPro"),
                )),
              ),
            ),
            const SizedBox(
              height: 50,
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
                  "Don't have an account? ",
                  style: TextStyle(fontSize: 16),
                ),
                InkWell(
                  onTap: () {
                    Get.to(
                      () => Signup(),
                      transition: Transition.fadeIn,
                      duration: Duration(milliseconds: 500),
                    );
                  },
                  child: Text(" Sign Up",
                      style: TextStyle(
                          fontSize: 16,
                          color: HexColor("#0A6375"),
                          fontFamily: "SFPro",
                          fontWeight: FontWeight.w800)),
                ),
              ],
            )
          ]),
        ),
      ),
    );
  }
}
