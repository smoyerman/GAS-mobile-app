import '../main.dart';

/* BuildEventItem(this.eventStartDateTime, this.eventEndDateTime, this.eventTitle,
  this.eventLocation, this.eventInclusion, this.eventDescription); */

List<BuildEventItem> EventList = [
  BuildEventItem(DateTime.parse('2024-05-15 09:30:00Z'), DateTime.parse('2024-05-15 17:00:00Z'),
      "GAS Market", "Wilhelm Hallen", "Free to the public",
      "Thank you to our GAS Market Sponsor, TGK. The GAS Market gathers the best vendors, "
          "educational organizations, and more into one easily browsable marketplace."),

  BuildEventItem(DateTime.parse('2024-05-16 09:30:00Z'), DateTime.parse('2024-05-16 17:00:00Z'),
      "GAS Market", "Wilhelm Hallen", "Free to the public",
      "Thank you to our GAS Market Sponsor, TGK. The GAS Market gathers the best vendors, "
          "educational organizations, and more into one easily browsable marketplace."),

  BuildEventItem(DateTime.parse('2024-05-17 09:30:00Z'), DateTime.parse('2024-05-17 17:00:00Z'),
      "GAS Market", "Wilhelm Hallen", "Free to the public",
      "Thank you to our GAS Market Sponsor, TGK. The GAS Market gathers the best vendors, "
          "educational organizations, and more into one easily browsable marketplace."),

  BuildEventItem(DateTime.parse('2024-05-18 09:30:00Z'), DateTime.parse('2024-05-18 15:00:00Z'),
      "GAS Market", "Wilhelm Hallen", "Free to the public",
      "Thank you to our GAS Market Sponsor, TGK. The GAS Market gathers the best vendors, "
          "educational organizations, and more into one easily browsable marketplace."),

  BuildEventItem(DateTime.parse('2024-05-15 15:30:00Z'), DateTime.parse('2024-05-15 16:30:00Z'),
      "First Timers Meetup", "GAS Market at Wilhelm Hallen", "Included with Pass",
      "Meet fellow first-time conference attendees with GAS Board members! Look at the conference "
          "schedule, ask questions, and get excited for the conference."),


  /* TODO:  FIND LOCATION!!!! */
  BuildEventItem(DateTime.parse('2024-05-15 15:30:00Z'), DateTime.parse('2024-05-15 16:30:00Z'),
      "International Meet-Up", "Location TBD", "Included with Pass",
      "Join us for an enriching opportunity to connect and collaborate with members of "
          "the European Task Force. Explore all facets of Europe's glass scene, join in "
          "discussions, share knowledge, and foster stronger community bonds "
          "toward shaping our collective future."),
  BuildEventItem(DateTime.parse('2024-05-16 12:00:00Z'), DateTime.parse('2024-05-16 14:00:00Z'),
      "International Meet-Up", "Location TBD", "Included with Pass",
      "Join us for an enriching opportunity to connect and collaborate with members of "
          "the European Task Force. Explore all facets of Europe's glass scene, join in "
          "discussions, share knowledge, and foster stronger community bonds "
          "toward shaping our collective future."),
  BuildEventItem(DateTime.parse('2024-05-17 12:00:00Z'), DateTime.parse('2024-05-17 14:00:00Z'),
      "International Meet-Up", "Location TBD", "Included with Pass",
      "Join us for an enriching opportunity to connect and collaborate with members of "
          "the European Task Force. Explore all facets of Europe's glass scene, join in "
          "discussions, share knowledge, and foster stronger community bonds "
          "toward shaping our collective future."),
  BuildEventItem(DateTime.parse('2024-05-18 12:00:00Z'), DateTime.parse('2024-05-18 14:00:00Z'),
      "International Meet-Up", "Location TBD", "Included with Pass",
      "Join us for an enriching opportunity to connect and collaborate with members of "
          "the European Task Force. Explore all facets of Europe's glass scene, join in "
          "discussions, share knowledge, and foster stronger community bonds "
          "toward shaping our collective future."),

  BuildEventItem(DateTime.parse('2024-05-15 17:00:00Z'), DateTime.parse('2024-05-15 20:00:00Z'),
      "Conference Kick-Off", "Wilhelm Hallen", "Included with Pass",
      "We welcome all conference attendees, presenters, and partners to join us as we launch Berlin 2024 "
          "and pay tribute to members of our community. Cash bar + food trucks on site."),

  BuildEventItem(DateTime.parse('2024-05-15 17:00:00Z'), DateTime.parse('2024-05-15 20:00:00Z'),
      "Exhibition Opening", "Wilhelm Hallen", "Included with Pass",
      "Explore the talent of GAS Members and students at the opening for CONNECTIONS 2024 and "
          "EVOLUTION 2024, our annual juried exhibitions."),

  BuildEventItem(DateTime.parse('2024-05-16 10:00:00Z'), DateTime.parse('2024-05-15 12:00:00Z'),
      "Kids Oasis at Berlin Glas", "Berlin Glas Garden at Provinzstraße Conference Hub", "Included with Pass",
      "Enjoy a free kids’ area with daily programming sponsored by Berlin Glas Youth Outreach! Children "
          "aged 7 and up can be signed in for programming during open hours while parents view "
          "demonstrations. Children age 6 and under must be accompanied by parent or guardian."),

  BuildEventItem(DateTime.parse('2024-05-16 14:00:00Z'), DateTime.parse('2024-05-15 17:00:00Z'),
      "Kids Oasis at Berlin Glas", "Berlin Glas Garden at Provinzstraße Conference Hub", "Included with Pass",
      "Enjoy a free kids’ area with daily programming sponsored by Berlin Glas Youth Outreach! Children "
          "aged 7 and up can be signed in for programming during open hours while parents view "
          "demonstrations. Children age 6 and under must be accompanied by parent or guardian."),

  BuildEventItem(DateTime.parse('2024-05-17 10:00:00Z'), DateTime.parse('2024-05-17 12:00:00Z'),
      "Kids Oasis at Berlin Glas", "Berlin Glas Garden at Provinzstraße Conference Hub", "Included with Pass",
      "Enjoy a free kids’ area with daily programming sponsored by Berlin Glas Youth Outreach! Children "
          "aged 7 and up can be signed in for programming during open hours while parents view "
          "demonstrations. Children age 6 and under must be accompanied by parent or guardian."),

  BuildEventItem(DateTime.parse('2024-05-17 14:00:00Z'), DateTime.parse('2024-05-17 17:00:00Z'),
      "Kids Oasis at Berlin Glas", "Berlin Glas Garden at Provinzstraße Conference Hub", "Included with Pass",
      "Enjoy a free kids’ area with daily programming sponsored by Berlin Glas Youth Outreach! Children "
          "aged 7 and up can be signed in for programming during open hours while parents view "
          "demonstrations. Children age 6 and under must be accompanied by parent or guardian."),

  BuildEventItem(DateTime.parse('2024-05-18 10:00:00Z'), DateTime.parse('2024-05-18 12:00:00Z'),
      "Kids Oasis at Berlin Glas", "Berlin Glas Garden at Provinzstraße Conference Hub", "Included with Pass",
      "Enjoy a free kids’ area with daily programming sponsored by Berlin Glas Youth Outreach! Children "
          "aged 7 and up can be signed in for programming during open hours while parents view "
          "demonstrations. Children age 6 and under must be accompanied by parent or guardian."),

  BuildEventItem(DateTime.parse('2024-05-18 14:00:00Z'), DateTime.parse('2024-05-18 17:00:00Z'),
      "Kids Oasis at Berlin Glas", "Berlin Glas Garden at Provinzstraße Conference Hub", "Included with Pass",
      "Enjoy a free kids’ area with daily programming sponsored by Berlin Glas Youth Outreach! Children "
          "aged 7 and up can be signed in for programming during open hours while parents view "
          "demonstrations. Children age 6 and under must be accompanied by parent or guardian."),

  BuildEventItem(DateTime.parse('2024-05-16 09:00:00Z'), DateTime.parse('2024-05-16 17:00:00Z'),
      "Green Pavilion", "Near Wilhelm Hallen Biergarten", "Free to the public",
      "Curious about green ways of working with glass? Come to our Green Pavilion to see furnaces "
          "using recycled glass, explore green resources, and see TRACE 2024, our annual juried green exhibition."),

  BuildEventItem(DateTime.parse('2024-05-17 09:00:00Z'), DateTime.parse('2024-05-17 17:00:00Z'),
      "Green Pavilion", "Near Wilhelm Hallen Biergarten", "Free to the public",
      "Curious about green ways of working with glass? Come to our Green Pavilion to see furnaces "
          "using recycled glass, explore green resources, and see TRACE 2024, our annual juried green exhibition."),

  BuildEventItem(DateTime.parse('2024-05-18 09:00:00Z'), DateTime.parse('2024-05-18 17:00:00Z'),
      "Green Pavilion", "Near Wilhelm Hallen Biergarten", "Free to the public",
      "Curious about green ways of working with glass? Come to our Green Pavilion to see furnaces "
          "using recycled glass, explore green resources, and see TRACE 2024, our annual juried green exhibition."),

  BuildEventItem(DateTime.parse('2024-05-16 12:00:00Z'), DateTime.parse('2024-05-16 14:00:00Z'),
      "Midday Interactive Programming: Education and Institutions", "Wilhelm Hallen Main Stage", "Included with Pass",
      "Enjoy workshops by The Glass Virus and presentations by glass programs and institutions from around the world."),

  BuildEventItem(DateTime.parse('2024-05-16 13:30:00Z'), DateTime.parse('2024-05-16 15:00:00Z'),
      "Student Meet-Up", "GAS Market at Wilhelm Hallen", "Included with Pass",
      "Join your hosts, GAS Student Board Representatives Jocelyn Chan and Leia Guo, for an afternoon "
          "of networking and information sharing. Look at the conference schedule together, ask and "
          "answer questions to orient yourself to the day ahead, and find new friends to help you "
          "explore the magic of Berlin! Snacks will be provided. Attend the Student Meet-Up and "
          "Conference Kick Off to receive tickets for our student-exclusive giveaway! Each student "
          "can have up to three tickets to win fabulous prizes like gift cards, color, and tools from "
          "our generous donors. Prizes will be drawn and announced at the Flame Off at Monopol on Friday night."),

  BuildEventItem(DateTime.parse('2024-05-16 17:30:00Z'), DateTime.parse('2024-05-16 20:30:00Z'),
      "Film Festival Opening", "Wilhelm Hallen Main Stage", "Included with Pass",
      "Lights, camera, action: enjoy our Film Festival opening and explore the ways glass artists and "
          "filmmakers are combining glass and film! The Film Festival was juried by Ayana Morris of "
          "Newark Moonlight Cinema and the GAS Board and Staff. Learn more about all the Film Festival "
          "entries by scanning the QR code.\n\nSelections from our Film Festival will be screened at "
          "Wilhelm Hallen on Friday from 11:30–14:00 and Saturday from 12:00-16:30."),

  BuildEventItem(DateTime.parse('2024-05-16 17:00:00Z'), DateTime.parse('2024-05-16 20:00:00Z'),
      "Trunk Show", "Wilhelm Hallen Main Stage", "Free to the public",
      "All that glitters is glass! Up your jewelry game by purchasing your new favorite "
          "piece at our jewelry trunk show. Artists with jewelry for sale include: Jeanne-Sophie "
          "Aas, Noa Agasi, Ivan Bestari, William Rudy Faulkner, Nathalie Fluckinger, Jason Hitchcock, "
          "and Katherine Huskie."),

  BuildEventItem(DateTime.parse('2024-05-17 12:00:00Z'), DateTime.parse('2024-05-17 14:00:00Z'),
      "Portfolio Review", "Educational Resource Area at Wilhelm Hallen", "Included with Pass",
      "Curators, educators, and artists will be available to review portfolios of GAS conference "
          "attendees. Reviews will last 20-30 minutes each, and a limited number of slots will be "
          "available on a walk-up, first-come, first-served basis. A waiting list will be kept in "
          "case of cancellations. Special thanks to this year’s reviewers: Michael Endo, Caroline "
          "Madden, Scott Chaseling, Natali Rodrigues, Angel Monzon. "),

  BuildEventItem(DateTime.parse('2024-05-17 15:30:00Z'), DateTime.parse('2024-05-17 17:00:00Z'),
      "Goblet Grab + Sip", "Educational Resource Area at Wilhelm Hallen", "Included with Pass",
      "Always fast-paced and full of entertainment, the Goblet Grab is a fun and funky conference "
          "tradition that never fails to generate excitement! Open to the public during the "
          "conference, donations and purchases from this event help us to support the ongoing "
          "operations of GAS all year long.\n\nDrinking vessel donations may be made in "
          "person at the Registration Desk in Wilhelm Hallen on Wednesday and Thursday "
          "from 9:00–16:00 and Friday from 9:00–14:00."),

  BuildEventItem(DateTime.parse('2024-05-17 12:00:00Z'), DateTime.parse('2024-05-17 14:00:00Z'),
      "Midday Interactive Programming: Career and Small Business Development",
      "Wilhelm Hallen Main Stage", "Included with Pass",
      "Learn about how to develop your career or small business. Anna Mlasowsky will hold a "
          "roundtable discussion on career development. Anne Kenealy will host a workshop on grant "
          "writing. This workshop will require advanced sign-ups."),

  BuildEventItem(DateTime.parse('2024-05-17 17:30:00Z'), DateTime.parse('2024-05-17 20:00:00Z'),
      "Flame Off",
      "Monopol Flame Shop", "Included with Pass",
      "Get your flame on at Monopol as flameworkers take the stage."),

  BuildEventItem(DateTime.parse('2024-05-18 12:00:00Z'), DateTime.parse('2024-05-18 14:00:00Z'),
      "Midday Interactive Programming: Self Care and Wellness",
      "Wilhelm Hallen Main Stage", "Included with Pass",
      "Close out a busy conference with programming centered around self-care and wellness! "
          "Hannah Guisewhite will be teaching ways for glassmakers to take care of their bodies."),

  BuildEventItem(DateTime.parse('2024-05-18 12:00:00Z'), DateTime.parse('2024-05-18 13:30:00Z'),
      "Research Presentations",
      "Wilhelm Hallen Main Stage", "Included with Pass",
      "Hear from glass artists and scholars about their current projects in these ten-minute research "
          "presentations! Presenters include: Andrea da Ponte, Sara Hulkkonen, Mark Hursty, "
          "Riikka Latva-Somppi, Michael J Souza, and Franca Tasch."),

  BuildEventItem(DateTime.parse('2024-05-18 19:30:00Z'), DateTime.parse('2024-05-18 24:00:00Z'),
      "Closing Night Party",
      "Alte Münze | Molkenmarkt 2", "Included with Pass; Additional tickets available for \$50",
      "Help us close out our 2024 Conference in style!"),

];