import 'package:app/custom.dart';
import 'package:app/Screens/signup_screen.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key, Key? k});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final double verticalSpacing = 0.025;

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: const Color(0xff9a63d7),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          //Top Section
          Expanded(
            child: Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Color(0xff9a63d7),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('assets/images/Background.png'),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Hello Again!',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: screenHeight * 0.047,
                    ),
                  ),
                  SizedBox(
                    height: screenHeight * 0.02,
                  ),
                  Text(
                    'Welcome Back, We’ve been\n waiting for you.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      color: Colors.white,
                      fontSize: screenHeight * 0.02,
                    ),
                  ),
                ],
              ),
            ),
          ),
          //Down Section
          Expanded(
            flex: 0,
            child: Form(
              key: _formKey,
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 25, vertical: 30),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(30),
                    topLeft: Radius.circular(30),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      'Login',
                      style: TextStyle(
                        fontFamily: 'Lato',
                        color: const Color(0xff9a63d7),
                        fontSize: screenHeight * 0.028,
                      ),
                    ),
                    SizedBox(
                      height: screenHeight * verticalSpacing,
                    ),
                    CustomTextField(
                      controller: emailController,
                      labelText: 'Email',
                      labelValidator: 'Enter Email',
                      obscureText: false,
                    ),
                    SizedBox(
                      height: screenHeight * 0.005,
                    ),
                    CustomTextField(
                      controller: passwordController,
                      labelText: 'Password',
                      labelValidator: 'Enter Password',
                      obscureText: true,
                    ),
                    SizedBox(
                      height: screenHeight * 0.015,
                    ),
                    Text(
                      "Forgot Password?",
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        fontFamily: 'Lato',
                        fontSize: screenHeight * 0.018,
                        fontWeight: FontWeight.w500,
                        color: const Color(0xff9a63d7),
                      ),
                    ),
                    SizedBox(
                      height: screenHeight * 0.025,
                    ),
                    ReusableElevatedButton(
                      buttonText: 'Login',
                      onPressed: () {
                        _formKey.currentState!.validate();
                      },
                    ),
                    SizedBox(
                      height: screenHeight * 0.025,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Don’t have an account?",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: 'Lato',
                            fontSize: screenHeight * 0.018,
                            fontWeight: FontWeight.w300,
                            color: Colors.grey,
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const SignUpScreen(),
                              ),
                            );
                          },
                          child: Text(
                            " Sign Up",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: screenHeight * 0.018,
                              fontWeight: FontWeight.w300,
                              color: const Color(0xff9a63d7),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
