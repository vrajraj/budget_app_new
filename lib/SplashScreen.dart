import 'package:flutter/material.dart';
import 'package:budget_app/home page.dart';
import 'dart:async';
import 'dart:math';
import 'UI/SectorIcon.dart';

//import 'customicon.dart';
import 'UI/data.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

//------------------------------------------------------------------------------------------------------ //
// ->->->->->->->->->->->->->->->->->-> FIRST PAGE OF APPLICATION  ->->->->->->->->->->->->->->->->->->  //
// ----------------------------------------------------------------------------------------------------- //
class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds:5), () => Navigator.push(context,new MaterialPageRoute(builder: (context) => StartIntoApp())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          new Container(
            decoration: BoxDecoration(color: Colors.orange.shade500),
          ),
          new Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Expanded(
                flex: 4,
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 150.0,
                        child: Icon(
                          Icons.account_balance,
                          color: Colors.black,
                          size: 150.0,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 10.0),
                      ),
                      Text(
                        "The Budget",
                        style: new TextStyle(
                          fontSize: 35.0,
                          fontWeight: FontWeight.w900,
                          fontStyle: FontStyle.normal,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // FOR QUOTES //

              Expanded(
                flex: 2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    CircularProgressIndicator(
                      backgroundColor: Colors.white,
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 20.0),
                    ),
                    Text(
                      " \n 'Economy is idealism, \n in its most practical form.'",
                      style: new TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.w800,
                        fontStyle: FontStyle.normal,
                        color: Colors.white,
                      ),
                    ),

                    // START BUTTON //
                    Padding(
                      padding: EdgeInsets.only(top: 30.0),
                    ),

                    new FlatButton(
                      child: Text("Start"),
                      color: Colors.white,
                      onPressed: () {
                        Navigator.pushNamed(context, '/Start');
                      },
                      shape: new RoundedRectangleBorder(
                        borderRadius:
                            new BorderRadiusDirectional.circular(20.0),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

//------------------------------------------------------------------------------------------------------ //
// ->->->->->->->->->->->->->->->->->-> SECOND PAGE OF APPLICATION  ->->->->->->->->->->->->->->->->->->  //
// ----------------------------------------------------------------------------------------------------- //

