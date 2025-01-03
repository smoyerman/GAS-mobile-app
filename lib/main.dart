import 'dart:convert';
import 'dart:ui';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:layout/data_structures.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/foundation.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:rxdart/rxdart.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'firebase_options.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'globals.dart';
import './data/conference.dart';
import 'services/database_service.dart';
import './screens/schedule_screen.dart';
import './screens/location_screen.dart';
import './screens/info_screen.dart';
import './screens/update_screen.dart';

// Uncomment lines 3 and 6 to view the visual layout at runtime.
// import 'package:flutter/rendering.dart' show debugPaintSizeEnabled;

/************* CLASS CONSTRUCTION TO ADD SPONSOR PHOTO ITEMS ***************/
class PhotoItem {
  final String image;
  final String name;
  final String website;
  PhotoItem(this.image, this.name, this.website);
}

class MarketItem {
  final String image;
  final String name;
  final String website;
  final String contact;
  final String email;
  final String ig;
  MarketItem(
      this.image, this.name, this.website, this.contact, this.email, this.ig);
}

/************* CLASS CONSTRUCTION TO ADD SPEAKER IMAGE LIST ***************/
class SpeakerImage {
  final String imageLink;
  const SpeakerImage(this.imageLink);
}

abstract class EventItem {
  Widget buildEventDescription(BuildContext context);
}

class BuildEventItem implements EventItem {
  final DateTime eventStartDateTime;
  final DateTime eventEndDateTime;
  final String eventTitle;
  final String eventLocation;
  final String eventInclusion;
  final String eventDescription;

  BuildEventItem(
      this.eventStartDateTime,
      this.eventEndDateTime,
      this.eventTitle,
      this.eventLocation,
      this.eventInclusion,
      this.eventDescription);

  @override
  Widget buildEventDescription(BuildContext context) {
    return Text(
      eventLocation,
      style: TextStyle(
        color: Colors.grey[500],
      ),
    );
  }
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

// used to pass messages from event handler to the UI
final _messageStreamController = BehaviorSubject<RemoteMessage>();
FirebaseAnalytics analytics = FirebaseAnalytics.instance;

const primaryColor = Colors.blue;
const headerTextColor = Colors.white;

Future<void> _updateSharedPreferences(
    SharedPreferences sharedPreferences, RemoteMessage message) async {
  // read the old lists, append data, and create new lists
  final formerMessageTitleList =
      sharedPreferences.getStringList('messageTitle');
  final formerMessageBodyList = sharedPreferences.getStringList('messageBody');
  final formerMessageTimeList =
      sharedPreferences.getStringList('messageSentTime');

  // append the new data to it
  formerMessageTitleList?.add("${message.notification?.title}");
  formerMessageBodyList?.add("${message.notification?.body}");
  formerMessageTimeList?.add(
      DateFormat('EEEE LLLL d - HH:mm').format(message.sentTime! as DateTime));

  // and save the new list back to storage
  await sharedPreferences.setStringList(
      'messageTitle', formerMessageTitleList!);
  await sharedPreferences.setStringList('messageBody', formerMessageBodyList!);
  await sharedPreferences.setStringList(
      'messageSentTime', formerMessageTimeList!);

  if (kDebugMode) {
    final List<String>? items = sharedPreferences.getStringList('messageTitle');
    print(items);
  }
}

@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message,
    {SharedPreferences? sharedPreferences}) async {
  print("call pattern works");
  //await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  // Initialize the app
  //await Firebase.initializeApp(
  //  options: DefaultFirebaseOptions.currentPlatform,
  //);
  //await Future.delayed(Duration(seconds: 1));

  //await setupFlutterNotifications();
  //showFlutterNotification(message);

  print("Handling a background message: ${message.messageId}");
  print('Message data: ${message.data}');
  print('Message notification: ${message.notification?.title}');
  print('Message notification: ${message.notification?.body}');

  // Store everything!
  //_messageStreamController.sink.add(message);
  _updateSharedPreferences(sharedPreferences!, message);
}

/// Create a [AndroidNotificationChannel] for heads up notifications
late AndroidNotificationChannel channel;
bool isFlutterLocalNotificationsInitialized = false;

late FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;
Future<void> main() async {
  // Put me FIRST unless you want everything to hang forever - have to bind first
  WidgetsFlutterBinding.ensureInitialized();

  // Obtain shared preferences for logging messages.
  final SharedPreferences sharedPreferences =
      await SharedPreferences.getInstance();

  // Init shared preferences; ensuring there's none from before
  if (sharedPreferences.getStringList('messageTitle') == null) {
    await sharedPreferences.setStringList('messageTitle', <String>[]);
  }

  if (sharedPreferences.getStringList('messageBody') == null) {
    await sharedPreferences.setStringList('messageBody', <String>[]);
  }

  if (sharedPreferences.getStringList('messageSentTime') == null) {
    await sharedPreferences.setStringList('messageSentTime', <String>[]);
  }

  // Initialize the app
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FirebaseFirestore.instance.settings = const Settings(
    persistenceEnabled: true,
  );
  await Future.delayed(Duration(seconds: 1));

  final messaging = FirebaseMessaging.instance;
  final manifestJson = await rootBundle.loadString('AssetManifest.json');
  final imageList = json
      .decode(manifestJson)
      .keys
      .where((String key) => key.startsWith('images/TalkImages'));

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

  const vapidKey =
      "BP74mvWwrdoIAtnc52k2lQYY4xrnsKfr-xhYBMgeG4ROmZi9bNIubaenBrKDyWCXAt8x3dK5s77c_6aerBnEWcs";

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
      print('${message.contentAvailable}');
      print('Message notification: ${message.notification?.title}');
      print('Message notification: ${message.notification?.body}');
    }

    //_messageStreamController.sink.add(message);
    _updateSharedPreferences(sharedPreferences, message);
  });

  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  var db = FirebaseFirestore.instance;
  final presentations = db.collection('presentations_2025').withConverter(
        fromFirestore: (snapshot, _) =>
            TalkTitleItem.fromJson(snapshot.data()!),
        toFirestore: (talkTitleItem, _) => talkTitleItem.toJson(),
      );
  QuerySnapshot querySnapshot = await presentations.get();

  List<TalkTitleItem> presentationList =
      querySnapshot.docs.map((doc) => doc.data() as TalkTitleItem).toList();

  final sortedTalksAsc = presentationList.map((talk) => talk).toList()
    ..sort((a, b) => a.talkStartDateTime.compareTo(b.talkStartDateTime));

  //print(sortedTalksAsc);

  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Passing Data',
      home: MyApp(
        images: List<SpeakerImage>.from(
            imageList.map((s) => SpeakerImage(s)).toList()),
        sharedPreferences: sharedPreferences,
        sortedTalksAsc: sortedTalksAsc,
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  final List<SpeakerImage> images;
  final SharedPreferences sharedPreferences;
  //final List<TalkTitleItem> Day1;
  final List<TalkTitleItem> sortedTalksAsc;
  MyApp(
      {super.key,
      required this.images,
      required this.sharedPreferences,
      required this.sortedTalksAsc});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: APP_TITLE,
      theme: ThemeData(
        colorSchemeSeed: const Color(0xff6750a4),
        useMaterial3: true,
      ),
      home: MyHomePage(
        title: APP_TITLE,
        images: images,
        sharedPreferences: sharedPreferences,
        sortedTalksAsc: sortedTalksAsc,
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final List<SpeakerImage> images;
  final SharedPreferences sharedPreferences;
  final String title;
  final List<TalkTitleItem> sortedTalksAsc;

  const MyHomePage(
      {super.key,
      required this.title,
      required this.images,
      required this.sharedPreferences,
      required this.sortedTalksAsc});

  @override
  State<MyHomePage> createState() => _MyHomePageState(
        images: images,
        sharedPreferences: sharedPreferences,
        sortedTalksAsc: sortedTalksAsc,
      );
}

class _MyHomePageState extends State<MyHomePage> {
  String _lastMessage = "";
  final List<SpeakerImage> images;
  List<String> imagePaths = [];
  final SharedPreferences sharedPreferences;
  final List<TalkTitleItem> sortedTalksAsc;

  // STEPH TODO: get rid of this and make the string to log
  _MyHomePageState(
      {required this.images,
      required this.sharedPreferences,
      required this.sortedTalksAsc}) {
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

  Future<void> setupInteractedMessage() async {
    // Get any messages which caused the application to open from
    // a terminated state.
    RemoteMessage? initialMessage =
        await FirebaseMessaging.instance.getInitialMessage();

    // If the message also contains a data property with a "type" of "chat",
    // navigate to a chat screen
    if (initialMessage != null) {
      _handleMessage(initialMessage);
    }

    // Also handle any interaction when the app is in the background via a
    // Stream listener
    FirebaseMessaging.onMessageOpenedApp.listen(_handleMessage);

    // Perhaps open to messages?!
  }

  void _handleMessage(RemoteMessage message) {
    print("----------- CLICKED REMOTE MESSAGE! SAVING! -----------");
    _updateSharedPreferences(sharedPreferences, message);
  }

  @override
  void initState() {
    super.initState();

    // Run code required to handle interacted messages in an async function
    // as initState() must not be async
    setupInteractedMessage();
  }

  @override
  Widget build(BuildContext context) {
    Widget titleSection = Container(
      padding: const EdgeInsets.all(24),
      child: Row(
        children: [
          Expanded(
            /*1*/
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  CONF_TAGLINE,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  CONF_DATES,
                  style: TextStyle(
                    //fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                    color: Colors.grey[600],
                  ),
                ),
                Text(
                  CONF_LOC,
                  style: TextStyle(
                    fontStyle: FontStyle.italic,
                    color: Colors.grey[600],
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
          buildButtonColumn(Icons.info_outlined, 'EVENTS', () {
            _navigateToInfoScreen(context);
          }),
          buildButtonColumn(Icons.calendar_month, 'SESSIONS', () {
            _navigateToScheduleScreen(context);
          }),
          buildButtonColumn(Icons.map_outlined, 'LOCATIONS', () {
            _navigateToLocationScreen(context);
          }),
          buildButtonColumn(Icons.info_outlined, 'UPDATES', () {
            _navigateToUpdateScreen(context);
          }),
        ],
      ),
    );

    Widget textSection = Container(
      padding: const EdgeInsets.fromLTRB(32, 20, 32, 0),
      child: const Text(
        CONF_DESC,
        softWrap: true,
      ),
    );

    Widget registrationSection = Container(
      padding: const EdgeInsets.fromLTRB(32, 0, 32, 0),
      child: RichText(
        text: TextSpan(
          style: Theme.of(context).textTheme.titleLarge,
          children: [
            const TextSpan(
              text: 'REGISTRATION\n\n',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
            ),
            const TextSpan(
              text: 'Wilhelm Hallen Main Hall\n',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
            const TextSpan(
              text: '15 - 18 May  |  09:00 – 12:30 + 13:30 – 17:00\n\n',
              style: TextStyle(
                fontSize: 14,
              ),
            ),
            const TextSpan(
              text: '*Only open until 16:00 on Wed, 15 May\n\n',
              style: TextStyle(
                fontSize: 14,
              ),
            ),
            TextSpan(
              text: 'In addition to registration, the same site '
                  'will host Info, T-Shirt Sales, the Educational Resource Center, '
                  'Lounge and Charging Station, Goblet Grab Drop Off, and GAS Market '
                  'every day of the conference.',
              style: TextStyle(fontSize: 14),
            ),
          ],
        ),
      ),
    );

    buildTitleWidget(titleText, subtitleText) {
      return Container(
        padding: const EdgeInsets.fromLTRB(32, 0, 32, 0),
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
    }

    ;

    Widget accomodationsContent = Column(children: <Widget>[
      Container(
        child: ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: HotelLocations.length,
          itemBuilder: (ctx, index) {
            return ExpansionTile(
              leading: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.asset(
                    HotelLocations[index]["logo"],
                    width: 50,
                    fit: BoxFit.fitWidth,
                  ),
                ],
              ),
              title: Text(
                HotelLocations[index]["title"],
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              subtitle: Text(HotelLocations[index]["address"]),
              children: <Widget>[
                ListTile(
                    dense: true,
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 30.0, vertical: -10.0),
                    visualDensity: VisualDensity(horizontal: 0, vertical: -4),
                    title: Text(
                      HotelLocations[index]["blurb"],
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )),
              ],
            );
          },
        ),
      ),
    ]);

    Widget venueContent = Column(children: <Widget>[
      Container(
        child: ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: GASVenues.length,
          itemBuilder: (ctx, index) {
            return ExpansionTile(
              leading: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.asset(
                    GASVenues[index]["logo"],
                    width: 50,
                    fit: BoxFit.fitWidth,
                  ),
                ],
              ),
              title: Text(
                GASVenues[index]["title"],
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
              ),
              subtitle: Text(GASVenues[index]["address"]),
              children: <Widget>[
                ListTile(
                    dense: true,
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 30.0, vertical: -10.0),
                    visualDensity: VisualDensity(horizontal: 0, vertical: -4),
                    title: Text('Activities at this venue:',
                        style: TextStyle(fontSize: 14)),
                    subtitle: Text(
                      '\n   • ' +
                          GASVenues[index]["activities"].join('\n   • '),
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )),
              ],
            );
          },
        ),
      ),
    ]);

    Widget sponsorTitle = Container(
      padding: const EdgeInsets.fromLTRB(32, 0, 32, 0),
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

    Widget educationSponsorTitle = Container(
      padding: const EdgeInsets.fromLTRB(32, 0, 32, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /*2*/
          Container(
            padding: const EdgeInsets.only(bottom: 8),
            child: const Text(
              'CONFERENCE SUPPORTERS\nEducation Programs and Classes',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );

    Widget educationSponsorSection = Container(
      padding: const EdgeInsets.fromLTRB(32, 0, 32, 0),
      child: RichText(
        text: TextSpan(
          style: Theme.of(context).textTheme.titleLarge,
          children: [
            const TextSpan(
              text: '\n',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
            ),
            const TextSpan(
              text: '   • Berlin Glas\n'
                  '   • Glass School in partnership with Warm Glass UK\n'
                  '   • Pilchuck Glass School\n'
                  '   • Pittsburgh Glass Center\n'
                  '   • Pratt Fine Arts Center\n'
                  '   • The Glass Furnace\n'
                  '   • The Studio at the Corning Museum of Glass\n'
                  '   • Tulsa Glassblowing School\n'
                  '   • Urban Glass\n\n',
              style: TextStyle(
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );

    Widget sponsorSection = Container(
      padding: const EdgeInsets.fromLTRB(32, 0, 32, 0),
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

    Widget myDivider = Divider(
        thickness: 2,
        color: Colors.blue,
        indent: 32,
        endIndent: 32,
        height: 50);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: APP_TITLE,
      theme: ThemeData(
        primaryColor: primaryColor,
      ),
      home: Scaffold(
        appBar: AppBar(
            iconTheme: IconThemeData(
              color: Colors.white, //change your color here
            ),
            title: const Text(APP_TITLE,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                )),
            elevation: 2,
            backgroundColor: primaryColor),
        body: ListView(
          padding: EdgeInsets.fromLTRB(0, 16, 0, 0),
          children: <Widget>[
            ImageHeader,
            titleSection,
            buttonSection,
            textSection,
            myDivider,
            registrationSection,
            myDivider,
            buildTitleWidget(venueTitle, venueText),
            Container(
              margin: EdgeInsets.fromLTRB(24, 0, 20, 0),
              child: venueContent,
            ),
            myDivider,
            buildTitleWidget(accomodationsTitle, accomodationsText),
            Container(
              margin: EdgeInsets.fromLTRB(24, 0, 20, 0),
              child: accomodationsContent,
            ),
            myDivider,
            buildTitleWidget(transportationTitle, transportationText),
            myDivider,
            sponsorTitle,
            sponsorSection,
            myDivider,
            educationSponsorTitle,
            educationSponsorSection,
          ],
        ),
      ),
    );
  }

  void _navigateToScheduleScreen(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => ScheduleScreen(
              images: images,
              sharedPreferences: sharedPreferences,
              sortedTalksAsc: sortedTalksAsc,
            )));
  }

  void _navigateToLocationScreen(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => LocationScreen()));
  }

  void _navigateToInfoScreen(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => InfoScreen()));
  }

  void _navigateToUpdateScreen(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => UpdateScreen(
              sharedPreferences: sharedPreferences,
            )));
  }
}
