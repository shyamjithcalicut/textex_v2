import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:call_log/call_log.dart';
import 'callLogs.dart';
import 'package:url_launcher/url_launcher.dart';

class PhonelogsScreen extends StatefulWidget {
  @override
  _PhonelogsScreenState createState() => _PhonelogsScreenState();
}

class _PhonelogsScreenState extends State<PhonelogsScreen>
    with WidgetsBindingObserver {
  //Iterable<CallLogEntry> entries;
  CallLogs cl = new CallLogs();
  DateTime now = DateTime.now();

  AppLifecycleState _notification;
  Future<Iterable<CallLogEntry>> logs;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    logs = cl.getCallLogs();
    now = DateTime.now();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    // TODO: implement didChangeAppLifecycleState
    super.didChangeAppLifecycleState(state);

    if (AppLifecycleState.resumed == state) {
      final today = DateTime.now();
      final difference = today.difference(now).inSeconds;
      if (difference > 5) {
        setState(() {
          logs = cl.getCallLogs();
          now = DateTime.now();
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          FutureBuilder(
              future: logs,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  Iterable<CallLogEntry> entries = snapshot.data;
                  return Expanded(
                    //height: (MediaQuery.of(context).size.height - 265),
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          child: Card(
                            child: Dismissible(
                                key: Key(index.toString()),
                                onDismissed: (direction) async {
                                  String phoneval = entries
                                      .elementAt(index)
                                      .number
                                      .replaceAll(new RegExp(r' '), '');
                                  if (phoneval.startsWith('+')) {
                                    phoneval = phoneval;
                                  } else {
                                    phoneval = "+91" + phoneval;
                                  }
                                  if (direction ==
                                      DismissDirection.startToEnd) {
                                    var whatsappUrl =
                                        "whatsapp://send?phone=$phoneval";
                                    await launch(whatsappUrl);
                                  } else {
                                    var smsUrl = "sms:$phoneval";
                                    await launch(smsUrl);
                                  }

                                  setState(() {
                                    //logs = cl.getCallLogs();
                                  });
                                },
                                background: Container(
                                  color: Colors.green,
                                  padding: EdgeInsets.symmetric(horizontal: 20),
                                  alignment: AlignmentDirectional.centerStart,
                                  child: FaIcon(
                                    FontAwesomeIcons.whatsapp,
                                    color: Colors.white,
                                  ),
                                ),
                                secondaryBackground: Container(
                                    color: Colors.blue,
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 20),
                                    alignment: AlignmentDirectional.centerEnd,
                                    child: Icon(
                                      Icons.sms,
                                      color: Colors.white,
                                    )),
                                child: ListTile(
                                  leading: cl.getAvator(
                                      entries.elementAt(index).callType,
                                      cl.getFirstLetter(
                                          entries.elementAt(index))),
                                  title: cl.getTitle(entries.elementAt(index)),
                                  subtitle: Text(cl.formatDate(
                                      new DateTime.fromMillisecondsSinceEpoch(
                                          entries.elementAt(index).timestamp))),
                                  isThreeLine: false,
                                  trailing: Wrap(children: <Widget>[
                                    IconButton(
                                        icon: FaIcon(
                                          FontAwesomeIcons.whatsapp,
                                          size: 35,
                                        ),
                                        color: Colors.green,
                                        onPressed: () {
                                          cl.call(
                                              entries.elementAt(index).number);
                                        })
                                  ]),
                                )),
                          ),
                          onLongPress: () {},
                        );
                      },
                      itemCount: entries.length,
                    ),
                  );
                } else {
                  return Center(child: CircularProgressIndicator());
                }
              })
        ],
      ),
    );
  }
}
