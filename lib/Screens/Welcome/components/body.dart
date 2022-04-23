import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/DashBoard/dashboard.dart';
import 'package:flutter_auth/Screens/Login/login_screen.dart';
import 'package:flutter_auth/Screens/AlarmScreen/alarm_screen.dart';
import 'package:flutter_auth/Screens/Signup/signup_screen.dart';
import 'package:flutter_auth/Screens/Welcome/components/background.dart';
import 'package:flutter_auth/components/rounded_button.dart';
import 'package:flutter_auth/constants.dart';
// import 'package:flutter_svg/svg.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    // This size provide us total height and width of our screen
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: size.height * 0.05),
            Image.asset(
              "assets/images/logo_white.png",
              height: size.height * 0.45,
            ),
            SizedBox(height: size.height * 0.05),
            Text(
              "WELCOME!",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                  color: txtColorLight),
            ),
            SizedBox(height: size.height * 0.02),
            Text(
              "Passing on your Last Words \nto your love ones upon your demise!",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 15, color: txtColorLight),
            ),
            SizedBox(height: size.height * 0.05),
            RoundedButton(
              color: kPrimaryLightColor,
              text: "Get Started",
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return LoginScreen();
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
