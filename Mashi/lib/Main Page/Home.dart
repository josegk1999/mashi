import 'package:Mashi/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HeaderHome extends StatelessWidget {
  const HeaderHome({
    Key key,
    @required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return new Container(
      color: Colors.white,
      child: Stack(children: <Widget>[
        Container(
          padding: EdgeInsets.only(left: 20, right: 20, bottom: 36),
          height: size.height * 0.2 - 27,
          decoration: BoxDecoration(
            color: Colors.yellow,
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(36),
                bottomRight: Radius.circular(36)),
          ),
          child: Row(
            children: <Widget>[
              Text("Find Your Style",
                  style: Theme.of(context).textTheme.headline5.copyWith(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                      )),
              Spacer(),
              Image.asset(
                "assets/images/logocircle.png",
                width: 60,
                height: 80,
                fit: BoxFit.contain,
                color: Colors.yellow,
                colorBlendMode: BlendMode.darken,
                semanticLabel: "Logo",
              ),
            ],
          ),
        ),
        Positioned(
          top: 115,
          left: 0,
          right: 0,
          child: Container(
            alignment: Alignment.center,
            margin: EdgeInsets.symmetric(horizontal: 20.0),
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 0.1),
            height: 54,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 10),
                    blurRadius: 50,
                    color: kPrimaryColor.withOpacity(0.23),
                  )
                ]),
            child: TextField(
              decoration: InputDecoration(
                icon: Icon(Icons.search),
                hintText: "Search",
                hintStyle: TextStyle(color: Colors.black.withOpacity(0.5)),
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
              ),
            ),
          ),
        ),
        Positioned(
          top: 190,
          left: 150,
          right: 0,
          child: Container(
            height: 50,
            child: Stack(
              children: <Widget>[
                Text(
                  "Categories",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
        ),
        Positioned(
          top: 240,
          left: 10,
          right: 0,
          child: Row(
            children: [
              FlatButton(
                child: new Column(
                  children: <Widget>[
                    Image.asset(
                      "assets/images/sofa.png",
                      width: 60,
                      height: 50,
                      fit: BoxFit.contain,
                      color: Colors.white,
                      colorBlendMode: BlendMode.darken,
                      semanticLabel: "Logo",
                    ),
                    new Text(
                      "Sofas",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 15.0,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 0.5, right: 0.5, bottom: 36),
                height: 70,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(36),
                      bottomRight: Radius.circular(36)),
                ),
              ),
              FlatButton(
                child: new Column(
                  children: <Widget>[
                    Image.asset(
                      "assets/images/bed.png",
                      width: 60,
                      height: 50,
                      fit: BoxFit.contain,
                      color: Colors.white,
                      colorBlendMode: BlendMode.darken,
                      semanticLabel: "Logo",
                    ),
                    new Text(
                      "Beds",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 15.0,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 0.5, right: 0.5, bottom: 36),
                height: 70,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(36),
                      bottomRight: Radius.circular(36)),
                ),
              ),
              FlatButton(
                child: new Column(
                  children: <Widget>[
                    Image.asset(
                      "assets/images/dinnerset.png",
                      width: 60,
                      height: 50,
                      fit: BoxFit.contain,
                      color: Colors.white,
                      colorBlendMode: BlendMode.darken,
                      semanticLabel: "Logo",
                    ),
                    new Text(
                      "Dinner-Set",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 15.0,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 0.5, right: 0.5, bottom: 36),
                height: 70,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(36),
                      bottomRight: Radius.circular(36)),
                ),
              ),
              FlatButton(
                child: new Column(
                  children: <Widget>[
                    Image.asset(
                      "assets/images/kitchen.png",
                      width: 50,
                      height: 50,
                      fit: BoxFit.contain,
                      color: Colors.white,
                      colorBlendMode: BlendMode.darken,
                      semanticLabel: "Logo",
                    ),
                    new Text(
                      "Kitchen",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 15.0,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
        Positioned(
          top: 310,
          left: 18,
          right: 20,
          child: Container(
            height: 1,
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(36),
                  bottomRight: Radius.circular(36)),
            ),
          ),
        ),
        Positioned(
          top: 311,
          left: 10,
          right: 0,
          child: Row(
            children: [
              FlatButton(
                child: new Column(
                  children: <Widget>[
                    Image.asset(
                      "assets/images/sofa.png",
                      width: 60,
                      height: 50,
                      fit: BoxFit.contain,
                      color: Colors.white,
                      colorBlendMode: BlendMode.darken,
                      semanticLabel: "Logo",
                    ),
                    new Text(
                      "Sofas",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 15.0,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 0.5, right: 0.5, bottom: 36),
                height: 70,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(36),
                      bottomRight: Radius.circular(36)),
                ),
              ),
              FlatButton(
                child: new Column(
                  children: <Widget>[
                    Image.asset(
                      "assets/images/bed.png",
                      width: 60,
                      height: 50,
                      fit: BoxFit.contain,
                      color: Colors.white,
                      colorBlendMode: BlendMode.darken,
                      semanticLabel: "Logo",
                    ),
                    new Text(
                      "Beds",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 15.0,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 0.5, right: 0.5, bottom: 36),
                height: 70,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(36),
                      bottomRight: Radius.circular(36)),
                ),
              ),
              FlatButton(
                child: new Column(
                  children: <Widget>[
                    Image.asset(
                      "assets/images/dinnerset.png",
                      width: 60,
                      height: 50,
                      fit: BoxFit.contain,
                      color: Colors.white,
                      colorBlendMode: BlendMode.darken,
                      semanticLabel: "Logo",
                    ),
                    new Text(
                      "Dinner-Set",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 15.0,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 0.5, right: 0.5, bottom: 36),
                height: 70,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(36),
                      bottomRight: Radius.circular(36)),
                ),
              ),
              FlatButton(
                child: new Column(
                  children: <Widget>[
                    Image.asset(
                      "assets/images/kitchen.png",
                      width: 50,
                      height: 50,
                      fit: BoxFit.contain,
                      color: Colors.white,
                      colorBlendMode: BlendMode.darken,
                      semanticLabel: "Logo",
                    ),
                    new Text(
                      "Kitchen",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 15.0,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
