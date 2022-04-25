import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/DashBoard/components/griddashboard.dart';
import 'package:flutter_auth/Screens/Login/login_screen.dart';
import 'package:flutter_auth/constants.dart';
// import 'package:flutter_svg/svg.dart';

class Body extends StatelessWidget {
  const Body({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: darkBackground,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SizedBox(height: 70),
          Padding(
            padding: EdgeInsets.only(left: 20, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Tony Stark",
                      style: TextStyle(color: txtColorLight, fontSize: 25),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: size.height * 0.01),
                    Text(
                      "Ironman",
                      style: TextStyle(color: txtColorLight, fontSize: 13),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
                IconButton(
                  alignment: Alignment.topCenter,
                  icon: Image.asset(
                    "assets/icons/logout.png",
                    width: size.width * 0.2,
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return LoginScreen();
                        },
                      ),
                    );
                  },
                )
              ],
            ),
          ),
          SizedBox(height: 80),
          GridDashBoard()
        ],
      ),
    );
  }
}
