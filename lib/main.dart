import 'dart:convert';
import 'package:flutter/gestures.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'globals.dart';
//import './data/talks.dart';
import './screens/schedule_screen.dart';
import './screens/location_screen.dart';
import './screens/info_screen.dart';
import './screens/update_screen.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/foundation.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:rxdart/rxdart.dart';
import 'package:shared_preferences/shared_preferences.dart';

//import 'package:flutter_local_notifications/flutter_local_notifications.dart';

// Uncomment lines 3 and 6 to view the visual layout at runtime.
// import 'package:flutter/rendering.dart' show debugPaintSizeEnabled;

import 'firebase_options.dart';
// FlutterFire's Firebase Cloud Messaging plugin
import 'package:firebase_messaging/firebase_messaging.dart';

/************* CLASS CONSTRUCTION TO ADD SPONSOR PHOTO ITEMS ***************/
class PhotoItem {
  final String image;
  final String name;
  final String website;
  PhotoItem(this.image, this.name, this.website);
}

/************* CLASS CONSTRUCTION TO ADD SPEAKER IMAGE LIST ***************/
class SpeakerImage {
  final String imageLink;
  const SpeakerImage(this.imageLink);
}

/**************** CLASS FOR TALK ITEMS *******************/

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

  //ListItem(this.image, this.name, this.website);

}

/// A ListItem that contains data to display a heading.
class TalkTitleItem implements ListItem {
  final String talkTitle;
  final String talkSpeaker;
  final String talkLocation;
  final String talkType;
  final String talkFocus;
  final String talkDescription;

  final String website;
  final String socialMedia;
  final String coPresenters;

  final DateTime talkStartDateTime;
  final DateTime talkEndDateTime;

  bool talkSaved;

  TalkTitleItem(this.talkTitle, this.talkSpeaker, this.talkLocation,
      this.talkType, this.talkFocus, this.talkDescription,
      this.website, this.socialMedia, this.coPresenters,
      this.talkStartDateTime, this.talkEndDateTime, this.talkSaved);

  /*@override
  Widget buildType(BuildContext context) {
    return Text("$talkFocus $talkType",
      style: TextStyle(
        color: Colors.grey[500],
      ),
    );
  }*/

  @override
  String returnSpeakerSite(BuildContext context){return website;}

  @override
  String returnSpeakerIG(BuildContext context){return socialMedia;}

  @override
  String returnTitle(BuildContext context) {return talkTitle;}

  @override
  String returnLocation(BuildContext context) {return talkLocation;}

  @override
  String returnSpeaker(BuildContext context) {return talkSpeaker;}

