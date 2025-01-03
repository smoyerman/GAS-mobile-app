import 'dart:async';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:multiselect/multiselect.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../data/talks.dart';
import './talk_screen.dart';
import '../main.dart';
import '../services/database_service.dart';
import '../data_structures.dart';

class ScheduleScreen extends StatelessWidget {
  final List<SpeakerImage> images;
  final SharedPreferences sharedPreferences;
  //final QuerySnapshot querySnapshot;
  final List<TalkTitleItem> sortedTalksAsc;

  ScheduleScreen(
      {required this.images,
      required this.sharedPreferences,
      required this.sortedTalksAsc});

  // Sort talks by datetime
  /*List<TalkTitleItem> Day1 = querySnapshot.docs.map((doc) => doc.data() as TalkTitleItem).toList();
  final sortedTalksAsc = Day1.map((talk) => talk).toList()
    ..sort((a, b) => a.talkStartDateTime.compareTo(b.talkStartDateTime));*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          iconTheme: IconThemeData(
            color: Colors.white, //change your color here
          ),
          title: const Text('SCHEDULE',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.w500,
              )),
          backgroundColor: primaryColor),
      body: SingleChildScrollView(
        child: ExpansionTileExample(
          images: images,
          sharedPreferences: sharedPreferences,
          sortedTalksAsc: sortedTalksAsc,
        ),
      ),
    );
  }
}

class ExpansionTileExample extends StatefulWidget {
  final List<SpeakerImage> images;
  final SharedPreferences sharedPreferences;
  final List<TalkTitleItem> sortedTalksAsc;

  ExpansionTileExample(
      {required this.images,
      required this.sharedPreferences,
      required this.sortedTalksAsc});

  @override
  State<ExpansionTileExample> createState() => _ExpansionTileExampleState(
        images: images,
        sharedPreferences: sharedPreferences,
        sortedTalksAsc: sortedTalksAsc,
      );
}

class _ExpansionTileExampleState extends State<ExpansionTileExample> {
  final List<SpeakerImage> images;
  final SharedPreferences sharedPreferences;
  final List<TalkTitleItem> sortedTalksAsc;
  late List<TalkTitleItem> _sortedTalksFiltered;

  _ExpansionTileExampleState({
    required this.images,
    required this.sharedPreferences,
    required this.sortedTalksAsc,
  }) {
    _sortedTalksFiltered = List.from(sortedTalksAsc);
  }

  //var _sortedTalksFiltered = sortedTalksAsc.map((v) => v).toList();

  //List<TalkTitleItem> _sortedTalksFiltered = sortedTalksAsc;

  /*Day1.map((talk) => talk).toList()
    ..sort((a, b) => a.talkStartDateTime.compareTo(b.talkStartDateTime));*/

  // Function to filter list of talks
  void _filterSortedTalks(sortedTalksAsc) {
    setState(() {
      // Grab full list
      /*List<TalkTitleItem> sortedTalksAsc = Day1.map((talk) => talk).toList()
        ..sort((a, b) => a.talkStartDateTime.compareTo(b.talkStartDateTime));*/
      // Get my filters right... sheesh this is a mess I need to cross check everywhere
      for (var talk in sortedTalksAsc) {
        if (sharedPreferences.getBool(talk.talkSpeaker) != null) {
          talk.talkSaved = sharedPreferences.getBool(talk.talkSpeaker)!;
        }
      }

      // Saved Talks Only
      if (savedOnly) {
        _sortedTalksFiltered =
            sortedTalksAsc.where((map) => map.talkSaved == savedOnly).toList();
      } else {
        _sortedTalksFiltered = sortedTalksAsc;
      }

      // Focus of Talk Only
      if (selectedTypeFilters.length > 0) {
        List<String> selectedTypeFiltersLower =
            selectedTypeFilters.map((type) => type.toLowerCase()).toList();
        _sortedTalksFiltered = _sortedTalksFiltered
            .where((map) =>
                selectedTypeFiltersLower.contains(map.talkType.toLowerCase()))
            .toList();
      }

      // Location Filter - fix me, just adjust the list
      if (selectedLocationFilters.length > 0) {
        List<String> LocFilters = [];
        for (var item in selectedLocationFilters) {
          if (item == "Wilhelm") {
            List<String> Wilhelm = [
              "Wilhelm Hallen Main Stage",
              "Wilhelm Hallen Panel",
              "Wilhelm Hallen Cold Shop",
              "Wilhelm Hallen",
              "Wilhelm Hallen Flame Shop"
            ];
            LocFilters.addAll(Wilhelm);
          }
          if (item == "Berlin Glas") {
            LocFilters.add("Berlin Glas");
            LocFilters.add("Berlin Glas Lecmo");
            LocFilters.add("Berlin Glas");
          }
          if (item == "Provinzstraße") {
            LocFilters.add("Provinstrase Lecture");
          }
          if (item == "Green Pav") {
            LocFilters.add("Green Pavilion");
          }
          if (item == "Niesen") {
            LocFilters.add("Niesen Furnaces");
          }
        }
        _sortedTalksFiltered = _sortedTalksFiltered
            .where((map) => LocFilters.contains(map.talkLocation))
            .toList();
      }
    });
  }

  FutureOr onGoBack(dynamic value) {
    setState(() {});
  }

  List<String> talkTypeFilters = [
    'Demo',
    'Lecmo',
    'Lecture',
    'Panel',
    'Performance',
    'Workshop'
  ];

