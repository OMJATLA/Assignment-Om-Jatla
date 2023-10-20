import 'package:app/Controllers/login_sign_up_controller.dart';
import 'package:flutter/material.dart';

class ReusableElevatedButton extends StatelessWidget {
  const ReusableElevatedButton({
    Key? key,
    required this.buttonText,
    required this.onPressed,
    this.loader = false,
  }) : super(key: key);

  final String buttonText;
  final Function()? onPressed;
  final bool loader;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.060,
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
          shadowColor: Colors.transparent,
          backgroundColor: const Color(0xff9a63d7),
        ),
        onPressed: onPressed,
        child: loader
            ? const CircularProgressIndicator(
                color: Colors.white,
              )
            : Text(
                buttonText,
                style: const TextStyle(
                  fontFamily: 'Lato',
                ),
              ),
      ),
    );
  }
}

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final String labelValidator;
  final bool obscureText;
  LogInSignUpController? logInSignUpController;

  CustomTextField(
      {Key? key,
      required this.controller,
      required this.labelText,
      required this.labelValidator,
      this.obscureText = false,
      this.logInSignUpController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: SizedBox(
        width: double.infinity,
        child: TextFormField(
          style: const TextStyle(
            fontFamily: 'Lato',
          ),
          textAlign: TextAlign.left,
          controller: controller,
          obscureText: obscureText,
          cursorColor: Color.fromRGBO(201, 163, 245, 1),
          decoration: InputDecoration(
            isDense: true,
            filled: true,
            fillColor: const Color(0xfff8f4fd),
            isCollapsed: true,
            suffixIcon: labelText == 'Password'
                ? InkWell(
                    onTap: () {
                      if (logInSignUpController!.obscureText.value) {
                        logInSignUpController!.obscureText.value = false;
                      } else {
                        logInSignUpController!.obscureText.value = true;
                      }
                    },
                    child: Icon(
                        logInSignUpController!.obscureText.value
                            ? Icons.visibility_off
                            : Icons.visibility,
                        color: Color(0xff9a63d7)),
                  )
                : const SizedBox(),
            hintText: labelText,
            hintStyle: const TextStyle(
              fontFamily: 'Lato',
            ),
            contentPadding: const EdgeInsets.symmetric(
              vertical: 15.0,
              horizontal: 20.0,
            ),
            border: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.transparent, width: 2.0),
              borderRadius: BorderRadius.all(Radius.circular(20.0)),
            ),
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                  color: Color.fromRGBO(201, 163, 245, 1), width: 2.0),
              borderRadius: BorderRadius.all(Radius.circular(20.0)),
            ),
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.transparent, width: 2.0),
              borderRadius: BorderRadius.all(Radius.circular(20.0)),
            ),
          ),
          validator: (value) {
            if (value!.isEmpty) {
              return labelValidator;
            }
            return null;
          },
        ),
      ),
    );
  }
}
