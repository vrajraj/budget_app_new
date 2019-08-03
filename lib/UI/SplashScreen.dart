import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:math';
import 'SectorIcon.dart';

//import 'customicon.dart';
import 'data.dart';

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
    Timer(Duration(seconds: 10), () => print("Splash Done"));
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
class StartIntoApp extends StatefulWidget {
  @override
  _StartIntoAppState createState() => _StartIntoAppState();
}

var cardAspectRatio = 12.0 / 16.0;
var widgetAspectRatio = cardAspectRatio * 1.2;

class _StartIntoAppState extends State<StartIntoApp> {
  var currentPage = images.length - 1.0;
  var currentSector = images.length - 1.0;

  @override
  Widget build(BuildContext context) {

    PageController controller = PageController(initialPage: images.length - 1);
    controller.addListener(() {
      setState(() {
        currentPage = controller.page;
      });
    });

    PageController controller1 = PageController(initialPage: images.length - 1);
    controller1.addListener(() {
      setState(() {
        currentSector = controller1.page;
      });
    });

    return new Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(
                  left: 12.0, right: 12.0, top: 30.0, bottom: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  IconButton(
                    icon: Icon(
                      Icons.drag_handle,
                      color: Colors.black,
                      size: 30.0,
                    ),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.search,
                      color: Colors.black,
                      size: 30.0,
                    ),
                    onPressed: () {},
                  ),
                ],
              ),
            ),

            // ======================== M I N I S T R I E S ====================== //
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "Our Ministries.",
                    style: new TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30.0,
                      color: Colors.black,
                      fontFamily: "Calibre-Semibold",
                      //letterSpacing: 1.0,
                    ),
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.filter_list,
                      size: 12.0,
                      color: Colors.black,
                    ),
                    onPressed: () {},
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.orange.shade500,
                      borderRadius: BorderRadius.circular(20.20),
                    ),
                    child: Center(
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 22.0, vertical: 10.0),
                        child: Text(
                          "Photos",
                          style: new TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 15.0,
                  ),
                  Text(
                    "25 + Ministries ",
                    style: new TextStyle(
                      color: Colors.blueAccent,
                    ),
                  )
                ],
              ),
            ),
            Stack(
              children: <Widget>[
                CardScrollWidget(currentPage),
                Positioned.fill(
                  child: PageView.builder(
                    itemCount: images.length,
                    controller: controller,
                    reverse: true,
                    itemBuilder: (context, index) {
                      return Container();
                    },
                  ),
                )
              ],
            ),

            // ========================== S E C T O R S  =========================//

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "Sectors",
                    style: new TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30.0,
                      color: Colors.black,
                      fontFamily: "Calibre-Semibold",
                      //letterSpacing: 1.0,
                    ),
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.filter_list,
                      size: 12.0,
                      color: Colors.black,
                    ),
                    onPressed: () {},
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.orange.shade500,
                      borderRadius: BorderRadius.circular(20.20),
                    ),
                    child: Center(
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 22.0, vertical: 10.0),
                        child: Text(
                          "Trending",
                          style: new TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 15.0,
                  ),
                  Text(
                    "20 + Sectors",
                    style: new TextStyle(
                      color: Colors.blueAccent,
                    ),
                  )
                ],
              ),
            ),

            Stack(
              children: <Widget>[
                CardScrollWidget1(currentSector),
                Positioned.fill(
                  child: PageView.builder(
                    itemCount: images.length,
                    controller: controller1,
                    reverse: true,
                    itemBuilder: (context, index) {
                      return Container();
                    },
                  ),
                )
              ],
            ),

            // ************ ADD NEW STACK LIST HERE after padding **********//
          ],
        ),
      ),
    );
  }
}

// This Card scroll for Ministries //
class CardScrollWidget extends StatelessWidget {
  var currentPage;
  var padding = 20.0;
  var verticalInset = 20.0;

  CardScrollWidget(this.currentPage);