  @override
  bool returnSaved(BuildContext context) {return talkSaved;}

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
    return DateFormat('EEEE LLLL d -').add_jm().format(talkStartDateTime);}

  @override
  String returnFocus(BuildContext context) {
    return "$talkFocus - $talkType";}

  @override
  String returnType(BuildContext context) {return talkType;}

  @override
  bool switchSaved(BuildContext context) {
    talkSaved = !talkSaved;
    return talkSaved;
  }

  @override
  Widget buildLocation(BuildContext context) {
    return Text(talkLocation,
      style: TextStyle(
      color: Colors.grey[500],
      ),
    );
  }

  @override
  Widget buildDescription(BuildContext context) {
    return Padding(
        padding: EdgeInsets.fromLTRB(10, 0, 32, 40),
        child: Text(talkDescription,
        softWrap: true)
    );
  }

  @override
  Widget buildTitle(BuildContext context) {
    return Text(
      talkTitle,
      style: TextStyle(fontWeight: FontWeight.bold,
        fontSize: 14,
      ),
    );
  }

  @override
  Widget buildStartTime(BuildContext context) {
    return Text(
        DateFormat('HH:mm').format(talkStartDateTime), //DateFormat.jm().format(talkStartDateTime)
      style: TextStyle(fontWeight: FontWeight.bold,
        fontSize: 14,
      ),
    );
  }

  @override
  Widget buildEndTime(BuildContext context) {
    return Text(
      DateFormat('HH:mm').format(talkEndDateTime), //DateFormat.jm().format(talkEndDateTime),
      style: TextStyle(fontWeight: FontWeight.bold,
        fontSize: 14,
      ),
    );
  }

  @override
  Widget buildSpeakerCard(BuildContext context) {
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
            text: "$talkLocation: $talkFocus - $talkType",
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
                    style: TextStyle(fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ),

                Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      IconButton(
                        // Use the FaIcon Widget + FontAwesomeIcons class for the IconData
                          icon: FaIcon(FontAwesomeIcons.instagram,
                            size: 20,
                          ),
                          onPressed: () async {
                            var nativeUrl = "instagram://user?username=" + socialMedia;
                            var webUrl = "https://www.instagram.com/" + socialMedia;
                            if (await canLaunch(nativeUrl)) {
                              await launch(nativeUrl);
                            } else if (await canLaunch(webUrl)) {
                              await launch(webUrl);
                            } else {
                              print("can't open Instagram");
                            }
                          }
                      ),
                      GestureDetector(
                        onTap: () async {
                          launch(website);
                        },
                        child: Container(
                          //padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                          child: Text.rich(
                            TextSpan(
                              text: talkSpeaker,
                              style: TextStyle(
                                fontStyle: FontStyle.italic,
                                fontSize: 16,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ]
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(18, 6, 0, 0),
                  child: Text(DateFormat('EEEE LLLL d - HH:mm-').format(talkStartDateTime) +  //Text(DateFormat('EEEE LLLL d -').add_jm().format(talkStartDateTime),
                            DateFormat('HH:mm').format(talkEndDateTime),
                    style: TextStyle(fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(18, 0, 0, 0),
                  child: Text("$talkFocus - $talkType",
                    style: TextStyle(
                      color: Colors.grey[500],
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(18, 0, 0, 0),
                  child: Text(talkLocation,
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

// used to pass messages from event handler to the UI
final _messageStreamController = BehaviorSubject<RemoteMessage>();
const primaryColor = Colors.blue;
const headerTextColor = Colors.white;

Future<void> _updateSharedPreferences(SharedPreferences sharedPreferences, RemoteMessage message) async {
  // read the old lists, append data, and create new lists
  final formerMessageIdList = sharedPreferences.getStringList('messageIds');
  final formerMessageDataList = sharedPreferences.getStringList('messageData');
  final formerMessageTitleList = sharedPreferences.getStringList('messageTitle');
  final formerMessageBodyList = sharedPreferences.getStringList('messageBody');

  // append the new data to it
  formerMessageIdList?.add("${message.messageId}");
  formerMessageDataList?.add("${message.data}");
  formerMessageTitleList?.add("${message.notification?.title}");
  formerMessageBodyList?.add("${message.notification?.body}");

  // and save the new list back to storage
  await sharedPreferences.setStringList('messageIds', formerMessageIdList!);
  await sharedPreferences.setStringList('messageData', formerMessageDataList!);
  await sharedPreferences.setStringList('messageTitle', formerMessageTitleList!);
  await sharedPreferences.setStringList('messageBody', formerMessageBodyList!);

  final List<String>? items = sharedPreferences.getStringList('messageIds');
  if (kDebugMode) {
    print(items);
    print("is anything happening??");
  }

}

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message,
    {SharedPreferences? sharedPreferences}) async {

  await Firebase.initializeApp();

  if (kDebugMode) {
    print("Handling a background message: ${message.messageId}");
    print('Message data: ${message.data}');
    print('Message notification: ${message.notification?.title}');
    print('Message notification: ${message.notification?.body}');
  }

  // Store everything!
  _updateSharedPreferences(sharedPreferences!, message);

}

Future<void> main() async {

  // Put me FIRST unless you want everything to hang forever - have to bind first
  WidgetsFlutterBinding.ensureInitialized();

  // Obtain shared preferences for logging messages.
  final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  await sharedPreferences.setStringList('messageIds', <String>[]);
  await sharedPreferences.setStringList('messageData', <String>[]);
  await sharedPreferences.setStringList('messageTitle', <String>[]);
  await sharedPreferences.setStringList('messageBody', <String>[]);

  // Initiatlize the app
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  final messaging = FirebaseMessaging.instance;
  final manifestJson = await rootBundle.loadString('AssetManifest.json');
  final imageList = json.decode(manifestJson).keys.where((String key) => key.startsWith('images/TalkImages'));

  final settings = await messaging.requestPermission(
    alert: true,
    announcement: false,
    badge: true,
    carPlay: false,
    criticalAlert: false,
    provisional: false,
    sound: true,
  );

  if (kDebugMode) {
    print('Permission granted: ${settings.authorizationStatus}');
  }

  const vapidKey = "BP74mvWwrdoIAtnc52k2lQYY4xrnsKfr-xhYBMgeG4ROmZi9bNIubaenBrKDyWCXAt8x3dK5s77c_6aerBnEWcs";

  // use the registration token to send messages to users from your trusted server environment
  String? token;

  if (DefaultFirebaseOptions.currentPlatform == DefaultFirebaseOptions.web) {
    token = await messaging.getToken(
      vapidKey: vapidKey,
    );
  } else {
    token = await messaging.getToken();
  }

  if (kDebugMode) {
    print('Registration Token=$token');
  }

  FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    if (kDebugMode) {
      print('Handling a foreground message: ${message.messageId}');
      print('Message data: ${message.data}');
      print('Message notification: ${message.notification?.title}');
      print('Message notification: ${message.notification?.body}');
    }

    _messageStreamController.sink.add(message);
    //_updateSharedPreferences(sharedPreferences, message);

  });

  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  runApp(
      MaterialApp(
        title: 'Passing Data',
        home: MyApp(
          images: List<SpeakerImage>.from(imageList.map((s) => SpeakerImage(s)).toList()),
          sharedPreferences: sharedPreferences,
      ),
  ),
  );
}

class MyApp extends StatelessWidget {

  final List<SpeakerImage> images;
  final SharedPreferences sharedPreferences;
  MyApp({super.key, required this.images, required this.sharedPreferences});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '2024 GAS Conference',
      theme: ThemeData(
        colorSchemeSeed: const Color(0xff6750a4),
        useMaterial3: true,
      ),
      home: MyHomePage(
        title: '2024 GAS Conference',
        images: images,
        sharedPreferences: sharedPreferences,
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {

  final List<SpeakerImage> images;
  final SharedPreferences sharedPreferences;
  final String title;

  const MyHomePage({super.key, required this.title,
    required this.images, required this.sharedPreferences});
  // TODO: Pass sharedPreferences to the Updates page
  // TODO: Update sharedPreferences with message text

  @override
  State<MyHomePage> createState() => _MyHomePageState(
    images:images,
    sharedPreferences:sharedPreferences,
  );
}

String venueTitle = 'VENUES';
String venueText = 'Our conference presentations will be hosted at two hubs: Wilhelm Hallen and '
    'Provinzstraße (Berlin Glas, Monopol, and Bard College Berlin)';
String accomodationsTitle = 'ACCOMODATIONS';
String accomodationsText = 'GAS Partner Hotels';
/*String exhibitionsTitle = 'EXHIBITIONS';
String exhibitionsText = 'We have exhibition opportunities available for GAS members and the general public, both in person and online. '
    'Showcasing the depth and breadth of our membership and exploring a range of poignant topics in the glass '
    'community, our conference exhibitions offer a unique way for artists to participate from across the globe.';
String middayInteractiveTitle = 'MIDDAY INTERACTIVE PROGRAMMING';
String middayInteractiveText = 'NEW THIS YEAR: In response to attendee feedback, we are offering themed interactive '
    'programming at Wilhelm Hallen during a midday pause in the schedule. Enjoy time to mingle with fellow '
    'glass enthusiasts, an extended break for lunch, or a beer at our Biergarten at Wilhelm Hallen.';*/



class _MyHomePageState extends State<MyHomePage> {
  String _lastMessage = "";
  final List<SpeakerImage> images;
  List<String> imagePaths = [];
  final SharedPreferences sharedPreferences;

  // STEPH TODO: get rid of this and make the string to log
  _MyHomePageState({required this.images, required this.sharedPreferences}) {
    _messageStreamController.listen((message) {
      setState(() {
        if (message.notification != null) {
          _lastMessage = 'Received a notification message:'
              '\nTitle=${message.notification?.title},'
              '\nBody=${message.notification?.body},'
              '\nData=${message.data}';
        } else {
          _lastMessage = 'Received a data message: ${message.data}';
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget titleSection = Container(
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          Expanded(
            /*1*/
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // TODO: Remove when ready!!! Make Pop Up Instead //
                /*Text('Last message from Firebase Messaging:',
                    style: Theme.of(context).textTheme.titleLarge),
                Text(_lastMessage, style: Theme.of(context).textTheme.bodyLarge),*/
                /*2*/
                Container(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: const Text(
                    'Where Art + Design Meet',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const Text(
                    'Wednesday, May 15th - Saturday, May 18th',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                Text(
                  'Berlin, Germany',
                  style: TextStyle(
                    color: Colors.grey[500],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );

    buildButtonColumn(icon, label, onTap) {
      //Color color = Colors.blue; //Theme.of(context).primaryColor;
      return GestureDetector(
        onTap: onTap,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: primaryColor),
            Container(
              margin: const EdgeInsets.only(top: 8.0),
              child: Text(
                label,
                style: TextStyle(
                  fontSize: 12.0,
                  fontWeight: FontWeight.w400,
                  color: primaryColor,
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget buttonSection = Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          buildButtonColumn(Icons.info_outlined, 'EVENTS', (){
            _navigateToInfoScreen(context);
          }),
          buildButtonColumn(Icons.calendar_month, 'SESSIONS', (){
            _navigateToScheduleScreen(context);
          }),
          buildButtonColumn(Icons.map_outlined, 'LOCATIONS', (){
            _navigateToLocationScreen(context);
          }),
          buildButtonColumn(Icons.info_outlined, 'UPDATES', (){
            _navigateToUpdateScreen(context);
          }),
        ],
      ),
    );

    Widget textSection = Container(
      padding: const EdgeInsets.fromLTRB(32, 20, 32, 0),
      child: const Text(
        'The annual GAS conference will invite glass '
        'enthusiasts from around the world to discover the vibrant energy '
        'of Berlin, Germany. From the sparkling glass panes of the Reichstag '
        'Dome to the iconic murals of Berlin’s East Side Gallery, conference '
        'attendees will be dazzled by the host city and GAS’s conference '
        'program in equal measure. The conference theme is Berlin: Where '
        'Art + Design Meet, focusing on the space where art meets design, '
        'the synergy between the two, and the relationships between artists '
        'and designers. Exciting add-ons for conference registration will '
        'include a half-day trip for attendees wishing to experience the '
        'highlights of Berlin and excursions to other glassy locations in '
        'Germany.',
        softWrap: true,
      ),
    );

    buildTitleWidget(titleText, subtitleText) {
      return Container(
        padding: const EdgeInsets.fromLTRB(32,0,32,0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /*2*/
            Container(
              padding: const EdgeInsets.only(bottom: 8),
              child: Text(
                titleText,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Text(
              subtitleText + '\n',
              softWrap: true,
            ),
          ],
        ),
      );
    };

    Widget accomodationsContent = Column(
        children: <Widget>[
          ExpansionTile(
            leading: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset("images/Accomodations/park-inn-by-radisson.webp",
                  width: 80,
                  fit: BoxFit.fitWidth,
                ),
              ],
            ),
            title: Text('Park Inn by Radisson',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            subtitle: Text('Alexanderplatz 7, Berlin'),
            children: <Widget>[
              ListTile(
                  dense:true,
                  contentPadding: EdgeInsets.symmetric(horizontal: 30.0, vertical: -10.0),
                  visualDensity: VisualDensity(horizontal: 0, vertical: -4),
                  title: Text(
                    'The official conference hotel will be the best option for those wanting to explore '
                        'all the cultural highlights of Berlin–it’s located in the center of the city!\n\n'
                        'Park Inn at Alexanderplatz is less than two blocks from Alexanderplatz station. '
                        'Alexanderplatz station is accessible via the U2, U5 and U8, the S3, S5, S7 and S9, '
                        'and the regional (airport) train RE1.',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )),
            ],
          ),
          ExpansionTile(
            leading: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset("images/Accomodations/nena_hostel-welcome-768x512.webp",
                  width: 80,
                  fit: BoxFit.contain,
                ),
              ],
            ),
            title: Text('Nena Hostel',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            subtitle: Text('Provinzstraße 16, Berlin'),
            children: <Widget>[
              ListTile(
                  dense:true,
                  contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: -10.0),
                  visualDensity: VisualDensity(horizontal: 0, vertical: -4),
                  title: Text(
                    'Your choice for low-cost accommodations in Berlin close to the conference action, '
                        'starting at €33 per night for a bed in a shared room.\n',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )),
            ],
          ),
        ]
    );

    Widget venueContent = Column(
        children: <Widget>[
          ExpansionTile(
            leading: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset("images/Venues/WilhelmHallenLogo.jpg",
                  width: 80,
                  fit: BoxFit.fitWidth,
                ),
              ],
            ),
            title: Text('Wilhelm Hallen',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            subtitle: Text('Kopenhagener Str. 60-72'),
            children: <Widget>[
              ListTile(
                  dense:true,
                  contentPadding: EdgeInsets.symmetric(horizontal: 30.0, vertical: -10.0),
                  visualDensity: VisualDensity(horizontal: 0, vertical: -4),
                  title: Text(
                    '   • Conference Kickoff\n'
                        '   • Midday Interactive Programming\n'
                        '   • GAS Market\n'
                        '   • Lectures\n'
                        '   • Panels\n'
                        '   • Lecmos\n'
                        '   • Cold Demonstrations\n'
                        '   • Green Pavillion\n'
                        '   • Beer Garden\n'
                        '   • Registration\n'
                        '   • GAS Film Festival Opening\n'
                        '   • Trunk Show\n'
                        '   • Goblet Grab\n'
                        '   • Portfolio Review\n',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )),
            ],
          ),
          ExpansionTile(
            leading: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset("images/Venues/BerlinGlasLogo.png",
                  width: 80,
                  fit: BoxFit.contain,
                ),
              ],
            ),
            title: Text('Berlin Glas',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            subtitle: Text('Provinzstraße 42a'),
            children: <Widget>[
              ListTile(
                  dense:true,
                  contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: -10.0),
                  visualDensity: VisualDensity(horizontal: 0, vertical: -4),
                  title: Text(
                    '   • Hot Glass Demos\n'
                        '   • Kids Oasis\n',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )),
            ],
          ),
          ExpansionTile(
            leading: Image.asset("images/Venues/MonopolLogo.jpg",
                width: 80,
                fit: BoxFit.fitWidth
            ),
            title: Text('Monopol',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            subtitle: Text('Provinzstraße 40-44'),
            children: <Widget>[
              ListTile(
                  dense:true,
                  contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: -10.0),
                  visualDensity: VisualDensity(horizontal: 0, vertical: -4),
                  title: Text(
                    '   • Lecmos\n'
                        '   • Glass on the Go Rodeo (Mobile Hot Shops)\n',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )),
            ],
          ),
          ExpansionTile(
            leading: Image.asset("images/Venues/BardBerlinLogo.png",
                width: 80,
                fit: BoxFit.fitWidth
            ),
            title: Text('Bard College Berlin',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            subtitle: Text('Provinzstraße 40-44'),
            children: <Widget>[
              ListTile(
                  dense:true,
                  contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: -10.0),
                  visualDensity: VisualDensity(horizontal: 0, vertical: -4),
                  title: Text(
                    '   • Flame and Neon Demos\n',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )),
            ],
          ),
        ]
    );

    Widget sponsorTitle = Container(
      padding: const EdgeInsets.fromLTRB(32,0,32,0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /*2*/
          Container(
            padding: const EdgeInsets.only(bottom: 8),
            child: const Text(
              'PARTNERS',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Text(
            'The 2024 GAS Conference is generously supported by:',
            softWrap: true,
          ),
        ],
      ),
    );

    Widget sponsorSection = Container(
      padding: const EdgeInsets.fromLTRB(32, 0, 32, 32),
      child: GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: items.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        childAspectRatio: 1,
        crossAxisSpacing: 0,
        mainAxisSpacing: 0,
      ),
      itemBuilder: (ctx, index) {
          return GestureDetector(
              onTap: () async {
                var url = items[index].website;
                launch(url);
              }, // Image tapped
        child: Container(
            margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.scaleDown,
                image: AssetImage(items[index].image),
              ),
            ),
          ),
          );
      },
    ),
    );

    Widget myDivider = Divider(thickness: 2, color: Colors.blue,
        indent: 32, endIndent: 32, height: 50);

    return MaterialApp(
      title: 'GAS Conference 2024 - Berlin',
      theme: ThemeData(
        primaryColor: primaryColor,
      ),
      home: Scaffold(
        appBar: AppBar(
            iconTheme: IconThemeData(
              color: Colors.white, //change your color here
            ),
            title: const Text('2024 GAS CONFERENCE', style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.w500,
            )),
            elevation: 2,
            backgroundColor: primaryColor),
        body: ListView(
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
            titleSection,
            buttonSection,
            textSection,
            myDivider,
            buildTitleWidget(venueTitle, venueText),
            Container(
              margin: EdgeInsets.fromLTRB(24,0,20,0),
              child: venueContent,
            ),
            myDivider,
            buildTitleWidget(accomodationsTitle, accomodationsText),
            Container(
              margin: EdgeInsets.fromLTRB(24,0,20,0),
              child: accomodationsContent,
            ),
            myDivider,
            sponsorTitle,
            sponsorSection,
          ],
        ),
      ),
    );
  }


  _launchURL() async {
    const url = "https://www.glassart.org/conference/berlin-2024/";
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  Column _buildButtonColumn(Color color, IconData icon, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: color),
        Container(
          margin: const EdgeInsets.only(top: 8),
          child: Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: color,
            ),
          ),
        ),
      ],
    );
  }

  void _navigateToScheduleScreen(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => ScheduleScreen(
        images:images,
    )));
  }

  void _navigateToLocationScreen(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => LocationScreen()));
  }

  void _navigateToInfoScreen(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => InfoScreen()));
  }

  void _navigateToUpdateScreen(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => UpdateScreen()));
  }

}
