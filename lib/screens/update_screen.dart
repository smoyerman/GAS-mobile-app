import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';
import '../globals.dart';
import '../main.dart';
import 'package:flutter/widgets.dart';

class UpdateScreen extends StatelessWidget {
  final SharedPreferences sharedPreferences;

  UpdateScreen({required this.sharedPreferences});

  @override
  Widget build(BuildContext context) {

    final List<String>? messageTitles = sharedPreferences.getStringList('messageTitle');
    final List<String>? messageBodies = sharedPreferences.getStringList('messageBody');
    final List<String>? messageSentTime = sharedPreferences.getStringList('messageSentTime');

    return Scaffold(
      appBar: AppBar(
          iconTheme: IconThemeData(
            color: Colors.white, //change your color here
          ),
        title: const Text('UPDATES', style: TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.w500,
        )),
        backgroundColor: primaryColor),
      body: SingleChildScrollView(
        physics: ScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            GestureDetector(
            onTap: _launchURL,
            child: Image.asset(
              'images/Berlin email banner 4.png',
              width: 600,
              height: 130,
              fit: BoxFit.fill,
            ),
          ),
          Container(
              margin: EdgeInsets.fromLTRB(24,18,20,0),
              child: Text('Keep up to date with all of the GAS happenings. Below are a rolling list of '
                'updates for the conference, including talk and location changes, new opportunities, and '
                'ad-hoc gatherings.\n',
              style: TextStyle(fontSize: 14),
            ),
          ),
            Container(
              margin: EdgeInsets.fromLTRB(24,6,20,8),
              //padding: const EdgeInsets.only(bottom: 8),
              child: Text(
                'MESSAGES',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
              ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              reverse: true,
              shrinkWrap: true,
              itemCount: messageTitles!.length,
              itemBuilder: (context, index) {
                return Align( // wrap card with Align
                    child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.9,
                  child: Card(
                  child: ListTile(
                  contentPadding: EdgeInsets.fromLTRB(36,2,20,2),
                  leading: Icon(Icons.message_rounded,
                      color: Colors.blue),
                  title: Text(messageTitles![index] + '\n' + messageSentTime![index],
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(messageBodies![index],
                    style: TextStyle(
                      fontSize: 14,
                    ),
                  ),
                ))));
              },
            ),
          ]
      )
      )
      );

  }
}

_launchURL() async {
  const url = "https://www.glassart.org/conference/berlin-2024/";
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}