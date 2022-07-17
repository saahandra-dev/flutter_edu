import 'package:e_commerce/size_config.dart';
import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            Text(
              "Welcome Back",
              style: TextStyle(
                color: Colors.black,
                fontSize: getProportionateScreenWidth(28),
                fontWeight: FontWeight.bold
              ),
            ),
            Text(
              "Sign in with your email and password \nor continue with social media",
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    );
  }
}