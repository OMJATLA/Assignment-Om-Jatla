import 'package:app/custom.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key, Key? k});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController usernameController = TextEditingController();
  TextEditingController mobileNoController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

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
            flex: 0,
            child: Container(
              height: screenHeight * 0.37,
              width: double.infinity,
              decoration: const BoxDecoration(
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
                  SizedBox(height: screenHeight * 0.02),
                  Text(
                    'Welcome Back, We’ve been\n Let’s begin your journey with us.',
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
            flex: 1,
            child: Form(
              key: _formKey,
              child: SingleChildScrollView(
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 25, vertical: 40),
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
                        'Create your account',
                        style: TextStyle(
                          fontFamily: 'Lato',
                          color: const Color(0xff9a63d7),
                          fontWeight: FontWeight.w500,
                          fontSize: screenHeight * 0.028,
                        ),
                      ),
                      SizedBox(height: screenHeight * verticalSpacing),
                      CustomTextField(
                        labelText: 'Username',
                        labelValidator: 'Enter Username',
                        controller: usernameController,
                      ),
                      SizedBox(height: screenHeight * verticalSpacing),
                      CustomTextField(
                        controller: mobileNoController,
                        labelText: 'Mobile no',
                        labelValidator: 'Enter Mobile no',
                      ),
                      SizedBox(height: screenHeight * verticalSpacing),
                      CustomTextField(
                        controller: emailController,
                        labelText: 'Email',
                        labelValidator: 'Enter Email',
                      ),
                      SizedBox(height: screenHeight * verticalSpacing),
                      CustomTextField(
                        controller: passwordController,
                        labelText: 'Password',
                        labelValidator: 'Enter Password',
                        obscureText: true,
                      ),
                      SizedBox(height: screenHeight * 0.025),
                      ReusableElevatedButton(
                          buttonText: 'Sign Up',
                          onPressed: () {
                            _formKey.currentState!.validate();
                          }),
                      SizedBox(height: screenHeight * 0.025),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Already have an account?",
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
                              Navigator.pop(context);
                            },
                            child: Text(
                              " Login",
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
            ),
          )
        ],
      ),
    );
  }
}
