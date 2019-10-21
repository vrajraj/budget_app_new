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
      appBar: new AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        actions: <Widget>[Icon(Icons.search,color: Colors.black,size:35,)],
        title: Text("Budget",style: TextStyle(color: Colors.black,fontSize: 20),),
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            Container(
              height: 150,
              decoration: BoxDecoration(image: DecorationImage(
                  image: NetworkImage('data:image/jpeg;base64,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')
                  ,fit: BoxFit.cover ,)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  CircleAvatar(
                    backgroundImage:AssetImage('images/chidambaram.jpg') ,
                    radius: 50,

                  ),
                  Padding(padding: EdgeInsets.only(top:10,bottom: 10),child: Text('p.Chidambaram',style: TextStyle(color: Colors.black,fontSize: 25),),)
                ],

              ),
            )
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[


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

