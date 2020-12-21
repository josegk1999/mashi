import 'package:Mashi/credentials.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';

import 'login_screen.dart';

class SignupScreen extends StatefulWidget {
  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
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
  bool processing = false;
  bool verifyButton = false;
  String verifyLink;
  bool _ishidden = true;
  TextEditingController emailctrl, passctrl;
  final icon = {"color": false};

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    emailctrl = new TextEditingController();
    passctrl = new TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery
        .of(context)
        .size;
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
                    Container(
                      padding: EdgeInsets.all(0),
                      decoration: BoxDecoration(
                        border: Border.all(width: 2, color: Colors.white),
                        shape: BoxShape.circle,
                      ),
                      child: Image.asset("assets/images/logocircle.png",
                          color: Colors.transparent,
                          colorBlendMode: BlendMode.darken,
                          height: 150,
                          width: 150),
                    ),
                    SizedBox(height: size.height * 0.06),
                    TextFieldContainer(
                      child: TextFormField(
                        controller: emailctrl,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                            labelText: 'Email',
                            icon: Icon(
                              Icons.person,
                              color: Colors.black,
                            ),
                            hintText: 'Email',
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
                            labelText: 'Password',
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
                            hintText: 'Password',
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
                              padding: EdgeInsets.only(top: 40.0, bottom: 20),
                              onPressed: () =>
                                  RegisterUser(emailctrl.text, passctrl.text),
                              child: processing == false
                                  ? Text(
                                "Sign Up",
                                style: TextStyle(color: Colors.white),
                              )
                                  : CircularProgressIndicator(
                                  backgroundColor: Colors.red)),
                        )),
                    verifyButton
                        ? MaterialButton(
                        padding: EdgeInsets.all(10.0),
                        color: Colors.green,
                        child: Text(
                          "Verify",
                          style: TextStyle(color: Colors.white),
                        ),
                        onPressed: () {
                          verify();
                        })
                        : Container(),
                    SizedBox(height: size.height * 0.03),
                    AlreadyHaveAnAccount(
                      login: false,
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
            )));
  }

  void RegisterUser(String email, String pass) async {
    setState(() {
      processing = true;
    });

    if (_formkey.currentState.validate()) {
      var url = "https://printless-indicate.000webhostapp.com/signup.php";
      var data = {"email": email, "pass": pass};
      var res = await http.post(url, body: data);

      if (res.body.contains("true")) {
        Fluttertoast.showToast(
            msg: "Account exists, Please login",
            toastLength: Toast.LENGTH_SHORT);
      } else {
        if (res.body.contains("error")) {
          Fluttertoast.showToast(msg: "Error", toastLength: Toast.LENGTH_SHORT);
        } else {
          var link = (res.body);
          setState(() {
            sendMail(emailctrl.text);
            verifyLink = link;
            verifyButton = true;
          });
          print(link);
        }
      }
      setState(() {
        processing = false;
      });
    } else {
      Fluttertoast.showToast(
          msg: "Enter a valid account", toastLength: Toast.LENGTH_SHORT);
    }
    setState(() {
      processing = false;
    });
  }

  Future verify() async {
    var res = await http.post(verifyLink);
    if (res.body.contains("verified")) {
      var link = (res.body);
      setState(() {
        verifyButton = false;
      });
      Fluttertoast.showToast(msg: "Verified", toastLength: Toast.LENGTH_SHORT);
      print(link);
    } else {
      Fluttertoast.showToast(
          msg: "not verified", toastLength: Toast.LENGTH_SHORT);
    }
  }

  sendMail(String email) async {
    String username = EMAIL;
    String password = PASS; //passsword

    // ignore: deprecated_member_use
    final smtpServer = gmail(username, password);
    // Creating the Gmail server

    // Create our email message.
    final message = Message()
      ..from = Address(username)
      ..recipients.add(email) //recipent email
    //..ccRecipients.addAll(['destCc1@example.com', 'destCc2@example.com']) //cc Recipents emails
    //..bccRecipients.add(Address('bccAddress@example.com')) //bcc Recipents emails
      ..subject =
          'SignUp verification link from Mashi Interiors : ${DateTime
          .now()}' //subject of the email
    //..text =
    //'This is the plain text.\nThis is line 2 of the text part.'
      ..html =
          "<h3>Thanks for registering with localhost. Please click this link to complete this registation</h3>\n<p> <a href='$verifyLink'>Click me to Verify</a></p>"; //body of the email

    try {
      final sendReport = await send(message, smtpServer);
      print('Message sent: ' +
          sendReport.toString()); //print if the email is sent
    } on MailerException catch (e) {
      print('Message not sent. \n' +
          e.toString()); //print if the email is not sent
      // e.toString() will show why the email is not sending
    }
  }
}

class SocialIcon extends StatefulWidget {
  final String iconSrc;
  final Function press;
  final BoxBorder border;

  const SocialIcon({
    Key key,
    this.iconSrc,
    this.press,
    this.border,
  }) : super(key: key);

  @override
  _SocialIconState createState() => _SocialIconState();
}

class _SocialIconState extends State<SocialIcon> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.press,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 20),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          border: widget.border,
          shape: BoxShape.circle,
        ),
        child: Image.asset(widget.iconSrc, height: 30, width: 30),
      ),
    );
  }
}
