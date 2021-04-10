import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/cupertino.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:fluttertoast/fluttertoast.dart';
import './phonelogs_screen.dart';
import 'package:package_info/package_info.dart';

void main() {
  // SystemChrome.setPreferredOrientations([
  //   DeviceOrientation.portraitUp,
  // ]);
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    systemNavigationBarColor: Colors.white, // navigation bar color
    statusBarColor: Colors.white, // status bar color,
    systemNavigationBarDividerColor: Colors.white,
    //navigation bar icon
  ));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'TexTex',
      themeMode: ThemeMode.system,
      theme: ThemeData(
          primaryColor: Colors.white,
          accentColor: Colors.white,
          canvasColor: Colors.white,
          backgroundColor: Colors.white,
          accentColorBrightness: Brightness.light,
          textTheme: GoogleFonts.archivoTextTheme(
            Theme.of(context).textTheme,
          ),
          brightness: Brightness.light),
      home: MyHomePage(title: 'TexTex'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  String phoneNumber = "";
  String textMessage = "";
  _showModelBottomSheet(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Container(
            height: MediaQuery.of(context).size.height - 50.0,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                //color: Colors.white,
                borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            )),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width,
                  color: Colors.transparent,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: (MediaQuery.of(context).size.width / 4),
                      height: 180,
                      child: Column(
                        children: [
                          Container(
                            child: CircleAvatar(
                              maxRadius: 30,
                              foregroundColor: Colors.green,
                              backgroundColor: Colors.white,
                              child: Transform.rotate(
                                  angle: 45 * 3.14 / 90,
                                  child: IconButton(
                                    icon: FaIcon(FontAwesomeIcons.yelp),
                                    color: Colors.green,
                                    iconSize: 40,
                                    onPressed: () {},
                                  )),
                            ),
                            decoration: new BoxDecoration(
                              shape: BoxShape.circle,
                              border: new Border.all(
                                color: Colors.green,
                                width: 1.0,
                              ),
                            ),
                          ),
                          Text(
                            "TexTex",
                            style: GoogleFonts.abel(
                              color: Colors.green,
                              fontSize: 32,
                            ),
                          ),
                          Text(
                            versionName,
                            style: GoogleFonts.abel(
                              color: Colors.green,
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: (MediaQuery.of(context).size.width / 16),
                      //color: Colors.white,
                      height: 180,
                    ),
                    Container(
                      width: (MediaQuery.of(context).size.width / 2),
                      height: 180,
                      child: Column(
                        children: [
                          Text(
                            "TexTex app allows you to open chat with anyone on WhatsApp/SMS without save his/her number on your phone, as we all know that we can't open chat with someone without save the number on your contact but with TexTex you can do it with easiest way just by writing the number of your friend or anyone you want and click open chat and a conversation with the number you wrote will appear and you can send message",
                            style: GoogleFonts.archivoNarrow(
                              color: Colors.green,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Card(
                    child: ListTile(
                  leading: Container(
                    child: CircleAvatar(
                        maxRadius: 30,
                        foregroundColor: Colors.green,
                        backgroundColor: Colors.white,
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(100.0),
                            child:
                                Image(image: AssetImage('assets/shyam.jpg')))),
                    decoration: new BoxDecoration(
                      shape: BoxShape.circle,
                      border: new Border.all(
                        color: Colors.green,
                        width: 1.0,
                      ),
                    ),
                  ),
                  title: Text(
                    "Shyamjith Cherukara",
                  ),
                  subtitle: Text(
                    "shyamjith.calicut@gmail.com",
                    style: TextStyle(
                      fontSize: 12,
                    ),
                  ),
                  isThreeLine: false,
                  trailing: Wrap(children: <Widget>[
                    IconButton(
                        icon: FaIcon(
                          FontAwesomeIcons.whatsapp,
                          size: 35,
                        ),
                        color: Colors.green,
                        onPressed: () async {
                          var whatsappUrl =
                              "whatsapp://send?phone=+919744473479";
                          await launch(whatsappUrl);
                        })
                  ]),
                )),
                Container(
                  width: (MediaQuery.of(context).size.width),
                  height: 90,
                  alignment: Alignment.center,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                            width: 130,
                            height: 42,
                            child: TextButton(
                              style: TextButton.styleFrom(
                                primary: Colors.blue,
                                shape: RoundedRectangleBorder(
                                  side: BorderSide(
                                    color: Colors.blue,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(4),
                                ),
                              ),
                              onPressed: () async {
                                var cofeeurl =
                                    "https://www.buymeacoffee.com/Shyamjit";
                                await launch(cofeeurl);
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  FaIcon(FontAwesomeIcons.coffee),
                                  Padding(
                                      padding:
                                          EdgeInsetsDirectional.only(start: 8)),
                                  Text(
                                    "Buy Me a Coffee",
                                    style: TextStyle(
                                      fontSize: 10,
                                    ),
                                  )
                                ],
                              ),
                            )),
                        Container(
                          width: 30,
                          height: 50,
                        ),
                        Container(
                            width: 130,
                            height: 50,
                            alignment: Alignment.center,
                            child: TextButton(
                              style: TextButton.styleFrom(
                                primary: Colors.green,
                                shape: RoundedRectangleBorder(
                                  side: BorderSide(
                                    color: Colors.green,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(4),
                                ),
                              ),
                              onPressed: () {},
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.share),
                                  Padding(
                                      padding: EdgeInsetsDirectional.only(
                                          start: 10)),
                                  Text("Share")
                                ],
                              ),
                            )),
                      ]),
                ),
              ],
            ),
          );
        });
  }

  AnimationController _animatedIconController;
  bool isMenuOpen = false;

  Offset _offset = Offset(0, 0);
  String versionName = "";
  String versionCode = "";

  @override
  void initState() {
    super.initState();
    getversionNumber();
    _animatedIconController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 750),
      reverseDuration: Duration(milliseconds: 750),
    );
  }

  getsize(int x) {
    return 18.0;
  }

  getversionNumber() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    versionName = "v" + packageInfo.version;
    versionCode = packageInfo.buildNumber;
  }

  @override
  Widget build(BuildContext context) {
    Size mediaQuery = MediaQuery.of(context).size;
    double sizebarSize = mediaQuery.width;
    double menuContainerHeight = mediaQuery.height / 1.5;
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            // backgroundColor: Colors.white,
            title: Text(
              "TexTex",
              style: GoogleFonts.abel(
                color: Colors.green,
                fontSize: 40,
              ),
            ),
            //foregroundColor: Colors.green,
            leading: IconButton(
              icon: AnimatedIcon(
                icon: AnimatedIcons.menu_close,
                progress: _animatedIconController,
                color: Colors.green,
              ),
              color: Colors.green,
              iconSize: 30,
              onPressed: () {
                setState(() {
                  isMenuOpen
                      ? _animatedIconController.reverse()
                      : _animatedIconController.forward();

                  isMenuOpen = !isMenuOpen;
                });
              },
            ),
          ),
          body: Container(
            //color: Colors.white,
            child: Stack(children: <Widget>[
              Container(
                child: Column(children: <Widget>[
                  Container(
                    width: (MediaQuery.of(context).size.width - 50),
                    height: 30,
                    //color: Colors.white,
                  ),
                  Container(
                    width: (MediaQuery.of(context).size.width - 50),
                    height: 50,
                    alignment: Alignment.center,
                    // color: Colors.white,
                    child: Row(children: <Widget>[
                      Flexible(
                        child: TextField(
                          keyboardType: TextInputType.phone,
                          onChanged: (String number) {
                            setState(() {
                              String phoneval =
                                  number.replaceAll(new RegExp(r' '), '');
                              if (phoneval.startsWith('+')) {
                                phoneNumber = phoneval;
                              } else {
                                phoneNumber = "+91" + number;
                              }
                              print(phoneNumber);
                            });
                          },
                          decoration: InputDecoration(
                              hoverColor: Colors.green,
                              hintText: "Phone Number",
                              prefixIcon: Padding(
                                padding:
                                    const EdgeInsetsDirectional.only(start: 0),
                                child: Icon(CupertinoIcons.phone),
                              )),
                        ),
                      ),
                    ]),
                  ),
                  Container(
                    width: (MediaQuery.of(context).size.width - 50),
                    height: 90,
                    alignment: Alignment.center,
                    child: Row(children: <Widget>[
                      Container(
                          width: 130,
                          height: 42,
                          child: TextButton(
                            style: TextButton.styleFrom(
                              primary: Colors.green,
                              shape: RoundedRectangleBorder(
                                side: BorderSide(
                                  color: Colors.green,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(4),
                              ),
                            ),
                            onPressed: () async {
                              if (phoneNumber == "") {
                                Fluttertoast.showToast(
                                    msg: "Please Enter Phone Number",
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.CENTER,
                                    timeInSecForIosWeb: 1);
                                return;
                              }
                              var smsUrl = "sms:$phoneNumber";
                              await launch(smsUrl);
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.sms),
                                Padding(
                                    padding:
                                        EdgeInsetsDirectional.only(start: 10)),
                                Text("SMS")
                              ],
                            ),
                          )),
                      Container(
                        width: 30,
                        height: 50,
                      ),
                      Container(
                          width: 130,
                          height: 50,
                          alignment: Alignment.center,
                          child: TextButton(
                            style: TextButton.styleFrom(
                              primary: Colors.green,
                              shape: RoundedRectangleBorder(
                                side: BorderSide(
                                  color: Colors.green,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(4),
                              ),
                            ),
                            onPressed: () async {
                              if (phoneNumber == "") {
                                Fluttertoast.showToast(
                                    msg: "Please Enter Phone Number",
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.CENTER,
                                    timeInSecForIosWeb: 1);
                                return;
                              }
                              var whatsappUrl =
                                  "whatsapp://send?phone=$phoneNumber";
                              await launch(whatsappUrl);
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                FaIcon(FontAwesomeIcons.whatsapp),
                                Padding(
                                    padding:
                                        EdgeInsetsDirectional.only(start: 10)),
                                Text("Whatsapp")
                              ],
                            ),
                          )),
                    ]),
                  ),
                  Container(
                    child: PhonelogsScreen(),
                  )
                ]),
              ),
              AnimatedPositioned(
                duration: Duration(milliseconds: 1700),
                left: isMenuOpen ? 0 : -sizebarSize,
                curve: Curves.elasticInOut,
                child: SizedBox(
                  width: sizebarSize,
                  child: GestureDetector(
                    onPanUpdate: (details) {
                      if (details.localPosition.dx <= sizebarSize) {
                        setState(() {
                          _offset = details.localPosition;
                        });
                      }

                      if (details.localPosition.dx < sizebarSize &&
                          details.delta.distanceSquared > 5) {
                        setState(() {
                          _animatedIconController.reverse();
                          isMenuOpen = false;
                        });
                      }
                    },
                    onPanEnd: (details) {
                      setState(() {
                        _offset = Offset(0, 0);
                      });
                      ;
                    },
                    child: Stack(
                      children: <Widget>[
                        CustomPaint(
                          size: Size(sizebarSize, mediaQuery.height),
                          painter: DrawerPainter(offset: _offset),
                        ),
                        Container(
                          height: mediaQuery.height,
                          width: sizebarSize,
                          color: Colors.white,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Container(
                                padding: EdgeInsets.only(top: 30),
                                height: mediaQuery.height * 0.20,
                                width: sizebarSize / 2,
                                child: Column(
                                  children: [
                                    Container(
                                      child: CircleAvatar(
                                        maxRadius: 38,
                                        foregroundColor: Colors.green,
                                        backgroundColor: Colors.white,
                                        child: Transform.rotate(
                                            angle: 45 * 3.14 / 90,
                                            child: IconButton(
                                              icon:
                                                  FaIcon(FontAwesomeIcons.yelp),
                                              color: Colors.green,
                                              iconSize: 38,
                                              onPressed: () {},
                                            )),
                                      ),
                                      decoration: new BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: new Border.all(
                                          color: Colors.green,
                                          width: 1.0,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                                      child: Text(
                                        versionName,
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: Colors.green,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Divider(
                                thickness: 1,
                              ),
                              Container(
                                width: double.infinity,
                                height: menuContainerHeight,
                                child: Column(
                                  children: [
                                    MenuButton(
                                      text: "About TextTex",
                                      height: menuContainerHeight / 10,
                                      iconData: Icons.apps,
                                      textSize: getsize(0),
                                      onPressCallback: () {
                                        _showModelBottomSheet(context);
                                      },
                                    ),
                                    Divider(
                                      thickness: 1,
                                    ),
                                    MenuButton(
                                      text: "Privacy Policy",
                                      height: menuContainerHeight / 10,
                                      iconData: Icons.verified_user,
                                      textSize: getsize(1),
                                    ),
                                    Divider(
                                      thickness: 1,
                                    ),
                                    MenuButton(
                                      text: "Help",
                                      height: menuContainerHeight / 10,
                                      iconData: Icons.help,
                                      textSize: getsize(2),
                                    ),
                                    Divider(
                                      thickness: 1,
                                    ),
                                    MenuButton(
                                      text: "Buy Me A Coffee",
                                      height: menuContainerHeight / 10,
                                      iconData:
                                          FaIcon(FontAwesomeIcons.coffee).icon,
                                      textSize: getsize(3),
                                    ),
                                    Divider(
                                      thickness: 1,
                                    ),
                                    MenuButton(
                                      text: "Share",
                                      height: menuContainerHeight / 10,
                                      iconData: Icons.share,
                                      textSize: getsize(4),
                                    ),
                                    Divider(
                                      thickness: 1,
                                    ),
                                    Container(
                                      width: sizebarSize,
                                      height: menuContainerHeight / 7,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Container(
                                            child: CircleAvatar(
                                                maxRadius: 30,
                                                foregroundColor: Colors.green,
                                                //backgroundColor: Colors.white,
                                                child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            100.0),
                                                    child: Image(
                                                        image: AssetImage(
                                                            'assets/shyam.jpg')))),
                                            decoration: new BoxDecoration(
                                              shape: BoxShape.circle,
                                              border: new Border.all(
                                                color: Colors.green,
                                                width: 1.0,
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 25,
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            verticalDirection:
                                                VerticalDirection.down,
                                            children: [
                                              Text(
                                                "Shyamjith Cherukara",
                                                style: TextStyle(
                                                    color: Colors.black45,
                                                    fontSize: 18),
                                              ),
                                              Text(
                                                "shyamjith.calicut@gmail.com",
                                                style: TextStyle(
                                                    color: Colors.black45,
                                                    fontSize: 10),
                                              ),
                                              Text(
                                                "+91 9744473479",
                                                style: TextStyle(
                                                    color: Colors.black45,
                                                    fontSize: 10),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            width: 25,
                                          ),
                                          IconButton(
                                              icon: FaIcon(
                                                FontAwesomeIcons.whatsapp,
                                                size: 35,
                                              ),
                                              color: Colors.green,
                                              onPressed: () async {
                                                var whatsappUrl =
                                                    "whatsapp://send?phone=+919744473479";
                                                await launch(whatsappUrl);
                                              })
                                        ],
                                      ),
                                    ),
                                    Divider(
                                      thickness: 1,
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              )
            ]),
          ),
          floatingActionButton: FloatingActionButton(
              onPressed: () {},
              tooltip: 'Change Theme',
              child: FaIcon(FontAwesomeIcons.lightbulb),
              //backgroundColor: Colors.white,
              foregroundColor: Colors.green,
              shape: CircleBorder(
                  side: BorderSide(
                color: Colors.green,
                width: 1.0,
              ))),
          floatingActionButtonLocation: FloatingActionButtonLocation.endTop),
    );
  }
}

class DrawerPainter extends CustomPainter {
  final Offset offset;
  DrawerPainter({this.offset});
  double getControlPointX(double width) {
    if (offset.dx == 0) {
      return width;
    } else {
      return offset.dx > width ? offset.dx : width + 75;
    }
  }

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.green[100]
      ..style = PaintingStyle.fill;
    Path path = Path();
    path.moveTo(-size.width, 0);
    path.lineTo(size.width, 0);
    //path.lineTo(size.width, size.height);
    path.quadraticBezierTo(
        getControlPointX(size.width), offset.dy, size.width, size.height);
    path.lineTo(-size.width, size.height);
    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

class MenuButton extends StatelessWidget {
  final String text;
  final IconData iconData;
  final double textSize;
  final double height;
  VoidCallback onPressCallback;
  MenuButton(
      {this.text,
      this.iconData,
      this.textSize,
      this.height,
      this.onPressCallback});
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
        height: height,
        hoverColor: Colors.green,
        focusColor: Colors.green,
        highlightColor: Colors.green[50],
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            Icon(
              iconData,
              color: Colors.green,
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              text,
              style: GoogleFonts.abel(
                color: Colors.green,
                fontSize: textSize,
              ),
            ),
          ],
        ),
        onPressed: () {
          onPressCallback();
        });
  }
}