  List<String> talkTopicFilters = [
    'HOT',
    'FLAME',
    'COLD',
    'NEON',
    'KILN',
    'MOLD',
    'HISTORY',
    'SOCIAL JUSTICE',
    'CAREER',
    'COMMUNITY',
    'TECHNOLOGY',
    'EDUCATION',
    'SUSTAINABILITY',
    'OTHER'
  ];

  List<String> talkLocationFilters = [
    'Wilhelm',
    'Berlin Glas',
    'Provinzstraße',
    'Green Pav',
    'Niesen'
  ];

  List<String> selectedTypeFilters = [];
  List<String> selectedTopicFilters = [];
  List<String> selectedLocationFilters = [];
  bool savedOnly = false;

  @override
  Widget build(BuildContext context) {
    // Return keyed Map of talks by date
    DateTime dateOnly(DateTime dateTime) {
      return DateTime(dateTime.year, dateTime.month, dateTime.day);
    }

    var days = <DateTime, List<TalkTitleItem>>{};
    for (var talk in _sortedTalksFiltered) {
      // STEPH!!!! Why no workie?!
      if (sharedPreferences.getBool(talk.talkSpeaker) != null) {
        talk.talkSaved = sharedPreferences.getBool(talk.talkSpeaker)!;
      }
      (days[dateOnly(talk.talkStartDateTime)] ??= []).add(talk);
    }
    var keys = days.keys.toList();

    return Column(children: <Widget>[
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SizedBox(width: 20),
          DefaultTextStyle.merge(
            style: TextStyle(
                //color: Colors.grey[400],
                //fontSize: 10,
                ),
            child: Container(
              height: 40,
              width: 140,
              alignment: Alignment.topLeft,
              //width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.fromLTRB(0, 10, 10, 10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(50),
              ),
              child: DropDownMultiSelect(
                //selected_values_style: TextStyle(color: Colors.white),
                whenEmpty: 'Type',
                options: talkTypeFilters,
                selectedValues: selectedTypeFilters,
                onChanged: (value) {
                  setState(() {
                    selectedTypeFilters = value;
                    _filterSortedTalks(sortedTalksAsc);
                  });
                },
              ),
            ),
          ),
          Container(
            height: 40,
            width: 150,
            alignment: Alignment.topLeft,
            //width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.fromLTRB(0, 10, 0, 10),

            child: DropDownMultiSelect(
              whenEmpty: 'Site',
              options: talkLocationFilters,
              selectedValues: selectedLocationFilters,
              onChanged: (value) {
                setState(() {
                  selectedLocationFilters = value;
                  _filterSortedTalks(sortedTalksAsc);
                });
              },
            ),
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              IconButton(
                isSelected: savedOnly,
                icon: const Icon(Icons.star_border_outlined),
                selectedIcon: const Icon(Icons.star),
                onPressed: () {
                  setState(() {
                    savedOnly = !savedOnly;
                    _filterSortedTalks(sortedTalksAsc);
                  });
                },
              ),
            ],
          ),
        ],
      ),
      //presentersListView,
      ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (context, i) {
          var dayItems = days[keys[i]];
          if (i >= days.length) return null;
          if (dayItems == null) return null;
          return ExpansionTile(
            title: Text(DateFormat('EEEE, LLLL d').format(keys[i]),
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                )),
            children: <Widget>[
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                // Let the ListView know how many items it needs to build.
                itemCount: dayItems.length,
                // Provide a builder function. This is where the magic happens.
                // Convert each item into a widget based on the type of item it is.
                itemBuilder: (context, index) {
                  final item = dayItems[index];
                  bool isSaved = item.returnSaved(context);
                  return ListTile(
                    onTap: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(
                              builder: (context) => TalkScreen(
                                    item: item,
                                    images: images,
                                    sharedPreferences: sharedPreferences,
                                  )))
                          .then(onGoBack);
                    },
                    shape: RoundedRectangleBorder(
                      side: BorderSide(color: Colors.black, width: 0.4),
                      //borderRadius: BorderRadius.circular(5),
                    ),
                    leading: item.buildStartTime(context),
                    title: item.buildTitle(context),
                    subtitle: item.buildSpeakerCard(context),
                    trailing: //IconButtonExample(item: item),
                        Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        IconButton(
                          isSelected: null ==
                                  sharedPreferences.getBool(item.talkSpeaker)
                              ? item.talkSaved
                              : sharedPreferences.getBool(item.talkSpeaker),
                          icon: const Icon(Icons.star_border_outlined),
                          selectedIcon: const Icon(Icons.star),
                          onPressed: () async {
                            setState(() {
                              item.switchSaved(context);
                            });
                            await sharedPreferences.setBool(
                                item.talkSpeaker, item.talkSaved);
                          },
                        ),
                      ],
                    ),
                    // TODO: Add Border or better separation between cards
                  );
                },
              ),
            ],
          );
        },
        itemCount: days.length,
      ),
    ]);
  }
}

/*class IconButtonExample extends StatefulWidget {
  //const IconButtonExample({super.key});
  final TalkTitleItem item;
  const IconButtonExample({super.key, required this.item});

  @override
  State<IconButtonExample> createState() => _IconButtonExampleState(
    item: item,
  );
}*/

/*class _IconButtonExampleState extends State<IconButtonExample> {
  final TalkTitleItem item;
  _IconButtonExampleState({required this.item});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        IconButton(
          isSelected: item.talkSaved,
          icon: const Icon(Icons.star_border_outlined),
          selectedIcon: const Icon(Icons.star),
          onPressed: () {
            setState(() async {
              item.switchSaved(context);
              try {sharedPreferences.getBool(item.talkSpeaker);}
              catch (e) {await sharedPreferences.setBool(item.talkSpeaker, item.talkSaved);}
            });
          },
        ),
      ],
    );
  }
}*/