import 'package:firebase_auth/firebase_auth.dart';
import 'package:interioro_casa/utils.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => {FocusScope.of(context).unfocus()},
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
              child: Stack(children: [
            Container(
              decoration: const BoxDecoration(
                color: Colors.transparent,
                image: DecorationImage(
                  fit: BoxFit.cover,
                  alignment: Alignment.topRight,
                  image: AssetImage(
                    'assets/images/login.jpg',
                  ),
                ),
              ),
              height: MediaQuery.of(context).size.height,
            ),
            SingUp(
              emailController: emailController,
              context: context,
            )
          ])),
        ),
      ),
    );
  }
}

class SingUp extends StatelessWidget {
  const SingUp({
    Key? key,
    required this.emailController,
    required this.context,
  }) : super(key: key);

  final TextEditingController emailController;
  final BuildContext context;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Center(
      child: Container(
        height: size.height,
        color: const Color(0xff2b343c).withOpacity(0.8),
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: const Icon(
                      Icons.arrow_back,
                      size: 30,
                    ),
                    color: Colors.white,
                  ),
                ],
              ),
              const SizedBox(height: 40),
              GradientText("Forgot Password",
                  style: const TextStyle(
                      fontSize: 30, fontWeight: FontWeight.bold),
                  colors: const [
                    Color(0xff8436ea),
                    Color(0xff993091),
                    Color(0xffe52b54),
                  ]),
              Text(
                "Please enter your email address to reset your password",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey[400]),
              ),
              const SizedBox(
                height: 20,
              ),
              CustomTextField(
                label: "EMAIL",
                hint: "abc@gmail.com",
                icon: CupertinoIcons.at,
                controller: emailController,
              ),
              const SizedBox(
                height: 40,
              ),
              SizedBox(
                height: 55,
                width: double.infinity,
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(100),
                      gradient: const LinearGradient(
                          begin: FractionalOffset.topLeft,
                          end: FractionalOffset.bottomRight,
                          colors: [
                            Color(0xff8436ea),
                            Color(0xff993091),
                            Color(0xffe52b54),
                          ],
                          stops: [
                            0.0,
                            0.33,
                            1.0
                          ])),
                  child: TextButton(
                      onPressed: resetPassword,
                      child: Row(
                        children: const [
                          Expanded(
                            child: Center(
                              child: Text(
                                "Recover Password",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          Icon(
                            Icons.arrow_forward,
                            color: Colors.white,
                            size: 32,
                          ),
                        ],
                      )),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future resetPassword() async {
    try {
      showDialog(
          context: context,
          // barrierDismissible: false,
          useRootNavigator: true,
          builder: ((context) => const Center(
                child: CircularProgressIndicator(
                  semanticsLabel: "Email Sent",
                ),
              )));
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: emailController.text);
    } on FirebaseAuthException catch (e) {
      Utils.showSnackBar(e.message);
    }

    Navigator.pop(context);
  }
}

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key? key,
    required this.label,
    required this.hint,
    required this.icon,
    required this.controller,
    this.isPassWordField,
  }) : super(key: key);

  final String label;
  final String hint;
  final IconData icon;
  final bool? isPassWordField;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        obscureText: isPassWordField ?? false,
        controller: controller,
        style: const TextStyle(
            color: Colors.white, fontWeight: FontWeight.bold, fontSize: 22),
        decoration: InputDecoration(
            hintText: hint,
            hintStyle: const TextStyle(
              color: Colors.white30,
            ),
            floatingLabelBehavior: FloatingLabelBehavior.always,
            enabledBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white38)),
            focusedBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white)),
            border: InputBorder.none,
            prefixIcon: Icon(
              icon,
              size: 30,
              color: Colors.white,
            ),
            labelText: label,
            labelStyle: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w800,
              color: Colors.white,
            )));
  }
}
