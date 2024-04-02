import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:layout/screens/schedule_screen.dart';
import 'package:url_launcher/url_launcher.dart';
import '../main.dart';
import 'package:carousel_slider/carousel_slider.dart';

class TalkScreen extends StatefulWidget {

  final List<SpeakerImage> images;
  final TalkTitleItem item;
  TalkScreen({required this.images, required this.item});

  @override
  State<TalkScreen> createState() => _TalkScreenState(
    images: images,
    item:item,
  );
}

class _TalkScreenState extends State<TalkScreen> {
  final List<SpeakerImage> images;
  final TalkTitleItem item;
  _TalkScreenState({required this.item, required this.images});

  @override
  Widget build(BuildContext context) {
    final allImageLinks = images.map((i) => i.imageLink).toList();
    final imageLinks = allImageLinks.where((map)
                        => map.contains(item.returnSpeaker(context))).toList();

    Widget textSection = Container(
      padding: const EdgeInsets.fromLTRB(32,12,0,0),
      child: item.buildDescription(context),
    );

    //Navigator.of(context).pop(item);

    return Scaffold(
        appBar: AppBar(
            iconTheme: IconThemeData(
              color: Colors.white, //change your color here
            ),
            title: const Text('TALK INFO', style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.w500,
            )),
            backgroundColor: primaryColor),
        body: ListView(
          children: [
            CarouselSlider(
            options: CarouselOptions(),
            items: imageLinks
              .map((item) => Container(
            child: Center(
                child:
                Image.asset(item, fit: BoxFit.cover, width: 1000)),
            ))
              .toList(),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(32,32,32,0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  item.buildTalkHeader(context),
                  // TODO: Fix update of state persistence between screens
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
                ],
              ),
            ),
            textSection
          ],
        ),
      );
  }

}