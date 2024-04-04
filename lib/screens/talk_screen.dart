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

    //print('image links: ');
    //print(imageLinks);

      Widget textSection = Container(
      padding: const EdgeInsets.fromLTRB(32,12,0,0),
      child: item.buildDescription(context),
    );

    /*if (item.coPresenters.isNotEmpty) {
      final coPresenterNames = <String>[];
      final coPresenterIGs = <String>[];
      int counter = 0;
      for (var m in item.coPresenters.split(',')) {
        if ( counter % 2 == 0 ) {
          coPresenterNames.add(m.replaceAll('\(',''));
        }
        else {
          coPresenterIGs.add(m.replaceAll('\(',''));
        }
        counter++;
      }
      print(coPresenterNames);
    }*/

    Widget _buildCoPresenters() {
      final coPresenterNames = <String>[];
      final coPresenterIGs = <String>[];
      int counter = 0;
      for (var m in item.coPresenters.split(',')) {
        if ( counter % 2 == 0 ) { coPresenterNames.add(m.replaceAll('\(','').trim()); }
        else { coPresenterIGs.add(m.replaceAll('\(','')); }
        counter++;
      }

      return SizedBox(
          width: MediaQuery.of(context).size.width * 0.9,
          child: ListView.builder (
          shrinkWrap: true,
          itemCount: coPresenterNames.length,
              itemBuilder: (BuildContext ctxt, int Index) {
                return RichText(
                  text: TextSpan(
                    children: [
                      WidgetSpan(
                        alignment: PlaceholderAlignment.middle,
                        child: IconButton(
                            icon: FaIcon(FontAwesomeIcons.instagram, size: 20,
                                color: coPresenterIGs[Index].isNotEmpty ? Colors.blue : Colors.black),
                            onPressed: () async {
                              if (coPresenterIGs[Index].isNotEmpty) {
                                var nativeUrl = "instagram://user?username=" + coPresenterIGs[Index];
                                var webUrl = "https://www.instagram.com/" + coPresenterIGs[Index];
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
                      TextSpan(
                        text: coPresenterNames[Index],
                        style: new TextStyle(color: Colors.black),
                      ),
                    ],
                  ),
                );
              }
          )
      );
    };

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
                subtitle: Text(item.talkType + ': ' + item.talkFocus,
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14),),
                  leading: IconButton(
              icon: FaIcon(FontAwesomeIcons.instagram, size: 30,
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

    // #docregion Card
    Widget _buildCard2() {
      return SizedBox(
        width: MediaQuery.of(context).size.width * 0.9,
        child: ListTile(
            title: RichText(
              text: TextSpan(
                style: Theme.of(context).textTheme.headline6,
                children: [
                  TextSpan(
                    text: 'Date: ',
                    style: TextStyle( fontSize: 14, fontWeight: FontWeight.w800),
                  ),
                  TextSpan(
                    text: DateFormat('EEEE, LLLL d - HH:mm-').format(item.talkStartDateTime) +
                        DateFormat('HH:mm').format(item.talkEndDateTime),
                    style: TextStyle( fontSize: 14 ),
                  ),
                ],
              ),
            ),
            subtitle: RichText(
                  text: TextSpan(
                    style: Theme.of(context).textTheme.headline6,
                    children: [
                      TextSpan(
                        text: 'Location: ',
                        style: TextStyle( fontSize: 14, fontWeight: FontWeight.w800),
                      ),
                      TextSpan(
                        text: item.talkLocation,
                        style: TextStyle( fontSize: 14 ),
                      ),
                    ],
                  ),
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

      body: SingleChildScrollView(
      physics: ScrollPhysics(),
      child: ListView(
          shrinkWrap: true,
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
            Center(child: _buildCard(), heightFactor: 0.8),
            Center(child: _buildCard2(), heightFactor: 0.8),
            if( item.coPresenters.isNotEmpty ) Center(child: _buildCoPresenters(), heightFactor: 0.8),
            textSection
          ],
        ),
    ));
  }

}