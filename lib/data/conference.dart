import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:map_launcher/map_launcher.dart';
import 'package:url_launcher/url_launcher.dart';
import '.././main.dart';

/********* BASIC CONFERENCE INFORMATION **********/
const String APP_TITLE = "2025 GAS Conference";
const String LOGO_IMAGE = "images/GAS Texas Splash - logo.png";
const String CONF_TAGLINE = "Trailblazing New Traditions";
const String CONF_DATES = "Wednesday, May 14 – Saturday, May 17, 2025";
const String CONF_LOC = "Arlington and Fort Worth, Texas";
const String CONF_DESC =
    """Join members of the global glass community as we take the innovations of the present and transform them into the glassmaking traditions of the future! At the world-class facilities at the University of Texas at Arlington, conference attendees will have a unique opportunity to enjoy presentations that cover every facet of glassmaking in conversation with other artistic materials like prints and metal. The Arlington-Fort Worth glass community is a tight-knit network of glass organizations dedicated to uplifting each other, promoting all forms of diversity and inclusion, and exploring the latest innovations in glassmaking.""";

Widget ImageHeader = GestureDetector(
  onTap: _launchURL,
  child: Image.asset(
    LOGO_IMAGE,
    width: 900,
    //height: 130,
    fit: BoxFit.fitWidth,
    alignment: Alignment.center,
  ),
);

_launchURL() async {
  const url = "https://www.glassart.org/conference/berlin-2024/";
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
