import 'dart:async';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:multiselect/multiselect.dart';
import '../data/talks.dart';
import './talk_screen.dart';
import '../main.dart';

class ScheduleScreen extends StatelessWidget {
  final List<SpeakerImage> images;

  // Sort talks by datetime
  final sortedTalksAsc = Day1.map((talk) => talk).toList()
    ..sort((a, b) => a.talkStartDateTime.compareTo(b.talkStartDateTime));

  ScheduleScreen({required this.images});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
              iconTheme: IconThemeData(
                color: Colors.white, //change your color here
              ),
              title: const Text('SCHEDULE', style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.w500,
              )),
              backgroundColor: primaryColor),
      body: SingleChildScrollView(
        child:
          ExpansionTileExample(
            images:images,
          ),
      ),
    );
  }
}

class ExpansionTileExample extends StatefulWidget {

  final List<SpeakerImage> images;
  ExpansionTileExample({required this.images});

  @override
  State<ExpansionTileExample> createState() => _ExpansionTileExampleState(
    images: images,
  );

}

class _ExpansionTileExampleState extends State<ExpansionTileExample> {
  final List<SpeakerImage> images;
  _ExpansionTileExampleState({required this.images});

  List<TalkTitleItem> _sortedTalksFiltered = Day1.map((talk) => talk).toList()
    ..sort((a, b) => a.talkStartDateTime.compareTo(b.talkStartDateTime));

  // Function to filter list of talks
  // TODO <-- Have to figure out a better way to present this; overflow right now
  void _filterSortedTalks() {

    setState(() {
      // Grab full list
      List<TalkTitleItem> sortedTalksAsc = Day1.map((talk) => talk).toList()
        ..sort((a, b) => a.talkStartDateTime.compareTo(b.talkStartDateTime));

      // Saved Talks Only
      _sortedTalksFiltered = sortedTalksAsc.where((map)
      => map.talkSaved == savedOnly).toList();

      // Focus of Talk Only
      if (selectedTypeFilters.length > 0) {
        List<String> selectedTypeFiltersLower = selectedTypeFilters.map((type)=>type.toLowerCase()).toList();
        _sortedTalksFiltered = _sortedTalksFiltered.where((map) =>
            selectedTypeFiltersLower.contains(map.talkType.toLowerCase())).toList();
      }

      // Location Filter - fix me, just adjust the list
      if (selectedLocationFilters.length > 0) {
        List<String> LocFilters = [];
        for (var item in selectedLocationFilters) {
          if (item == "Wilhelm") {
            List<String> Wilhelm = ["Wilhelm Hallen Lecture",
              "Wilhelm Hallen Main Stage", "Wilhelm Hallen Panel",
              "Wilhelm Hallen Cold Shop", "Wilhelm Hallen"
            ];
            LocFilters.addAll(Wilhelm);
          }
          if (item == "Berlin Glas") {
            LocFilters.add("Berlin Glas");
            LocFilters.add("Berlin Glas Lecmo");
            LocFilters.add("Berlin Glas");
          }
          if (item == "Monopol") {
            LocFilters.add("Monopol Flame Shop");
            LocFilters.add("Monopol Lecmo");
          }
        }
        print(LocFilters);
        _sortedTalksFiltered = _sortedTalksFiltered.where((map) =>
            LocFilters.contains(map.talkLocation)).toList();
      }

    });
  }

  FutureOr onGoBack(dynamic value) {
    setState(() {});
  }

  List<String> talkTypeFilters = ['Demo','Lecmo','Lecture','Panel','Performance', 'Workshop'];

  List<String> talkTopicFilters = ['HOT','FLAME','COLD','NEON','KILN','MOLD',
                                'HISTORY','SOCIAL JUSTICE','CAREER','COMMUNITY',
                                  'TECHNOLOGY','EDUCATION','SUSTAINABILITY','OTHER'];

  List<String> talkLocationFilters = ['Wilhelm','Berlin Glas','Monopol','Bard'];

  /*List<String> talkLocationFilters = ['Berlin Glas','Monopol','Wilhelm Hallen',
                                'Film Fest','Conference Hotel'];*/

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
    (days[dateOnly(talk.talkStartDateTime)] ??= []).add(talk);
  }
  var keys = days.keys.toList();

  return Column(
      children: <Widget>[
      Row (
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
          height:40,
          width: 160,
          alignment: Alignment.topLeft,
          //width: MediaQuery.of(context).size.width,
          margin: EdgeInsets.fromLTRB(0,10,10,10),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(50),
            ),
            child: DropDownMultiSelect(
            //selected_values_style: TextStyle(color: Colors.white),
            whenEmpty: 'Type',
            options: talkTypeFilters,
            selectedValues: selectedTypeFilters,
            onChanged: (value) {
              setState(() {
                selectedTypeFilters = value;
                _filterSortedTalks();
              });
            },
          ),
            ),
          ),
          Container(
            height:40,
            width: 120,
            alignment: Alignment.topLeft,
            //width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.fromLTRB(0,10,0,10),

            child: DropDownMultiSelect(
              whenEmpty: 'Site',
              options: talkLocationFilters,
              selectedValues: selectedLocationFilters,
              onChanged: (value) {
                setState(() {
                  selectedLocationFilters = value;
                  _filterSortedTalks();
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
                    _filterSortedTalks();
                  });
                },
              ),
            ],
          ),
      ],
      ),

        ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (context, i) {
          var dayItems = days[keys[i]];
          if(i >= days.length) return null;
          if (dayItems == null) return null;
          return ExpansionTile(
              title: Text(DateFormat('EEEE, LLLL d').format(keys[i]),
                style: TextStyle(fontWeight: FontWeight.bold,
                fontSize: 16,)
              ),
              children:
              <Widget>[
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
                      onTap: () { Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => TalkScreen(
                              item:item,
                              images:images,
                          ))).then(onGoBack);
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
                            isSelected: item.talkSaved,
                            icon: const Icon(Icons.star_border_outlined),
                            selectedIcon: const Icon(Icons.star),
                            onPressed: () {
                              setState(() {
                                item.switchSaved(context);
                              });
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

class IconButtonExample extends StatefulWidget {
  //const IconButtonExample({super.key});
  final TalkTitleItem item;
  const IconButtonExample({super.key, required this.item});

  @override
  State<IconButtonExample> createState() => _IconButtonExampleState(
    item: item,
  );
}

class _IconButtonExampleState extends State<IconButtonExample> {
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
            setState(() {
              item.switchSaved(context);
            });
          },
        ),
      ],
    );
  }
}