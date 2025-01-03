import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

/// The base class for the different types of items the list can contain.
abstract class ListItem {
  /// The time to show in a list item.
  Widget buildStartTime(BuildContext context);

  /// The time to show in a list item.
  Widget buildEndTime(BuildContext context);

  /// The title line to show in a list item.
  Widget buildTitle(BuildContext context);

  /// The speaker line, if any, to show in a list item.
  //Widget buildSpeaker(BuildContext context);

  /// The speaker line, if any, to show in a list item.
  Widget buildSpeakerCard(BuildContext context);

  /// The location line to show in a list item.
  Widget buildLocation(BuildContext context);

  /// The type of talk line to show in a list item.
  //Widget buildType(BuildContext context);

  /// The full description to show in a list item.
  Widget buildDescription(BuildContext context);
  //Widget buildType(BuildContext context);
  //Widget buildFullTime(BuildContext context);
  Widget buildTalkHeader(BuildContext context);

  /// Return and switch whether a talk is saved
  bool returnSaved(BuildContext context);
  bool switchSaved(BuildContext context);
  String returnSpeaker(BuildContext context);
  String returnSpeakerSite(BuildContext context);
  String returnSpeakerIG(BuildContext context);
  String returnLocation(BuildContext context);
  String returnTitle(BuildContext context);
  String returnStartTime(BuildContext context);
  String returnEndTime(BuildContext context);
  String returnFocus(BuildContext context);
  String returnType(BuildContext context);
  String returnFullTime(BuildContext context);
  String returnCoPresenters(BuildContext context);

  //ListItem(this.image, this.name, this.website);
}

/// A ListItem that contains data to display a heading.
class TalkTitleItem implements ListItem {
  final String talkTitle;
  final String talkSpeaker;
  final String talkLocation;
  final String talkType;
  final String subType;
  final String talkFocus;
  final String talkDescription;

  final String website;
  final String socialMedia;
  final String coPresenters;

  final DateTime talkStartDateTime;
  final DateTime talkEndDateTime;

  bool talkSaved;

  TalkTitleItem(
      {required this.talkTitle,
      required this.talkSpeaker,
      required this.talkLocation,
      required this.talkType,
      required this.subType,
      required this.talkFocus,
      required this.talkDescription,
      required this.website,
      required this.socialMedia,
      required this.coPresenters,
      required this.talkStartDateTime,
      required this.talkEndDateTime,
      required this.talkSaved});

  //fname: json['fname']! != null ? json['fname'] as String : "",
  TalkTitleItem.fromJson(Map<String, Object?> json)
      : this(
          talkTitle: json['title'] != null ? json['title'] as String : "",
          talkSpeaker:
              json['presenter'] != null ? json['presenter'] as String : "",
          talkLocation:
              json['location'] != null ? json['location'] as String : "",
          talkType: json['type'] != null ? json['type'] as String : "",
          subType: json['subtype'] != null ? json['subtype'] as String : "",
          website: json['website'] != null ? json['website'] as String : "",
          socialMedia:
              json['socialMedia'] != null ? json['socialMedia'] as String : "",
          talkFocus: json['focus'] != null ? json['focus'] as String : "",
          talkDescription:
              json['description'] != null ? json['description'] as String : "",
          coPresenters: json['coPresenters'] != null
              ? json['coPresenters'] as String
              : "",
          talkStartDateTime: json['startTime'] != null
              ? json['startTime'] as DateTime
              : DateTime(1),
          talkEndDateTime: json['endTime'] != null
              ? json['endTime'] as DateTime
              : DateTime(1),
          talkSaved:
              json['talkSaved'] != null ? json['talkSaved'] as bool : false,
        );

  Map<String, Object?> toJson() {
    return {
      'title': talkTitle,
      'presenter': talkSpeaker,
      'location': talkLocation,
      'type': talkType,
      'subtype': subType,
      'focus': talkFocus,
      'description': talkDescription,
      'coPresenters': coPresenters,
      'startTime': talkStartDateTime,
      'endTime': talkEndDateTime,
    };
  }

