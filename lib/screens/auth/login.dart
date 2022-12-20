import 'package:firebase_auth/firebase_auth.dart';
import 'package:interioro_casa/screens/auth/signup.dart';
import 'package:interioro_casa/screens/auth/forgotPassword.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:fluttericon/font_awesome_icons.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:interioro_casa/utils.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'components/customIcon.dart';
import 'package:interioro_casa/screens/menu/menu.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return const Center(
              child: Text('Something went wrong'),
            );
          } else if (snapshot.hasData) {
            return const Menu();
          } else {
            return LoginWidget(
              emailController: emailController,
              passwordController: passwordController,
              context: context,
            );
          }
        });
  }
}

class LoginWidget extends StatelessWidget {
  const LoginWidget(
      {Key? key,
      required this.emailController,
      required this.passwordController,
      required this.context})
      : super(key: key);

  final TextEditingController emailController;
  final TextEditingController passwordController;
  final context;
  @override
  Widget build(BuildContext context) => GestureDetector(
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
                Login(
                  emailController: emailController,
                  passwordController: passwordController,
                  context: context,
                )
              ]),
            ),
          ),
        ),
      );
}

class Login extends StatelessWidget {
  const Login(
      {Key? key,
      required this.emailController,
      required this.passwordController,
      required this.context})
      : super(key: key);

  final TextEditingController emailController;
  final TextEditingController passwordController;
  final context;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Center(
      child: Container(
        height: size.height,
        color: const Color(0xff2b343c).withOpacity(0.8),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 40),
              Icon(
                Icons.person_outline,
                color: Colors.grey[300],
                size: 140,
              ),
              const SizedBox(
                height: 7,
              ),
              GradientText("Login to stay fit",
                  style: const TextStyle(
                      fontSize: 30, fontWeight: FontWeight.bold),
                  colors: const [
                    Color(0xff8436ea),
                    Color(0xff993091),
                    Color(0xffe52b54),
                  ]),
              Text(
                "Sign in to continue",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey[400]),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                child: TextFormField(
                    controller: emailController,
                    style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 22),
                    decoration: InputDecoration(
                        hintText: "xyz@gmail.com",
                        hintStyle: const TextStyle(
                          color: Colors.white30,
                        ),
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        enabledBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white38)),
                        focusedBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white)),
                        prefixIcon: const Icon(
                          CupertinoIcons.at,
                          size: 30,
                          color: Colors.white,
                        ),
                        prefixIconColor: Theme.of(context).primaryColor,
                        labelText: "EMAIL",
                        labelStyle: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w800,
                            color: Colors.white))),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                child: TextFormField(
                    controller: passwordController,
                    obscureText: true,
                    style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 22),
                    decoration: const InputDecoration(
                        hintText: "***********",
                        hintStyle: TextStyle(
                          color: Colors.white30,
                        ),
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white38)),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white)),
                        prefixIcon: Icon(
                          Icons.lock,
                          size: 30,
                          color: Colors.white,
                        ),
                        labelText: "PASSWORD",
                        labelStyle: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w800,
                          color: Colors.white,
                        ))),
              ),
              const SizedBox(
                height: 20,
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
                      onPressed: signIn,
                      child: Row(
                        children: const [
                          Expanded(
                            child: Center(
                              child: Text(
                                "Sign in",
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
                  TextButton(
                      onPressed: () => Navigator.of(context).push(
                          MaterialPageRoute(
                              builder: (context) => const ForgotPassword())),
                      child: const Text(
                        "Forgot Password?",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ))
                ],
              ),
              const SizedBox(
                height: 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                      onTap: signInWithFacebook,
                      child: const CustomIcon(icon: FontAwesome.facebook)),
                  GestureDetector(
                    onTap: signInWithGoogle,
                    child: const CustomIcon(icon: FontAwesome.google),
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () => Navigator.of(context).push(MaterialPageRoute(
                    builder: ((context) => const SignUpScreen()))),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      "Don't have an account? ",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      "Sign up now",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future signIn() async {
    try {
      showDialog(
          context: context,
          // barrierDismissible: false,
          useRootNavigator: true,
          builder: ((context) => const Center(
                child: CircularProgressIndicator(),
              )));
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passwordController.text.trim());
    } on FirebaseAuthException catch (e) {
      Utils.showSnackBar(e.message);
    }

    // Navigator.of(context).popUntil((route) => route.isFirst);
    Navigator.pop(context);
  }

  Future signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  Future signInWithFacebook() async {
    // Trigger the sign-in flow
    try {
      final LoginResult loginResult = await FacebookAuth.instance.login();
      // Create a credential from the access token
      final OAuthCredential facebookAuthCredential =
          FacebookAuthProvider.credential(loginResult.accessToken!.token);
      FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
    } on FirebaseAuthException catch (e) {
      Utils.showSnackBar(e.message);
    }

    // Once signed in, return the UserCredential
  }
}
