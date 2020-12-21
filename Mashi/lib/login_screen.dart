import 'package:Mashi/signup_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

import 'main.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
  final _formkey = GlobalKey<FormState>();

  bool _ishidden = true;
  TextEditingController namectrl, emailctrl, passctrl;
  bool processing = false;
  final icon = {"color": false};

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    namectrl = new TextEditingController();
    emailctrl = new TextEditingController();
    passctrl = new TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/bgf.jpg"), fit: BoxFit.cover)),
        child: Form(
            key: _formkey,
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Image.asset("assets/images/logocircle.png",
                        color: Colors.transparent,
                        colorBlendMode: BlendMode.darken,
                        height: 150,
                        width: 150),
                    SizedBox(height: size.height * 0.03),
                    TextFieldContainer(
                      child: TextFormField(
                        controller: emailctrl,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                            labelText: "Email",
                            icon: Icon(
                              Icons.person,
                              color: Colors.black,
                            ),
                            hintText: "Email",
                            border: InputBorder.none),
                        validator: (value) {
                          if (value.isEmpty ||
                              !value.contains("@gmail") ||
                              !value.contains(".com")) {
                            return "Email is invalid";
                          }
                          return null;
                        },
                      ),
                    ),
                    TextFieldContainer(
                      child: TextFormField(
                        controller: passctrl,
                        decoration: InputDecoration(
                            labelText: "Password",
                            icon: Icon(
                              Icons.lock,
                              color: Colors.black,
                            ),
                            suffixIcon: IconButton(
                              onPressed: () {
                                _ishidden = !_ishidden;
                                (context as Element).markNeedsBuild();
                                {
                                  icon["color"] = !icon["color"];
                                  (context as Element).markNeedsBuild();
                                }
                              },
                              icon: Icon(
                                Icons.visibility_off,
                                color: icon["color"]
                                    ? Colors.white
                                    : Colors.black12,
                              ),
                            ),
                            hintText: "Password",
                            border: InputBorder.none),
                        obscureText: _ishidden ? true : false,
                        validator: (value) {
                          if (value.isEmpty || value.length < 8) {
                            return "Password is short";
                          }
                          return null;
                        },
                      ),
                    ),
                    Container(
                        padding: EdgeInsets.only(bottom: 0),
                        width: size.width * 0.6,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(29),
                          child: FlatButton(
                              shape: CircleBorder(),
                              padding: EdgeInsets.all(40.0),
                              onPressed: () =>
                                  SignInUser(emailctrl.text, passctrl.text),
                              child: processing == false
                                  ? Text(
                                      "LOGIN",
                                      style: TextStyle(color: Colors.white),
                                    )
                                  : CircularProgressIndicator(
                                      backgroundColor: Colors.red)),
                        )),
                    SizedBox(height: size.height * 0.03),
                    AlreadyHaveAnAccount(
                      press: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return SignupScreen();
                            },
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            )));
  }

  void SignInUser(String email, String pass) async {
    setState(() {
      processing = true;
    });

    if (_formkey.currentState.validate()) {
      var url = "https://printless-indicate.000webhostapp.com/signin.php";
      var data = {"email": email, "pass": pass};
      var res = await http.post(url, body: data);

      if (res.body.contains("dont have an account")) {
        Fluttertoast.showToast(
            msg: "Dont have an account, Please create",
            toastLength: Toast.LENGTH_SHORT);
      } else {
        if (res.body.contains("false")) {
          Fluttertoast.showToast(
              msg: "Incorrect Password", toastLength: Toast.LENGTH_SHORT);
        } else {
          print(res.body);

          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return MyHomePage();
              },
            ),
          );
        }
      }
    } else {
      Fluttertoast.showToast(
          msg: "Enter a valid account", toastLength: Toast.LENGTH_SHORT);
    }

    setState(() {
      processing = false;
    });
  }
}

class AlreadyHaveAnAccount extends StatefulWidget {
  final bool login;
  final Function press;

  const AlreadyHaveAnAccount({
    Key key,
    this.login = true,
    this.press,
  }) : super(key: key);

  @override
  _AlreadyHaveAnAccountState createState() => _AlreadyHaveAnAccountState();
}

class _AlreadyHaveAnAccountState extends State<AlreadyHaveAnAccount> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          widget.login
              ? "Don't have an account ? "
              : "Already have an account ? ",
          style: TextStyle(color: Colors.white),
        ),
        GestureDetector(
            onTap: widget.press,
            child: Text(
              widget.login ? "Sign Up" : "Sign In",
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            )),
      ],
    );
  }
}

class TextFieldContainer extends StatefulWidget {
  final Widget child;

  const TextFieldContainer({
    Key key,
    this.child,
  }) : super(key: key);

  @override
  _TextFieldContainerState createState() => _TextFieldContainerState();
}

class _TextFieldContainerState extends State<TextFieldContainer> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 0.1),
      width: size.width * 0.85,
      decoration: BoxDecoration(
          color: Colors.white70, borderRadius: BorderRadius.circular(29)),
      child: widget.child,
    );
  }
}
