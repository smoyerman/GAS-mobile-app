import 'dart:async';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:multiselect/multiselect.dart';
import '../data/talks.dart';
import './talk_screen.dart';
import '../main.dart';
//import 'package:flutter/widgets.dart';

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
        _sortedTalksFiltered = _sortedTalksFiltered.where((map) =>
            selectedTypeFilters.contains(map.talkType)).toList();
      }

      // Topic of Talk Only
      if (selectedTopicFilters.length > 0) {
        _sortedTalksFiltered = _sortedTalksFiltered.where((map) =>
            selectedTopicFilters.contains(map.talkFocus)).toList();
      }

      // Location Filter

    });
  }

  FutureOr onGoBack(dynamic value) {
    setState(() {});
  }

  List<String> talkTypeFilters = ['DEMO','LECMO','LECTURE','PANEL','PERFORMANCE',
                              'WORKSHOP','OTHER'];

  List<String> talkTopicFilters = ['HOT','FLAME','COLD','NEON','KILN','MOLD',
                                'HISTORY','SOCIAL JUSTICE','CAREER','COMMUNITY',
                                  'TECHNOLOGY','EDUCATION','SUSTAINABILITY','OTHER'];

  List<String> talkLocationFilters = ['Berlin Glas','Monopol','Wilhelm Hallen',
                                'Film Fest','Conference Hotel'];

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
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          //SizedBox(width: 30),
          /*Text("Filter: ",
              style: TextStyle(fontWeight: FontWeight.bold,
              fontSize: 16,)),*/

          SizedBox(width: 10),
          Container(
          height:40,
          width: 100,
          alignment: Alignment.topLeft,
          //width: MediaQuery.of(context).size.width,
          margin: EdgeInsets.fromLTRB(0,10,40,10),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(50)),

            child: Theme(
              data: Theme.of(context).copyWith(
                canvasColor: Colors.black,
                textTheme: const TextTheme(
                  displayMedium: TextStyle(
                    fontSize: 72,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              child: DropDownMultiSelect(
            whenEmpty: 'TYPE',
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

        Row (
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
          Container(
            height:30,
            width: 200,
            alignment: Alignment.topLeft,
            //width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.fromLTRB(0,10,40,10),

            child: DropDownMultiSelect(
              whenEmpty: 'FOCUS',
              options: talkTopicFilters,
              selectedValues: selectedTopicFilters,
              onChanged: (value) {
                setState(() {
                  selectedTopicFilters = value;
                  _filterSortedTalks();
                });
              },
            ),
          ),

    ]),

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
    ] );
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