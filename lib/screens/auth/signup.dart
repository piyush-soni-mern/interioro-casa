import 'package:interioro_casa/screens/auth/login.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
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
            const SingUp()
          ])),
        ),
      ),
    );
  }
}

class SingUp extends StatelessWidget {
  const SingUp({
    Key? key,
  }) : super(key: key);

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
              GradientText("Create account",
                  style: const TextStyle(
                      fontSize: 30, fontWeight: FontWeight.bold),
                  colors: const [
                    Color(0xff8436ea),
                    Color(0xff993091),
                    Color(0xffe52b54),
                  ]),
              Text(
                "Create a new account",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey[400]),
              ),
              const SizedBox(
                height: 20,
              ),
              const CustomTextField(
                  label: "NAME", hint: "xyz", icon: Icons.person_outline),
              const SizedBox(
                height: 20,
              ),
              const CustomTextField(
                  label: "EMAIL",
                  hint: "abc@gmail.com",
                  icon: CupertinoIcons.at),
              const SizedBox(
                height: 20,
              ),
              const CustomTextField(
                  label: "PHONE",
                  hint: "+919414XXXXXX",
                  icon: Icons.phone_android),
              const CustomTextField(
                label: "PASSWORD",
                hint: "**********",
                icon: Icons.lock,
                isPassWordField: true,
              ),
              const CustomTextField(
                label: "CONFIRM PASSWORD",
                hint: "**********",
                icon: Icons.lock,
                isPassWordField: true,
              ),
              const SizedBox(
                height: 10,
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
                      onPressed: () {},
                      child: Row(
                        children: const [
                          Expanded(
                            child: Center(
                              child: Text(
                                "Create account",
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
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Already have an account? ",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: ((context) => const LoginScreen())));
                    },
                    child: const Text(
                      "Login",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key? key,
    required this.label,
    required this.hint,
    required this.icon,
    this.isPassWordField,
  }) : super(key: key);

  final String label;
  final String hint;
  final IconData icon;
  final bool? isPassWordField;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        obscureText: isPassWordField ?? false,
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