  @override
  String returnSpeakerSite(BuildContext context) {
    return website;
  }

  @override
  String returnSpeakerIG(BuildContext context) {
    return socialMedia;
  }

  @override
  String returnTitle(BuildContext context) {
    return talkTitle;
  }

  @override
  String returnLocation(BuildContext context) {
    return talkLocation;
  }

  @override
  String returnSpeaker(BuildContext context) {
    return talkSpeaker;
  }

  @override
  bool returnSaved(BuildContext context) {
    return talkSaved;
  }

  @override
  String returnStartTime(BuildContext context) {
    var hr = talkStartDateTime.hour.toString();
    var min = talkEndDateTime.minute.toString();
    return "$hr:$min";
  }

  String returnEndTime(BuildContext context) {
    var hr = talkStartDateTime.hour.toString();
    var min = talkEndDateTime.minute.toString();
    return "$hr:$min";
  }

  @override
  String returnFullTime(BuildContext context) {
    return DateFormat('EEEE LLLL d -').add_jm().format(talkStartDateTime);
  }

  @override
  String returnFocus(BuildContext context) {
    return "$talkFocus - $talkType";
  }

  @override
  String returnType(BuildContext context) {
    return talkType;
  }

  @override
  String returnCoPresenters(BuildContext context) {
    return coPresenters;
  }

  @override
  bool switchSaved(BuildContext context) {
    talkSaved = !talkSaved;
    return talkSaved;
  }

  @override
  Widget buildLocation(BuildContext context) {
    return Text(
      talkLocation,
      style: TextStyle(
        color: Colors.grey[500],
      ),
    );
  }

  @override
  Widget buildDescription(BuildContext context) {
    return Padding(
        padding: EdgeInsets.fromLTRB(10, 0, 32, 40),
        child: Text(talkDescription, softWrap: true));
  }