  @override
  Widget build(BuildContext context) {
    return new AspectRatio(
      aspectRatio: widgetAspectRatio,
      child: LayoutBuilder(
        builder: (context, constrain) {
          var width = constrain.maxWidth;
          var height = constrain.maxHeight;

          var safeWidth = width - 2 * padding;
          var safeHeight = height - 2 * padding;

          var heightOfPrimaryCard = safeHeight;
          var widthOfPrimaryCard = heightOfPrimaryCard * cardAspectRatio;

          var primaryCardLeft = safeWidth - widthOfPrimaryCard;
          var horizontalInset = primaryCardLeft / 2;

          List<Widget> cardList = new List();

          for (var i = 0; i < images.length; i++) {
            var delta = i - currentPage;
            bool isOnRight = delta > 0;
            var start = padding +
                max(
                    primaryCardLeft -
                        horizontalInset * (-delta) * (isOnRight ? 15 : 1),
                    0.0);

            var cardItem = Positioned.directional(
              top: padding + verticalInset * max(-delta, 0.0),
              bottom: padding + verticalInset * max(-delta, 0.0),
              start: start,
              textDirection: TextDirection.rtl,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black,
                        offset: Offset(3.0, 6.0),
                        blurRadius: 20.0,
                      )
                    ],
                  ),
                  child: AspectRatio(
                    aspectRatio: cardAspectRatio,
                    child: Stack(
                      fit: StackFit.expand,
                      children: <Widget>[
                        Image.asset(
                          images[i],
                          fit: BoxFit.cover,
                        ),
                        Align(
                          alignment: Alignment.bottomLeft,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 16.0, vertical: 8.0),
                                child: Text(
                                  titles[i],
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 25.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              SizedBox(height: 10.0),
                              Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 22.0, vertical: 6.0),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            );
            cardList.add(cardItem);
          }
          return Stack(
            children: cardList,
          );
        },
      ),
    );
  }
}

// This Card scroll for Sectors //
class CardScrollWidget1 extends StatelessWidget {
  var currentSector;
  var padding = 20.0;
  var verticalInset = 20.0;

  CardScrollWidget1(this.currentSector);

  @override
  Widget build(BuildContext context) {
    return new AspectRatio(
      aspectRatio: widgetAspectRatio,
      child: LayoutBuilder(
        builder: (context, constrain) {
          var width = constrain.maxWidth;
          var height = constrain.maxHeight;

          var safeWidth = width - 2 * padding;
          var safeHeight = height - 2 * padding;

          var heightOfPrimaryCard = safeHeight;
          var widthOfPrimaryCard = heightOfPrimaryCard * cardAspectRatio;

          var primaryCardLeft = safeWidth - widthOfPrimaryCard;
          var horizontalInset = primaryCardLeft / 2;

          List<Widget> cardList = new List();

          for (var i = 0; i < images.length; i++) {
            var delta = i - currentSector;
            bool isOnRight = delta > 0;
            var start = padding +
                max(
                    primaryCardLeft -
                        horizontalInset * (-delta) * (isOnRight ? 15 : 1),
                    0.0);

            var cardItem = Positioned.directional(
              top: padding + verticalInset * max(-delta, 0.0),
              bottom: padding + verticalInset * max(-delta, 0.0),
              start: start,
              textDirection: TextDirection.rtl,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black,
                        offset: Offset(3.0, 6.0),
                        blurRadius: 20.0,
                      )
                    ],
                  ),
                  child: AspectRatio(
                    aspectRatio: cardAspectRatio,
                    child: Stack(
                      fit: StackFit.expand,
                      children: <Widget>[
                        Image.asset(
                          imagesS[i],
                          fit: BoxFit.cover,
                        ),
                        Align(
                          alignment: Alignment.bottomLeft,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 16.0, vertical: 8.0),
                                child: Text(
                                  titlesS[i],
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 25.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              SizedBox(height: 10.0),
                              Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 22.0, vertical: 6.0),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            );
            cardList.add(cardItem);
          }
          return Stack(
            children: cardList,
          );
        },
      ),
    );
  }
}

