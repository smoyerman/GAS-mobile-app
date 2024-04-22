import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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
    String specialEventsTitle = 'SPECIAL EVENTS';
    String specialEventsText = 'Each year, our conference offers a number of special events for you to network, '
        'catch-up with friends, and have some added fun!\n\nConnect with friends, new and old, and network '
        'with the best of the glass community as you enjoy unique and engaging events across Berlin, Germany.';
    String GASMarketTitle = 'GAS MARKET';
    String GASMarketText = 'A central marketplace for exhibitors, the GAS Market has everything from new tools and '
        'amazing gifts to the opportunity for insider insights and new contacts. This year’s '
        'marketplace will be held at Wilhelm Hallen.';

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
      padding: const EdgeInsets.fromLTRB(32,16,32,10),
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
          title: Text('Education & Institutions',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          subtitle: Text('Thursday, 16 May | 12:00 - 14:00'),
          children: <Widget>[
            ListTile(
              contentPadding: EdgeInsets.fromLTRB(24,4,20,4),
              title: Text('Wilhelm Hallen Main Stage\n',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
              subtitle: RichText(
                text: TextSpan(
                  style: Theme.of(context).textTheme.headline6,
                  children: [
                    const TextSpan(
                      text: 'Enjoy workshops by The Glass Virus and presentations by glass '
                          'programs and institutions from around the world.\n\n',
                      style: TextStyle(
                        fontSize: 14,
                      ),
                    ),
                    TextSpan(
                      text: '   • Conference Pass Holders: Included\n',
                      style: TextStyle( fontSize: 14 ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        ExpansionTile(
          title: Text('Career & Small Business Development',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          subtitle: Text('Friday, 17 May | 12:00–14:00'),
          children: <Widget>[
            ListTile(
              contentPadding: EdgeInsets.fromLTRB(24,4,20,4),
              title: Text('Wilhelm Hallen Main Stage\n',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
              subtitle: RichText(
                text: TextSpan(
                  style: Theme.of(context).textTheme.headline6,
                  children: [
                    const TextSpan(
                      text: 'Learn about how to develop your career or small business. '
                          'Anna Mlasowsky will hold a roundtable discussion on career development. '
                          'Anne Kenealy will host a workshop on grant writing. This workshop will '
                          'require advanced sign-ups.\n\n',
                      style: TextStyle(
                        fontSize: 14,
                      ),
                    ),
                    TextSpan(
                      text: '   • Conference Pass Holders: Included\n',
                      style: TextStyle( fontSize: 14 ),
                    ),
                  ],
                ),
              ),
            ),
            ],
    ),
        ExpansionTile(
          title: Text('Self Care & Wellness',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          subtitle: Text('Saturday, 18 May | 12:00–14:00 '),
          children: <Widget>[
            ListTile(
              contentPadding: EdgeInsets.fromLTRB(24,4,20,4),
              title: Text('Wilhelm Hallen Main Stage\n',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
              subtitle: RichText(
                text: TextSpan(
                  style: Theme.of(context).textTheme.headline6,
                  children: [
                    const TextSpan(
                      text: 'Close out a busy conference with programming centered around '
                          'self-care and wellness! Hannah Guisewhite will be teaching ways for '
                          'glassmakers to take care of their bodies.\n\n',
                      style: TextStyle(
                        fontSize: 14,
                      ),
                    ),
                    TextSpan(
                      text: '   • Conference Pass Holders: Included\n',
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
            title: Text('Goblet Grab + Sip',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            subtitle: Text('17 May | 15:30–17:00'),
            children: <Widget>[
              ListTile(
                contentPadding: EdgeInsets.fromLTRB(24,4,20,4),
                title: Text('Wilhelm Hallen\n',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                ),
                subtitle: RichText(
                  text: TextSpan(
                      style: Theme.of(context).textTheme.headline6,
                      children: [
                        const TextSpan(
                          text: 'Always fast-paced and full of entertainment, '
                              'the Goblet Grab is a fun and funky conference '
                              'tradition that never fails to generate excitement! '
                              'Open to the public during the conference, donations '
                              'and purchases from this event help us to support the '
                              'ongoing operations of GAS all year long.\n\n',
                          style: TextStyle(
                            fontSize: 14,
                          ),
                        ),
                        const TextSpan(
                          text: 'Donors: ',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const TextSpan(
                          text: 'Drinking vessel donations may be made in person at the '
                              'Registration Desk in Wilhelm Hallen on Wednesday and Thursday '
                              'from 9:00–16:00 and Friday from 9:00–14:00.\n',
                          style: TextStyle(
                            fontSize: 14,
                          ),
                        ),
                      ]
                  ),
                ),
              ),
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
              subtitle: Text('17 May  | 12:00–14:00'),
              children: <Widget>[
                ListTile(
                  contentPadding: EdgeInsets.fromLTRB(24,4,20,4),
                  title: Text('Educational Resource Area at Wilhelm Hallen\n',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                  subtitle: RichText(
                    text: TextSpan(
                        style: Theme.of(context).textTheme.headline6,
                        children: [
                          const TextSpan(
                            text: 'Curators, educators, and artists will be available to review portfolios of '
                    'GAS conference attendees. Reviews will last 20-30 minutes each, and a limited '
                    'number of slots will be available on a walk-up, first-come, first-served basis. '
                    'A waiting list will be kept in case of cancellations. \n\nSpecial thanks to this '
                    'year’s reviewers: Michael Endo, Caroline Madden, Scott Chaseling, '
                    'Angel Monzon. \n',
                            style: TextStyle(
                              fontSize: 14,
                            ),
                          ),
                        ]
                    ),
                  ),
                ),
              ]
          ),
          ExpansionTile(
              leading: Container(
                  child: Image.asset("images/Activities/TrunkShow.jpeg",
                    width: 80,
                    fit: BoxFit.fitWidth,
                  ),
              ),
              title: Text('Trunk Show',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              subtitle: Text('16 May | 17:00–20:00'),
              children: <Widget>[
          ListTile(
            contentPadding: EdgeInsets.fromLTRB(24,4,20,4),
            title: Text('Wilhelm Hallen Main Stage\n',
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
            subtitle: RichText(
            text: TextSpan(
            style: Theme.of(context).textTheme.headline6,
            children: [
            const TextSpan(
            text: 'All that glitters is glass! Up your jewelry game by purchasing '
          'your new favorite piece at our jewelry trunk show. Artists with jewelry '
          'for sale include: Jeanne-Sophie Aas, Noa Agasi, Ivan Bestari, William '
          'Rudy Faulkner, Nathalie Fluckinger, Jason Hitchcock, and Katherine Huskie.\n\n',
            style: TextStyle(
            fontSize: 14,
            ),
            ),
            TextSpan(
            text: '   • Free to the Public\n',
            style: TextStyle( fontSize: 14 ),
            ),
                    ]
                ),
            ),
          ),
    ]),
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
              title: Text('Film Festival Opening',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              subtitle: Text('16 May | 17:30–20:30'),
              children: <Widget>[
                ListTile(
                  contentPadding: EdgeInsets.fromLTRB(24,4,20,4),
                  title: Text('Wilhelm Hallen Main Stage\n',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                  subtitle: RichText(
                    text: TextSpan(
                      style: Theme.of(context).textTheme.headline6,
                      children: [
                        const TextSpan(
                          text: 'Lights, camera, action: enjoy our Film Festival opening and explore '
                              'the ways glass artists and filmmakers are combining glass and film! The '
                              'Film Festival was juried by Ayana Morris of Newark Moonlight Cinema and '
                              'the GAS Board and Staff. Learn more about all the Film Festival entries '
                              'by scanning the QR code.\n\n',
                          style: TextStyle(
                            fontSize: 14,
                          ),
                        ),
                        TextSpan(
                          text: '   • Conference Pass Holders: Included\n\n',
                          style: TextStyle( fontSize: 14 ),
                        ),
                        TextSpan(
                          text: 'Additional screenings: ',
                          style: TextStyle( fontSize: 14, fontWeight: FontWeight.w600),
                        ),
                        TextSpan(
                        text: 'Selections from our Film Festival will be screened at '
                            'Wilhelm Hallen on Friday from 11:30–14:00 and Saturday from 12:00-16:30.',
                        style: TextStyle( fontSize: 14 ),
                        ),

                      ],
                    ),
                  ),
                ),
              ]
          ),
          /*ExpansionTile(
              leading: Container(
                  child: Icon(Icons.co_present,
                    color: Colors.blue,
                    size: 60.0,
                  ),
                  width: 80,
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
          ),*/
        ]
    );

    Widget GASMarketContent = Column(
        children: <Widget>[
    Theme(
    data: ThemeData().copyWith(dividerColor: Colors.transparent),
        child: ExpansionTile(
            title: Text('Market Participants',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            subtitle: Text('Wed, 15 May - Sat, 18 May'),
            children: <Widget> [
    Container(
    padding: const EdgeInsets.fromLTRB(32, 0, 32, 32),
    child: GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: marketItems.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 1,
        childAspectRatio: 3,
        crossAxisSpacing: 0,
        mainAxisSpacing: 0,
      ),
      itemBuilder: (ctx, index) {
        return Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Expanded(
                    child: GestureDetector(
                      onTap: () async {
                        var url = marketItems[index].website;
                        launch(url);
                      }, // Image tapped
                      child: Container(
                        margin: const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            fit: BoxFit.scaleDown,
                            image: AssetImage(marketItems[index].image),
                          ),
                        ),
                      ),
                    )
                ),
                marketItems[index].ig.isNotEmpty ? IconButton(
                            icon: FaIcon(FontAwesomeIcons.instagram,
                              size: 20,
                            ),
                            onPressed: () async {
                              if (marketItems[index].ig.isNotEmpty) {
                                var nativeUrl = "instagram://user?username=" + marketItems[index].ig;
                                var webUrl = "https://www.instagram.com/" + marketItems[index].ig;
                                if (await canLaunch(nativeUrl)) {
                                  await launch(nativeUrl);
                                } else if (await canLaunch(webUrl)) {
                                  await launch(webUrl);
                                } else {
                                  print("can't open Instagram");
                                }
                              }}
                        ) : SizedBox(),
                      IconButton(
                        icon: Icon(Icons.email_outlined, size: 20),
                        onPressed: () async {
                          launch('mailto:' + marketItems[index].email);
                        },
                      ),
                    ]);
      },
    ),
    ),
            ],
          ),),
        ]
    );

    Widget specialEventsContent = Column(
        children: <Widget>[
          ExpansionTile(
            title: Text('GAS Market',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            subtitle: Text('Wed, 15 May – Fri, 17 May | 9:30–17:00\nSaturday, 18 May | 9:30–15:00'),
            children: <Widget>[
              ListTile(
                contentPadding: EdgeInsets.fromLTRB(24,4,20,4),
                title: Text('Wilhelm Hallen\n',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                ),
                subtitle: RichText(
                  text: TextSpan(
                    style: Theme.of(context).textTheme.headline6,
                    children: [
                      const TextSpan(
                        text: 'Thank you to our GAS Market Sponsor, TGK. The GAS Market gathers the best vendors, '
                            'educational organizations, and more into one easily browsable marketplace.\n\n',
                        style: TextStyle(
                          fontSize: 14,
                        ),
                      ),
                      TextSpan(
                        text: '   • Free to the public\n',
                        style: TextStyle( fontSize: 14 ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          ExpansionTile(
            title: Text('First Timers Meetup',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            subtitle: Text('Wednesday, 15 May | 15:30 - 16:30'),
            children: <Widget>[
              ListTile(
                contentPadding: EdgeInsets.fromLTRB(24,4,20,4),
                title: Text('GAS Market at Wilhelm Hallen\n',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                ),
                subtitle: RichText(
                  text: TextSpan(
                    style: Theme.of(context).textTheme.headline6,
                    children: [
                      const TextSpan(
                        text: 'Meet fellow first-time conference attendees with GAS Board members! '
                            'Look at the conference schedule, ask questions, and get excited '
                            'for the conference.\n\n',
                        style: TextStyle(
                          fontSize: 14,
                        ),
                      ),
                      TextSpan(
                        text: '   • Conference Pass Holders: Included\n',
                        style: TextStyle( fontSize: 14 ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          ExpansionTile(
            title: Text('Conference Kick-Off',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            subtitle: Text('Wednesday, 15 May | 17:00–20:00'),
            children: <Widget>[
              ListTile(
                contentPadding: EdgeInsets.fromLTRB(24,4,20,4),
                title: Text('Wilhelm Hallen\n',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                ),
                subtitle: RichText(
                  text: TextSpan(
                    style: Theme.of(context).textTheme.headline6,
                    children: [
                      const TextSpan(
                        text: 'We welcome all conference attendees, presenters, and partners to join '
                            'us as we launch Berlin 2024 and pay tribute to members of our community.\n\n',
                        style: TextStyle(
                          fontSize: 14,
                        ),
                      ),
                      TextSpan(
                        text: '   • Cash bar + food trucks on site.\n'
                        '   • Conference Pass Holders: Included\n',
                        style: TextStyle( fontSize: 14 ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          ExpansionTile(
            title: Text('Exhibition Opening',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            subtitle: Text('Wednesday, 15 May | 17:00–20:00 pm'),
            children: <Widget>[
              ListTile(
                contentPadding: EdgeInsets.fromLTRB(24,4,20,4),
                title: Text('Wilhelm Hallen\n',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                ),
                subtitle: RichText(
                  text: TextSpan(
                    style: Theme.of(context).textTheme.headline6,
                    children: [
                      const TextSpan(
                        text: 'Explore the talent of GAS Members and students at the opening '
                            'for CONNECTIONS 2024 and EVOLUTION 2024, our annual juried exhibitions.\n\n',
                        style: TextStyle(
                          fontSize: 14,
                        ),
                      ),
                      WidgetSpan(
                          child: Container(
                            child: Text('• On view: Thursday, 16 May through Saturday, 18 May, 9:00–17:00 daily\n',
                                style: TextStyle( fontSize: 14 )),
                          )
                      ),
                      TextSpan(
                        text: '   • Conference Pass Holders: Included\n',
                        style: TextStyle( fontSize: 14 ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          ExpansionTile(
            title: Text('Kids Oasis at Berlin Glas',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            subtitle: Text('Thurs, 16 May - Sat, 18 May \n10:00-12:00 and 14:00–17:00'),
            children: <Widget>[
              ListTile(
                contentPadding: EdgeInsets.fromLTRB(24,4,20,4),
                title: Text('Berlin Glas Garden at Provinzstraße Conference Hub\n',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                ),
                subtitle: RichText(
                  text: TextSpan(
                    style: Theme.of(context).textTheme.headline6,
                    children: [
                      const TextSpan(
                        text: 'Enjoy a free kids’ area with daily programming sponsored by Berlin Glas Youth '
                  'Outreach! Children aged 7 and up can be signed in for programming during open hours '
                  'while parents view demonstrations. Children age 6 and under must be accompanied by parent '
                  'or guardian.\n\n',
                        style: TextStyle(
                          fontSize: 14,
                        ),
                      ),
                      TextSpan(
                        text: '   • Conference Pass Holders: Included\n',
                        style: TextStyle( fontSize: 14 ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          ExpansionTile(
            title: Text('Green Pavilion',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            subtitle: Text('Thurs, 16 May – Sat, 18 May | 9:00–17:00'),
            children: <Widget>[
              ListTile(
                contentPadding: EdgeInsets.fromLTRB(24,4,20,4),
                title: Text('Near Wilhelm Hallen Biergarten\n',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                ),
                subtitle: RichText(
                  text: TextSpan(
                    style: Theme.of(context).textTheme.headline6,
                    children: [
                      const TextSpan(
                        text: 'Curious about green ways of working with glass? Come to our Green '
                            'Pavilion to see furnaces using recycled glass, explore green resources, '
                            'and see TRACE 2024, our annual juried green exhibition.\n\n',
                        style: TextStyle(
                          fontSize: 14,
                        ),
                      ),
                      TextSpan(
                        text: '   • Free to the public\n',
                        style: TextStyle( fontSize: 14 ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),

          ExpansionTile(
            title: Text('Student Meet-Up',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            subtitle: Text('Thursday, 16 May | 13:30-15:00'),
            children: <Widget>[
              ListTile(
                contentPadding: EdgeInsets.fromLTRB(24,4,20,4),
                title: Text('GAS Market at Wilhelm Hallen\n',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                ),
                subtitle: RichText(
                  text: TextSpan(
                    style: Theme.of(context).textTheme.headline6,
                    children: [
                      const TextSpan(
                        text: 'Join your hosts, GAS Student Board Representatives Jocelyn Chan and Leia Guo, '
                            'for an afternoon of networking and information sharing. Look at the conference '
                            'schedule together, ask and answer questions to orient yourself to the day ahead, and find'
                            ' new friends to help you explore the magic of Berlin! Snacks will be provided. Attend '
                            'the Student Meet-Up and Conference Kick Off to receive tickets for our student-exclusive '
                            'giveaway! Each student can have up to three tickets to win fabulous prizes like gift cards, '
                            'color, and tools from our generous donors. '
                            'Prizes will be drawn and announced at the Flame Off at Monopol on Friday night.\n\n',
                        style: TextStyle(
                          fontSize: 14,
                        ),
                      ),
                      TextSpan(
                        text: '   • Conference Pass Holders: Included\n',
                        style: TextStyle( fontSize: 14 ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),

          ExpansionTile(
            title: Text('Flame Off',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            subtitle: Text('Friday, 17 May | 17:30–20:00'),
            children: <Widget>[
              ListTile(
                contentPadding: EdgeInsets.fromLTRB(24,4,20,4),
                title: Text('Monopol Flame Shop\n',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                ),
                subtitle: RichText(
                  text: TextSpan(
                    style: Theme.of(context).textTheme.headline6,
                    children: [
                      const TextSpan(
                        text: 'Get your flame on at Monopol as flameworkers take the stage.\n\n',
                        style: TextStyle(
                          fontSize: 14,
                        ),
                      ),
                      TextSpan(
                        text: '   • Conference Pass Holders: Included\n',
                        style: TextStyle( fontSize: 14 ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),

          ExpansionTile(
            title: Text('Closing Night Party',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            subtitle: Text('Saturday, 18 May | 19:30 - 24:00'),
            children: <Widget>[
              ListTile(
                contentPadding: EdgeInsets.fromLTRB(24,4,20,4),
                title: Text('Alte Münze - Molkenmarkt 2, 10179 Berlin-Mitte\n',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                ),
                subtitle: RichText(
                  text: TextSpan(
                    style: Theme.of(context).textTheme.headline6,
                    children: [
                      const TextSpan(
                        text: 'Help us close out our 2024 GAS Conference in style! The party is included '
                            'with four-day conference passes, but tickets are open to the public, so be '
                            'sure to invite your friends and family even if they didn’t attend the conference.\n\n',
                        style: TextStyle(
                          fontSize: 14,
                        ),
                      ),
                      TextSpan(
                        text: '   • Four-Day Pass Holders: Included\n'
                            '   • Additional Tickets: \$50\n',
                        style: TextStyle( fontSize: 14 ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          /*ExpansionTile(
            title: Text('Stained Glass Workshop',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            subtitle: Text('by Lola Pradeilles'),
            children: <Widget>[
              ListTile(
                contentPadding: EdgeInsets.fromLTRB(24,0,20,0),
                title: Text('Berlin Glas Cold Shop\nTuesday, May 14th\n'
                    'Two Sessions: 9:00-12:30 and 13:00-16:30\n',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                ),
                subtitle: RichText(
                  text: TextSpan(
                    style: Theme.of(context).textTheme.headline6,
                    children: [
                      const TextSpan(
                        text: 'Join stained glass artist Lola Pradeilles for a half-day workshop where you '
                            'will explore the use of stencils for painting on stained glass! Learn a new '
                            'technique or sharpen your painting skills with grisaille and enamels. Lola '
                            'works out of her studio in Occitane and has traveled throughout the world '
                            'learning and teaching her craft. Her passion for stained glass and restoration '
                            'are evident in the exquisite details of her works, and she is eager to share her '
                            'tips and secrets with students in Berlin.\n\nOpen to all – conference '
                            'registration not required.\n',
                        style: TextStyle(
                          fontSize: 14,
                        ),
                      ),
                      TextSpan(
                        text: '   • Members: \$75\n'
                            '   • Non-Members: \$90\n',
                        style: TextStyle( fontSize: 14 ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          ExpansionTile(
            title: Text('Reichenbach Factory Tour',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            subtitle: Text('Tuesday, May 14th'),
            children: <Widget>[
              ListTile(
                contentPadding: EdgeInsets.fromLTRB(24,4,20,4),
                title: Text('Depart Radisson Park Inn Alexanderplatz at 7 am, return at 6 pm\n',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                ),
                subtitle: RichText(
                  text: TextSpan(
                    style: Theme.of(context).textTheme.headline6,
                    children: [
                      const TextSpan(
                        text: 'Please note: This tour includes a 3-hour bus ride each way from Berlin to '
                  'Reichenbach and returning.\n\nFor the very first time, Reichenbach Glass is welcoming you '
                  'to step inside their historic factory nestled in a picturesque town. With over 150 years '
                  'of expertise in crafting exquisite colored glass, this is your chance to witness the magic '
                  'unfold.\n\nSince the turn of the century, Reichenbach Glass has been a trusted source for '
                  'glass artists worldwide, providing them with the finest materials to bring their visions '
                  'to life. Now, you have the exclusive opportunity to go behind the scenes and discover '
                  'the age-old techniques and traditions that have been passed down through generations.\n\nJoin '
                    'us as we journey through every step of the glassmaking process, from the raw materials to '
                    'the final product. Gain a deep appreciation for the craftsmanship that goes into creating '
                    'your favorite glass products.\n\nDon’t miss out on this extraordinary experience to '
                    'witness artistry, history, and innovation come together in one remarkable place. A '
                  'hearty German lunch will be included along with your factory tour. It\’s an adventure '
                  'you\’ll cherish forever.\n\nPlease note: This opportunity, generously sponsored by '
                            'Reichenbach in partnership with Olympic Color Rods, is available exclusively '
                            'to GAS Members! Space is limited, so register today!\n\n',
                        style: TextStyle(
                          fontSize: 14,
                        ),
                      ),
                      TextSpan(
                        text: 'GAS Members only: \$150.\n',
                        style: TextStyle( fontSize: 14 ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          ExpansionTile(
            title: Text('Day Trip: Berlin',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            subtitle: Text('Wednesday, May 15th  10:00-14:00'),
            children: <Widget>[
              ListTile(
                contentPadding: EdgeInsets.fromLTRB(24,4,20,4),
                title: Text('Pick up and Drop Off at Radisson Park Inn Alexanderplatz\n',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                ),
                subtitle: RichText(
                  text: TextSpan(
                    style: Theme.of(context).textTheme.headline6,
                    children: [
                      const TextSpan(
                        text: 'Enjoy the morning before the Conference Kick-Off by saying “hallo” to some '
                  'of Berlin’s most famous sites! This hop-on/hop-off bus tour will let you see the glass '
                    'dome of the Reichstag, the grandeur of the Brandenburg Gate, and the world-famous '
                  'murals painted on remnants of the Berlin Wall.\n\n',
                        style: TextStyle(
                          fontSize: 14,
                        ),
                      ),
                      TextSpan(
                        text: '   • Members: \$55\n'
                            '   • Non-Members: \$70\n',
                        style: TextStyle( fontSize: 14 ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          ExpansionTile(
            title: Text('Overnight Trip: A Taste of Lauscha',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            subtitle: Text('Sunday, May 19 - Monday, May 20'),
            children: <Widget>[
              ListTile(
                contentPadding: EdgeInsets.fromLTRB(24,4,20,4),
                title: Text('Pick up and Drop Off at Radisson Park Inn Alexanderplatz\n',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                ),
                subtitle: RichText(
                  text: TextSpan(
                    style: Theme.of(context).textTheme.headline6,
                    children: [
                      const TextSpan(
                        text: 'The glassy fun continues after the conference! Take an overnight trip to one of '
                            'Germany’s historic glass hideaways! Led by Marcie Davis, this behind-the-scenes '
                            'tour will take you into several flameworking studios in this charming German '
                            'village.\n\nDetails: Nestled in the foothills of the Thüringen Wald lies the '
                  'glassmaking village of Lauscha. For over 400 years, this tiny town of 3,500 residents has '
                  'been creating astonishing works in glass, with a more profound influence on the world '
                  'glass scene than its diminutive size would suggest. Blown stags, sculpted red devils, '
                  'wedding goblets, and vessels of all sorts are regional specialties. The tremendously '
                    'complex and magnificent montage technique originated here, and it’s hard to believe that '
                    'more than 50 separate sections of tubing can be combined into one 12” vase!  As the '
                    'birthplace of blown Christmas ornaments, Lauscha provides the world with sparkling '
                    'hand-silvered joy, and at one time their ornaments made up 95% of the decorations on '
                  'American Christmas trees. You’ll spend time enjoying demos at the home studios of a '
                  'variety of local artists, have a guided tour of Farbglashütte Lauscha, the famed '
                  'Lauscha factory where rods, tubes, and decorative glassware are made, and be inspired '
                  'by the works on display at the world-class Museum für Glas Kunst. You’ll have the '
                  'opportunity to create your own mold blown hand-silvered ornament during our time with '
                  'Michael Haberland, a third generation Christbaumschmuck maker. You will also dine on '
                    'tasty local fare, enjoy the hospitality of the some of the warmest, kookiest and most '
                    'talented folks on earth, and spend a memorable evening at the Gollo, the local pub where '
                    'the magic of Lauscha happens! It’s a trip you will never forget. Hotel, breakfast, lunches, '
                    'dinner and admission to all venues and activities are included. You may want to bring a '
                  'spare suitcase for the glass you will assuredly want to bring home!\n\nNote: Lauscha is a '
                  'very hilly location where the ability to walk up steps is often necessary. It is '
                  'unfortunately not handicapped accessible. Please bear this in mind. For information '
                  'regarding transportation from Berlin to Lauscha, contact marciedavis@mac.com for details.',
                        style: TextStyle(
                          fontSize: 14,
                        ),
                      ),
                      TextSpan(
                        text: '   • Members: \$450\n'
                            '   • Non-Members: \$550\n',
                        style: TextStyle( fontSize: 14 ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),*/
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
                        text: '2024 JURORS:\n',
                        style: TextStyle( fontSize: 14, fontWeight: FontWeight.w500 ),
                      ),
                      WidgetSpan(
                          child: Container(
                            padding: EdgeInsets.fromLTRB(12,0,0,0),
                            child: Text('• Carolyn Herrera-Perez, Curator, USA\n'
                                '• Katherine Huskie, Artist, UK\n'
                                '• Richard Meitner, Artist, The Netherlands\n',
                                style: TextStyle( fontSize: 14 )),
                          )
                      ),
                      TextSpan(
                        text: '\nThe GAS Member Exhibition is generously supported by The Glass Furnace.\n',
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
                        text: '2024 JURORS:\n',
                        style: TextStyle( fontSize: 14, fontWeight: FontWeight.w500),
                      ),
                      WidgetSpan(
                          child: Container(
                            padding: EdgeInsets.fromLTRB(12,0,0,0),
                            child: Text('• Jens Pfeifer, Artist, The Netherlands\n'
                                '• Alyssa Rose Radtke, Artist, USA\n'
                                '• Leo Tecosky, Artist, USA\n',
                                style: TextStyle( fontSize: 14 )),
                          )
                      ),
                      TextSpan(
                        text: '\nThe GAS Student Exhibition is generously supported by Warm Glass UK.\n',
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
                        text: '2024 JURORS:\n',
                        style: TextStyle( fontSize: 14, fontWeight: FontWeight.w500),
                      ),
                      WidgetSpan(
                          child: Container(
                            padding: EdgeInsets.fromLTRB(12,0,0,0),
                            child: Text('• Hannah Gibson, Artist, UK\n'
                                '• Riikka Latva-Somppi, Artist, Researcher + Curator, Finland\n'
                                '• Paul Musgrove, Artist + Gallery Owner, Scotland\n'
                                '• Ivan Bestari Minar Pradipta, Artist + Designer, Indonesia\n',
                                style: TextStyle( fontSize: 14 )),
                          )
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
          children: <Widget>[
            GestureDetector(
            onTap: _launchURL,
            child: Image.asset(
              'images/GAS Berlin Splash - logo only.png',
              width: 600,
              //height: 130,
              fit: BoxFit.contain,
              alignment: Alignment.center,
            ),
            ),
        textSection,
        myDivider,
        buildTitleWidget(GASMarketTitle, GASMarketText),
        Container(
          margin: EdgeInsets.fromLTRB(24,0,20,0),
          child: GASMarketContent,
        ),
        myDivider,
        buildTitleWidget(specialEventsTitle, specialEventsText),
        Container(
          margin: EdgeInsets.fromLTRB(24,0,20,0),
          child: specialEventsContent,
        ),
        myDivider,
        buildTitleWidget(activitiesTitle, activitiesText),
        Container(
          margin: EdgeInsets.fromLTRB(24,0,20,0),
          child: activitiesContent,
        ),
        myDivider,
        buildTitleWidget(middayInteractiveTitle, middayInteractiveText),
      Container(
        margin: EdgeInsets.fromLTRB(24,0,20,0),
        child: middayInteractiveProgrammingContent, // <-- Maybe put these on collapsible
      ),
        myDivider,
        buildTitleWidget(exhibitionsTitle, exhibitionsText),
        Container(
          margin: EdgeInsets.fromLTRB(24,0,20,0),
          child: exhibitionsContent,
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