  @override
  Widget buildTitle(BuildContext context) {
    return Text(
      talkTitle,
      style: TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 14,
        //color: Colors.blue,
      ),
    );
  }

  @override
  Widget buildStartTime(BuildContext context) {
    return Text(
      DateFormat('HH:mm').format(
          talkStartDateTime), //DateFormat.jm().format(talkStartDateTime)
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 14,
      ),
    );
  }

  @override
  Widget buildEndTime(BuildContext context) {
    return Text(
      DateFormat('HH:mm')
          .format(talkEndDateTime), //DateFormat.jm().format(talkEndDateTime),
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 14,
      ),
    );
  }

  @override
  Widget buildSpeakerCard(BuildContext context) {
    String talkDesc = "$talkLocation\n$talkType" +
        (talkFocus.isNotEmpty ? " - $talkFocus" : "");
    return Text.rich(
      TextSpan(
        children: <TextSpan>[
          TextSpan(
            text: "$talkSpeaker \n",
            style: TextStyle(
              fontStyle: FontStyle.italic,
              fontSize: 14,
              color: Colors.black,
            ),
          ),
          TextSpan(
            text: talkDesc,
            style: TextStyle(
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget buildTalkHeader(BuildContext context) {
    return Expanded(
      /*1*/
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /*2*/
          Container(
            padding: const EdgeInsets.fromLTRB(0, 0, 32, 0),
            child: Text(
              talkTitle,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          ),
          ListTile(
            leading: Row(mainAxisSize: MainAxisSize.min, children: <Widget>[
              IconButton(
                  icon: FaIcon(
                    FontAwesomeIcons.instagram,
                    size: 20,
                  ),
                  onPressed: () async {
                    if (socialMedia.isNotEmpty) {
                      var nativeUrl =
                          "instagram://user?username=" + socialMedia;
                      var webUrl = "https://www.instagram.com/" + socialMedia;
                      if (await canLaunch(nativeUrl)) {
                        await launch(nativeUrl);
                      } else if (await canLaunch(webUrl)) {
                        await launch(webUrl);
                      } else {
                        print("can't open Instagram");
                      }
                    }
                  }),
              IconButton(
                icon: Icon(Icons.link, size: 20),
                onPressed: () async {
                  launch(website);
                },
              ),
            ]),
            title: Text(
              talkSpeaker,
              style: TextStyle(
                fontStyle: FontStyle.italic,
                fontSize: 16,
                color: Colors.black,
              ),
            ),
            subtitle: Text(
              DateFormat('EEEE LLLL d - HH:mm-').format(
                      talkStartDateTime) + //Text(DateFormat('EEEE LLLL d -').add_jm().format(talkStartDateTime),
                  DateFormat('HH:mm').format(talkEndDateTime),
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(18, 6, 0, 0),
            child: Text(
              DateFormat('EEEE LLLL d - HH:mm-').format(
                      talkStartDateTime) + //Text(DateFormat('EEEE LLLL d -').add_jm().format(talkStartDateTime),
                  DateFormat('HH:mm').format(talkEndDateTime),
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(18, 0, 0, 0),
            child: Text(
              "$talkFocus - $talkType",
              style: TextStyle(
                color: Colors.grey[500],
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(18, 0, 0, 0),
            child: Text(
              talkLocation,
              style: TextStyle(
                color: Colors.grey[500],
              ),
            ),
          ),
        ],
      ),
    );
  }
}


/*
class Event {
  Event(
      {required this.year,
      required this.title,
      required this.presenter,
      required this.location,
      required this.type,
      required this.subtype,
      required this.focus,
      required this.description,
      required this.coPresenters,
      required this.startTime,
      required this.endTime,
      required this.talkSaved});

  Event.fromJson(Map<String, Object?> json)
      : this(
          year: json['year']! as String,
          title: json['title']! as String,
          presenter: json['presenter']! as Presenter,
          location: json['location']! as String,
          type: json['type']! as String,
          subtype: json['subtype']! as String,
          focus: json['focus']! as String,
          description: json['description']! as String,
          coPresenters: json['coPresenters']! as String,
          startTime: json['startTime'] as DateTime,
          endTime: json['endTime'] as DateTime,
          talkSaved: json['talkSaved'] as bool,
        );

  final String year;
  final String title;
  final Presenter presenter;
  final String location;
  final String type;
  final String subtype;
  final String focus;
  final String description;
  final String coPresenters;
  final DateTime startTime;
  final DateTime endTime;
  bool talkSaved;

  Map<String, Object?> toJson() {
    return {
      'year': year,
      'title': title,
      'presenter': presenter,
      'location': location,
      'type': type,
      'subtype': subtype,
      'focus': focus,
      'description': description,
      'coPresenters': coPresenters,
      'startTime': startTime,
      'endTime': endTime,
      'talkSaved': talkSaved,
    };
  }
}

class Presenter {
  Presenter(
      {required this.fname,
      required this.lname,
      required this.pronoun,
      required this.email,
      required this.website,
      required this.handle});

  Presenter.fromJson(Map<String, Object?> json)
      : this(
          fname: json['fname'] != null ? json['fname'] as String : "",
          lname: json['lname'] != null ? json['lname'] as String : "",
          pronoun: json['pronoun'] != null ? json['pronoun'] as String : "",
          email: json['email'] != null ? json['email'] as String : "",
          website: json['website'] != null ? json['website'] as String : "",
          handle: json['handle'] != null ? json['handle'] as String : "",
        );

  final String? fname;
  final String? lname;
  final String? pronoun;
  final String? email;
  final String? website;
  final String? handle;

  Map<String, Object?> toJson() {
    return {
      'fname': fname,
      'lname': lname,
      'pronoun': pronoun,
      'email': email,
      'website': website,
      'handle': handle,
    };
  }
}
*/
