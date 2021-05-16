import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';
import './Calllogentry.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CallLogs {
  SharedPreferences sharedPreferences;

  Future<List<CallLogEntry>> getCallLogs() async {
    sharedPreferences = await SharedPreferences.getInstance();
    return getContacts();
  }

  List<CallLogEntry> getContacts() {
    List<String> spList = sharedPreferences.getStringList('contactList');
    List<CallLogEntry> callLogs = List<CallLogEntry>();
    if (spList != null) {
      callLogs =
          spList.map((item) => CallLogEntry.fromMap(jsonDecode(item))).toList();
      callLogs.sort((b, a) => a.timeStamp.compareTo(b.timeStamp));
    }

    return callLogs;
  }

  void call(String text) async {
    String phoneval = text.replaceAll(new RegExp(r' '), '');
    if (phoneval.startsWith('+')) {
      phoneval = phoneval;
    } else {
      phoneval = "+91" + phoneval;
    }
    var whatsappUrl = "whatsapp://send?phone=$phoneval";
    await launch(whatsappUrl);
  }

  getAvator(String firstLetter) {
    return Container(
      child: CircleAvatar(
        maxRadius: 30,
        //foregroundColor: Colors.green,
        backgroundColor: Colors.transparent,
        child: Text(
          firstLetter,
          style: TextStyle(fontSize: 32, color: Colors.green),
        ),
      ),
      decoration: new BoxDecoration(
        shape: BoxShape.circle,
        border: new Border.all(
          color: Colors.green,
          width: 1.0,
        ),
      ),
    );
  }

  String formatDate(DateTime dt) {
    return DateFormat('dd/MM/yyy hh:mm:ss a').format(dt);
  }

  getTitle(CallLogEntry entry) {
    if (entry.name == null) return Text(entry.number);
    if (entry.name.isEmpty)
      return Text(entry.number);
    else
      return Text(entry.name);
  }

  getFirstLetter(CallLogEntry entry) {
    if (entry.name == null) return "#";
    if (entry.name.isEmpty)
      return "#";
    else
      return entry.name.substring(0, 1);
  }

  String getTime(int duration) {
    if (duration != null) {
      Duration d1 = Duration(seconds: duration);
      String formatedDuration = "";
      if (d1.inHours > 0) {
        formatedDuration += d1.inHours.toString() + "h ";
      }
      if (d1.inMinutes > 0) {
        formatedDuration += d1.inMinutes.toString() + "m ";
      }
      if (d1.inSeconds > 0) {
        formatedDuration += d1.inSeconds.toString() + "s";
      }
      if (formatedDuration.isEmpty) return "0s";
      return formatedDuration;
    } else {
      return "";
    }
  }
}

class MenuButton extends StatelessWidget {
  final String text;
  final IconData iconData;
  final double textSize;
  final double height;
  MenuButton({this.text, this.iconData, this.textSize, this.height});
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
        height: height,
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
              style: TextStyle(color: Colors.green, fontSize: textSize),
            ),
          ],
        ),
        onPressed: () {});
  }
}
