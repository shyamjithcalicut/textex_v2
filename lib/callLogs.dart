import 'package:flutter/material.dart';
import 'package:call_log/call_log.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

class CallLogs {
  Future<Iterable<CallLogEntry>> getCallLogs() {
    return CallLog.get();
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

  getAvator(CallType callType, String firstLetter) {
    return Container(
      child: CircleAvatar(
        maxRadius: 30,
        foregroundColor: Colors.green,
        backgroundColor: Colors.white,
        child: Text(
          firstLetter,
          style: TextStyle(fontSize: 32),
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
    return DateFormat('dd/MM/yyy H:m:s').format(dt);
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
  }
}
