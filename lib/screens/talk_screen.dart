import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
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
    if(imageLinks.isEmpty){
      final imageLinks = allImageLinks.where((map)
        => map.contains(item.returnSpeaker(context).split(" ")[0])).toList();
    }

      Widget textSection = Container(
      padding: const EdgeInsets.fromLTRB(32,12,0,0),
      child: item.buildDescription(context),
    );

    print(imageLinks);

    // #docregion Card
    Widget _buildCard() {
      return SizedBox(
          width: MediaQuery.of(context).size.width * 0.9,
              child: ListTile(
                title: RichText(
                    text: TextSpan(
                  text: item.talkSpeaker,
                  style: new TextStyle(color: item.website.isNotEmpty ? Colors.blue : Colors.black,
                      fontWeight: FontWeight.w500,
                      fontSize: 16),
                  recognizer: new TapGestureRecognizer()
                    ..onTap = () { if (item.website.isNotEmpty) { launch(item.website); }
                    },
                )),
                subtitle: Text(DateFormat('EEEE LLLL d - HH:mm-').format(item.talkStartDateTime) +
                    DateFormat('HH:mm').format(item.talkEndDateTime)),


                leading: IconButton(
                    icon: FaIcon(FontAwesomeIcons.instagram, size: 20,
                        color: item.socialMedia.isNotEmpty ? Colors.blue : Colors.black),
                    onPressed: () async {
                      if (item.socialMedia.isNotEmpty) {
                        var nativeUrl = "instagram://user?username=" + item.socialMedia;
                        var webUrl = "https://www.instagram.com/" + item.socialMedia;
                        if (await canLaunch(nativeUrl)) {
                          await launch(nativeUrl);
                        } else if (await canLaunch(webUrl)) {
                          await launch(webUrl);
                        } else {
                          print("can't open Instagram");
                        }
                      }}
                ),
              ),
        );
    }
    // #enddocregion Card

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
              padding: const EdgeInsets.fromLTRB(32, 18, 20, 4),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                      child: Text(item.talkTitle,
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                      )
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
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
                  )
                ],
              ),
            ),
            Center(child: _buildCard()),

            textSection
          ],
        ),
    );
  }

}