import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/cupertino.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:fluttertoast/fluttertoast.dart';
import './phonelogs_screen.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.white, // navigation bar color
      statusBarColor: Colors.white, // status bar color,
      systemNavigationBarDividerColor: Colors.white
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
      theme: ThemeData(
          primaryColor: Colors.green,
          accentColor: Colors.green,
          canvasColor: Colors.transparent,
          backgroundColor: Colors.white,
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

class _MyHomePageState extends State<MyHomePage> {
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
                color: Colors.white,
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
                            "v1.0.0",
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
                      color: Colors.white,
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
                  width: (MediaQuery.of(context).size.width - 50),
                  height: 90,
                  alignment: Alignment.center,
                  child: Row(children: <Widget>[
                    Container(
                      width: 20,
                      height: 50,
                    ),
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
                                  padding:
                                      EdgeInsetsDirectional.only(start: 10)),
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text(
            "TexTex",
            style: GoogleFonts.abel(
              color: Colors.green,
              fontSize: 40,
            ),
          ),
          foregroundColor: Colors.green,
          leading: Transform.rotate(
              angle: 45 * 3.14 / 90,
              child: IconButton(
                icon: FaIcon(FontAwesomeIcons.yelp),
                color: Colors.green,
                iconSize: 30,
                onPressed: () {},
              )),
        ),
        body: Container(
          color: Colors.white,
          child: Column(children: <Widget>[
            Container(
              width: (MediaQuery.of(context).size.width - 50),
              height: 30,
              color: Colors.white,
            ),
            Container(
              width: (MediaQuery.of(context).size.width - 50),
              height: 50,
              alignment: Alignment.center,
              color: Colors.white,
              child: Row(children: <Widget>[
                Flexible(
                  child: TextField(
                    keyboardType: TextInputType.phone,
                    autofocus: true,
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
                          padding: const EdgeInsetsDirectional.only(start: 0),
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
                              padding: EdgeInsetsDirectional.only(start: 10)),
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
                        var whatsappUrl = "whatsapp://send?phone=$phoneNumber";
                        await launch(whatsappUrl);
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          FaIcon(FontAwesomeIcons.whatsapp),
                          Padding(
                              padding: EdgeInsetsDirectional.only(start: 10)),
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
        floatingActionButton: FloatingActionButton(
            onPressed: () {
              _showModelBottomSheet(context);
            },
            tooltip: 'Buy Me a Coffee',
            child: FaIcon(FontAwesomeIcons.lightbulb),
            backgroundColor: Colors.white,
            foregroundColor: Colors.green,
            shape: CircleBorder(
                side: BorderSide(
              color: Colors.green,
              width: 1.0,
            ))),
        floatingActionButtonLocation: FloatingActionButtonLocation.endTop);
  }
}
