import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../globals.dart';
import '../main.dart';
import 'package:flutter/widgets.dart';

class InfoScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    String exhibitionsTitle = 'EXHIBITIONS';
    String exhibitionsText = 'We have exhibition opportunities available for GAS members and the general public, both in person and online. '
        'Showcasing the depth and breadth of our membership and exploring a range of poignant topics in the glass '
        'community, our conference exhibitions offer a unique way for artists to participate from across the globe.';
    String middayInteractiveTitle = 'MIDDAY INTERACTIVE PROGRAMMING';
    String middayInteractiveText = 'NEW THIS YEAR: In response to attendee feedback, we are offering themed interactive '
        'programming at Wilhelm Hallen during a midday pause in the schedule. Enjoy time to mingle with fellow '
        'glass enthusiasts, an extended break for lunch, or a beer at our Biergarten at Wilhelm Hallen.';
    String activitiesTitle = 'ACTIVITIES';
    String activitiesText = 'Use our GAS activities to add to your glass collection, grow your artistic practice, '
        'networks, and more!';

    final Uri params = Uri(
        scheme: 'mailto',
        path: 'jennifer@glassart.org',
        queryParameters: {
          'subject': 'Default Subject',
          'body': 'Default body'
        }
    );
    String jenniferUrl = params.toString();

    Widget myDivider = Divider(thickness: 2, color: Colors.blue,
        indent: 32, endIndent: 32, height: 50);

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
    }

    Widget textSection = Container(
      padding: const EdgeInsets.fromLTRB(32,32,32,10),
      child: const Text(
        'From our exhibitions and portfolio reviews to the Goblet Grab, there are so many ways to become a '
            'part of the conference! \n\nEach GAS annual conference offers exhibitions and activities to give '
            'attendees the opportunity to grow their artistic practice, networks, and more. \n\nOur exhibitions '
            'and activities let you connect with new and old friends and network with artists, vendors, schools, '
            'and some of the best public access studios in the world.',
        softWrap: true,
      ),
    );

    Widget middayInteractiveProgrammingContent = Column(
      children: <Widget>[
        ExpansionTile(
          title: Text('Education + Institutions',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          subtitle: Text('Thursday, May 16'),
          children: <Widget>[
            ListTile(
                dense:true,
                contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: -10.0),
                visualDensity: VisualDensity(horizontal: 0, vertical: -4),
                title: Text(
                  'Enjoy workshops by The Glass Virus and presentations by glass '
                  'programs and institutions from around the world.\n',
                  style: TextStyle(fontWeight: FontWeight.bold),
                )),
          ],
        ),
        ExpansionTile(
          title: Text('Career + Small Business Development',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          subtitle: Text('Friday, May 17'),
          children: <Widget>[
            ListTile(
                dense:true,
                contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: -10.0),
                visualDensity: VisualDensity(horizontal: 0, vertical: -4),
                title: RichText(
                  text: TextSpan(
                  style: Theme.of(context).textTheme.headline6,
                  children: [
                  const TextSpan(
                  text: 'Learn about how to develop your career or small business. Anna Mlasowsky will '
                    'hold a roundtable discussion on career development. Anne Kenealy will host a workshop on grant writing. '
                    'Both events will require advanced sign-ups – reserve your spot for the roundtable discussion ',
                  style: TextStyle(fontSize: 14),
                  ),
                new TextSpan(
                  text: 'here',
                  style: new TextStyle(color: Colors.blue, fontSize: 14),
                  recognizer: new TapGestureRecognizer()
                  ..onTap = () { launch('https://docs.google.com/forms/d/e/1FAIpQLScbE3GB_crBKxZ1rl0fVOSmcUIlA2pGTEZq6yN3hlw4v5SIIg/viewform');
                  },
                ),
            const TextSpan(
              text: ' + the grant writing workshop ',
              style: TextStyle(fontSize: 14),
            ),
            new TextSpan(
              text: 'here',
              style: new TextStyle(color: Colors.blue, fontSize: 14),
              recognizer: new TapGestureRecognizer()
              ..onTap = () { launch('https://docs.google.com/forms/d/e/1FAIpQLSc5bgfvASOfzLLEUQ-ihPyND0eRQ9qwQPJL_R6g9q23AM2zDw/viewform');
              },
            ),
            const TextSpan(
              text: '.\n',
              style: TextStyle(fontSize: 14),
            ),
    ],
    ),
    ),
            )],
    ),
        ExpansionTile(
          title: Text('Self-Care + Wellness',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          subtitle: Text('Saturday, May 18'),
          children: <Widget>[
            ListTile(
                dense:true,
                contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: -10.0),
                visualDensity: VisualDensity(horizontal: 0, vertical: -4),
                title: Text(
                  'Close out a busy conference with programming centered around self-care and '
                      'wellness! Hannah Guisewhite will be teaching ways for glassmakers to take care of their bodies.\n',
                  style: TextStyle(fontWeight: FontWeight.bold),
                )),
          ],
        ),
    ]
    );

    Widget activitiesContent = Column(
        children: <Widget>[
          ExpansionTile(
            leading: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset("images/Activities/GobletGrab.jpeg",
                  width: 80,
                  fit: BoxFit.fitWidth,
                ),
              ],
            ),
            title: Text('Goblet Grab',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            children: <Widget>[
              ListTile(
                  dense:true,
                  contentPadding: EdgeInsets.symmetric(horizontal: 30.0, vertical: -10.0),
                  visualDensity: VisualDensity(horizontal: 0, vertical: -4),
                  title: RichText(
                    text: TextSpan(
                    style: Theme.of(context).textTheme.headline6,
                    children: [
                    const TextSpan(
                    text: 'Always fast-paced and full of entertainment, the Goblet Grab is a fun and funky '
                      'conference tradition that never fails to generate excitement! Open to the public '
                      'during the conference, donations and purchases from this free event help us to '
                      'support the ongoing operations of GAS all year long.\n\nPre-register your goblet '
                      'grab donation ',
                    style: TextStyle(fontSize: 14),
                    ),
                    new TextSpan(
                    text: 'here',
                    style: new TextStyle(color: Colors.blue, fontSize: 14),
                    recognizer: new TapGestureRecognizer()
                    ..onTap = () { launch('https://docs.google.com/forms/d/1ZGCJWotpsCNfF8ctDXIoYuadbY3UKc4YQPokjPSjxrU/edit');
                      },
                    ),
                      const TextSpan(
                        text: '!',
                        style: TextStyle(fontSize: 14),
                      ),
                  ],
                ),
                ),
          )
          ]
          ),
          ExpansionTile(
              leading: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.asset("images/Activities/PortfolioReview.jpeg",
                    width: 80,
                    fit: BoxFit.fitWidth,
                  ),
                ],
              ),
              title: Text('Portfolio Review',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              children: <Widget>[
                ListTile(
                  dense:true,
                  contentPadding: EdgeInsets.symmetric(horizontal: 30.0, vertical: -10.0),
                  visualDensity: VisualDensity(horizontal: 0, vertical: -4),
                  title: RichText(
                    text: TextSpan(
                      style: Theme.of(context).textTheme.headline6,
                      children: [
                        const TextSpan(
                          text: 'Gallery owners, curators, educators, and artists will be available to review portfolios '
                              'of GAS conference attendees. Reviews will last 15-20 minutes each, and a limited number of '
                              'slots will be available on a first-come, first-served basis to those who sign up online. '
                              'If necessary a waiting list will be kept in case of cancellations. Sign up ',
                          style: TextStyle(fontSize: 14),
                        ),
                        new TextSpan(
                          text: 'here',
                          style: new TextStyle(color: Colors.blue, fontSize: 14),
                          recognizer: new TapGestureRecognizer()
                            ..onTap = () { launch('https://www.signupgenius.com/go/10C0B4EABA62AA2F8C07-48053598-berlin#/');
                            },
                        ),
                        const TextSpan(
                          text: '!',
                          style: TextStyle(fontSize: 14),
                        ),
                      ],
                    ),
                  ),
                )
              ]
          ),
          ExpansionTile(
              leading: Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.only(top: 0.0),
                  child: Column(
                    children: [
                      Expanded(
                        child: Container(child: Image.asset("images/Activities/TrunkShow.jpeg",
                          width: 80,
                          fit: BoxFit.scaleDown,
                        ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              title: Text('Trunk Show',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              children: <Widget>[
                ListTile(
                  dense:true,
                  contentPadding: EdgeInsets.symmetric(horizontal: 30.0, vertical: -10.0),
                  visualDensity: VisualDensity(horizontal: 0, vertical: -4),
                  title: RichText(
                    text: TextSpan(
                      style: Theme.of(context).textTheme.headline6,
                      children: [
                        const TextSpan(
                          text: 'New this year, shop glass jewelry from around the world at the Wilhelm Hallen! '
                              'Interested in participating? Contact ',
                          style: TextStyle(fontSize: 14),
                        ),
                        new TextSpan(
                          text: 'jennifer@glassart.org',
                          style: new TextStyle(color: Colors.blue, fontSize: 14),
                          recognizer: new TapGestureRecognizer()
                            ..onTap = () { launch(jenniferUrl);
                            },
                        ),
                        const TextSpan(
                          text: ' for more info.',
                          style: TextStyle(fontSize: 14),
                        ),
                      ],
                    ),
                  ),
                )
              ]
          ),
          ExpansionTile(
              leading: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.asset("images/Activities/FilmFestival.jpeg",
                    width: 80,
                    fit: BoxFit.fitWidth,
                  ),
                ],
              ),
              title: Text('Film Festival',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              children: <Widget>[
                ListTile(
                  dense:true,
                  contentPadding: EdgeInsets.symmetric(horizontal: 30.0, vertical: -10.0),
                  visualDensity: VisualDensity(horizontal: 0, vertical: -4),
                  title: RichText(
                    text: TextSpan(
                      style: Theme.of(context).textTheme.headline6,
                      children: [
                        const TextSpan(
                          text: 'The Glass Art Society is pleased to announce the inaugural GAS Film Festival, '
                              'a celebration at the intersection of glass art and film.\n\nGlass artists and '
                              'filmmakers from around the world are invited to submit films of any length for '
                              'screenings which will take place both in-person and virtually. In-person screenings '
                              'will occur in tandem with the annual GAS Conference, this year to be held from '
                              'May 15-18, 2024, in Berlin, Germany. Learn more ',
                          style: TextStyle(fontSize: 14),
                        ),
                        new TextSpan(
                          text: 'here',
                          style: new TextStyle(color: Colors.blue, fontSize: 14),
                          recognizer: new TapGestureRecognizer()
                            ..onTap = () { launch('https://www.glassart.org/programs/gas-film-festival/');
                            },
                        ),
                        const TextSpan(
                          text: '.',
                          style: TextStyle(fontSize: 14),
                        ),
                      ],
                    ),
                  ),
                )
              ]
          ),
          ExpansionTile(
              leading: Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.only(top: 0.0, left: 10, right: 10),
                  child: Column(
                    children: [
                      Expanded(
                        child: Container(child: Icon(Icons.co_present,
                          color: Colors.blue,
                          size: 60.0,
                        ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              title: Text('Research Presentations',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              children: <Widget>[
                ListTile(
                  dense:true,
                  contentPadding: EdgeInsets.symmetric(horizontal: 30.0, vertical: -10.0),
                  visualDensity: VisualDensity(horizontal: 0, vertical: -4),
                  title: RichText(
                    text: TextSpan(
                      style: Theme.of(context).textTheme.headline6,
                      children: [
                        const TextSpan(
                          text: 'Are you a researcher in the field of glass who has a paper, poster, or '
                              'other research project to share? Are you coming to Berlin for the GAS Conference? '
                              'GREAT! ',
                          style: TextStyle(fontSize: 14),
                        ),
                        new TextSpan(
                          text: 'Sign up here',
                          style: new TextStyle(color: Colors.blue, fontSize: 14),
                          recognizer: new TapGestureRecognizer()
                            ..onTap = () { launch('https://docs.google.com/forms/d/e/1FAIpQLSf-zzP2gkhw_hUmhjaR1h4LhGRrqZ9ejCrQoBF7iwy1qJh6dg/viewform');
                            },
                        ),
                        const TextSpan(
                          text: ' to indicate your interest in presenting your research, and our team will '
                              'reach out to you before April 2024 with options available for presenting or '
                              'conducting your research at the conference.',
                          style: TextStyle(fontSize: 14),
                        ),
                      ],
                    ),
                  ),
                )
              ]
          ),
        ]
    );

    Widget exhibitionsContent = Column(
        children: <Widget>[
          ExpansionTile(
            title: Text('Connections 2024',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            subtitle: Text('Glass from Every Angle'),
            children: <Widget>[
              ListTile(
                contentPadding: EdgeInsets.fromLTRB(24,0,20,0),
                title: Text('GAS MEMBER EXHIBITION\n',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                ),
                subtitle: RichText(
                  text: TextSpan(
                    style: Theme.of(context).textTheme.headline6,
                    children: [
                      const TextSpan(
                        text: 'Highlighting the work and achievements of a selection of Glass Art Society members '
                            'from around the world, this exhibition showcases artists pushing the technical and '
                            'conceptual limits of the medium.\n\n',
                        style: TextStyle(
                          fontSize: 14,
                        ),
                      ),
                      TextSpan(
                        text: '2024 JURORS:\n'
                            '   • Carolyn Herrera-Perez, Curator, USA\n'
                            '   • Katherine Huskie, Artist, UK\n'
                            '   • Richard Meitner, Artist, The Netherlands\n\n'
                            'The GAS Member Exhibition is generously supported by The Glass Furnace.\n',
                        style: TextStyle( fontSize: 14 ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          ExpansionTile(
            title: Text('Evolution 2024',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            subtitle: Text('A Showcase of Emerging, International Talent'),
            children: <Widget>[
              ListTile(
                contentPadding: EdgeInsets.fromLTRB(24,4,20,4),
                title: Text('GAS STUDENT EXHIBITION\n',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                ),
                subtitle: RichText(
                  text: TextSpan(
                    style: Theme.of(context).textTheme.headline6,
                    children: [
                      const TextSpan(
                        text: 'Showcasing the unique perspectives and emerging '
                            'talent of student artists working primarily in glass.\n\n',
                        style: TextStyle(
                          fontSize: 14,
                        ),
                      ),
                      TextSpan(
                        text: '2024 JURORS:\n'
                            '   • Jens Pfeifer, Artist, The Netherlands\n'
                            '   • Alyssa Rose Radtke, Artist, USA\n'
                            '   • Leo Tecosky, Artist, USA\n\n'
                            'The GAS Student Exhibition is generously supported by Warm Glass UK.\n',
                        style: TextStyle( fontSize: 14 ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          ExpansionTile(
            title: Text('Trace 2024',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            subtitle: Text('An Exploration of Sustainable Glass Art'),
            children: <Widget>[
              ListTile(
                contentPadding: EdgeInsets.fromLTRB(24,4,20,4),
                title: Text('GAS GREEN EXHIBITION\n',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                ),
                subtitle: RichText(
                  text: TextSpan(
                    style: Theme.of(context).textTheme.headline6,
                    children: [
                      const TextSpan(
                        text: 'Exploring ways sustainability shows up in glass practice, this digital exhibition offers individuals '
                            'an opportunity to showcase their work without the environmental impact of shipping and traveling.\n\n',
                        style: TextStyle(
                          fontSize: 14,
                        ),
                      ),
                      TextSpan(
                        text: '2024 JURORS:\n'
                            '   • Hannah Gibson, Artist, UK\n'
                            '   • Riikka Latva-Somppi, Artist, Researcher + Curator, Finland\n'
                            '   • Paul Musgrove, Artist + Gallery Owner, Scotland\n'
                            '   • Ivan Bestari Minar Pradipta, Artist + Designer, Indonesia\n\n',
                        style: TextStyle( fontSize: 14 ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ]
    );

    return Scaffold(
      appBar: AppBar(
          iconTheme: IconThemeData(
            color: Colors.white, //change your color here
          ),
          title: const Text('INFO', style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w500,
          )),
          backgroundColor: primaryColor),
      body: ListView(
        //SingleChildScrollView(
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
        textSection,
        myDivider,
        buildTitleWidget(exhibitionsTitle, exhibitionsText),
        Container(
          margin: EdgeInsets.fromLTRB(24,0,20,0),
          child: exhibitionsContent,
        ),
        myDivider,
        buildTitleWidget(middayInteractiveTitle, middayInteractiveText),
      Container(
        margin: EdgeInsets.fromLTRB(24,0,20,0),
        child: middayInteractiveProgrammingContent, // <-- Maybe put these on collapsible
      ),
        myDivider,
        buildTitleWidget(activitiesTitle, activitiesText),
        Container(
          margin: EdgeInsets.fromLTRB(24,0,20,0),
          child: activitiesContent,
        ),
        myDivider,
        ],
      ),
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

/*class InfoTileExample extends StatefulWidget {

  @override
  State<InfoTileExample> createState() => _InfoTileExampleState();

}

class _InfoTileExampleState extends State<InfoTileExample> {

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return Column(
        children: <Widget>[
          ExpansionTile(
            leading: Image.asset("images/Venues/WilhelmHallenLogo.jpg",
                width: 100,
                fit: BoxFit.fitWidth
            ),
            title: Text('Wilhelm Hallen',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            subtitle: Text('Kopenhagener Str. 60-72'),
            children: <Widget>[
              ListTile(
                  dense:true,
                  contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: -10.0),
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
            leading: Image.asset("images/Venues/BerlinGlasLogo.png",
                width: 100,
                fit: BoxFit.fitWidth
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
                width: 100,
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
                width: 100,
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

  }
}*/