import 'package:Mashi/login_screen.dart';
import 'package:Mashi/signup_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:url_launcher/url_launcher.dart';

import 'main.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
    );
  }
}

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  Future<void> _launched;

  String phoneNumber = "";

  String _launchUrl = "https://www.instagram.com/mashi_interiors/";

  Future<void> _LaunchInBrowser(String url) async {
    if (await canLaunch(url)) {
      await launch(
        url,
        forceSafariVC: false,
        forceWebView: false,
        headers: <String, String>{"header_key": "header_value"},
      );
    } else {
      throw "Could not launch $url";
    }
  }

  Future<void> _whatsapp;

  String phoneNum = "";

  String _whatsappurl = "https://chat.whatsapp.com/F8qLfy96mOlHzHZJwjoOvA";

  Future<void> _whatsappinbrowser(String url) async {
    if (await canLaunch(url)) {
      await launch(
        url,
        forceSafariVC: false,
        forceWebView: false,
        headers: <String, String>{"header_key": "header_value"},
      );
    } else {
      throw "Could not launch $url";
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
        padding: EdgeInsets.only(top: 40),
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/bgf.jpg"), fit: BoxFit.cover)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset("assets/images/logocircle.png",
                color: Colors.transparent,
                colorBlendMode: BlendMode.darken,
                height: 150,
                width: 150),
            Container(
                padding: EdgeInsets.only(bottom: 0),
                width: size.width * 0.6,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(29),
                  child: FlatButton(
                      shape: CircleBorder(),
                      padding: EdgeInsets.all(40.0),
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
                      child: Text(
                        "Login",
                        style: TextStyle(color: Colors.white),
                      )),
                )),
            Container(
              padding: EdgeInsets.only(bottom: 50),
              width: size.width * 0.6,
              child: FlatButton(
                  shape: CircleBorder(),
                  padding: EdgeInsets.all(40.0),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return SignupScreen();
                        },
                      ),
                    );
                  },
                  child: Text(
                    "SignUp",
                    style: TextStyle(color: Colors.white),
                  )),
            ),
            Container(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 30),
                child: Text(
                  "Contact Through :-",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 17),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SocialIcon(
                  iconSrc: "assets/images/whatsapp.png",
                  border: Border.all(width: 2, color: Colors.white),
                  press: () {
                    _whatsappinbrowser(_whatsappurl);
                  },
                ),
                SocialIcon(
                  iconSrc: "assets/images/instagram.png",
                  border: Border.all(width: 2, color: Colors.white),
                  press: () {
                    _LaunchInBrowser(_launchUrl);
                  },
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 40),
              child: FlatButton(
                  shape: CircleBorder(),
                  padding: EdgeInsets.all(40.0),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return MyHomePage();
                        },
                      ),
                    );
                  },
                  child: Text(
                    "Skip",
                    style: TextStyle(color: Colors.white),
                  )),
            ),
          ],
        ));
  }
}
