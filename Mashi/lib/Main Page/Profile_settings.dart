import 'package:Mashi/front_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../main.dart';

class Profile_Settings extends StatelessWidget {
  const Profile_Settings({
    Key key,
    @required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return new Container(
      color: Colors.black,
      child: Column(children: <Widget>[
        Container(
          margin: EdgeInsets.symmetric(vertical: 1, horizontal: 4),
          padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
          decoration: BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          child: Row(children: <Widget>[
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              padding: EdgeInsets.all(0),
              child: Image.asset("assets/images/logocircle.png",
                  color: Colors.grey,
                  colorBlendMode: BlendMode.darken,
                  height: 90,
                  width: 90),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 18, bottom: 70),
              child: Container(
                child: Text(
                  "Mashi Interiors",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 22),
                ),
              ),
            ),
          ]),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 4),
          child: SizedBox(
            width: 403,
            child: FlatButton.icon(
              icon: Icon(Icons.person),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              padding: EdgeInsets.only(right: 195, left: 10),
              color: Colors.grey,
              height: 70,
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
              label: Text(
                "Profile Details",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18),
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 1, horizontal: 4),
          child: SizedBox(
            width: 403,
            child: FlatButton.icon(
              icon: Icon(Icons.vpn_key),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              padding: EdgeInsets.only(right: 200, left: 10),
              color: Colors.grey,
              height: 70,
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
              label: Text(
                "Login/Signup",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18),
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 4),
          child: SizedBox(
            width: 403,
            child: FlatButton.icon(
              icon: Icon(Icons.info_sharp),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              padding: EdgeInsets.only(right: 239, left: 10),
              color: Colors.grey,
              height: 70,
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
              label: Text(
                "About Us",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18),
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 1, horizontal: 4),
          child: SizedBox(
            width: 403,
            child: FlatButton.icon(
              icon: Icon(Icons.contact_page),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              padding: EdgeInsets.only(right: 223, left: 10),
              color: Colors.grey,
              height: 70,
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
              label: Text(
                "Contact Us",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18),
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 4),
          child: SizedBox(
            width: 403,
            child: FlatButton.icon(
              icon: Icon(Icons.my_library_books_rounded),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              padding: EdgeInsets.only(right: 161, left: 10),
              color: Colors.grey,
              height: 70,
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
              label: Text(
                "Company Policies",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18),
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 1, horizontal: 4),
          child: SizedBox(
            width: 403,
            child: FlatButton.icon(
              icon: Icon(Icons.policy),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              padding: EdgeInsets.only(right: 195, left: 10),
              color: Colors.grey,
              height: 70,
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
              label: Text(
                "Privacy Policy",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18),
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 4),
          child: SizedBox(
            width: 403,
            child: FlatButton.icon(
              icon: Icon(Icons.exit_to_app),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              padding: EdgeInsets.only(right: 244, left: 10),
              color: Colors.grey,
              height: 70,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return WelcomeScreen();
                    },
                  ),
                );
              },
              label: Text(
                "Sign Out",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18),
              ),
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(vertical: size.height * 0.01),
          width: size.width * 0.9,
          child: Row(children: <Widget>[
            Expanded(
              child: Divider(
                color: Colors.white,
                height: 1.5,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                "VERSION 0.0.0",
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
              ),
            ),
            Expanded(
              child: Divider(
                color: Colors.white,
                height: 1.5,
              ),
            ),
          ]),
        ),
      ]),
    );
  }
}
