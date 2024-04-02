import 'dart:io';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:excel/excel.dart';
import 'package:shared_preferences/shared_preferences.dart';
import './main.dart';
import 'package:flutter/services.dart' show ByteData, rootBundle;

/* ========== LOCATION MAP VARIABLES ============ */
LatLng center = const LatLng(52.5400, 13.4000);
var zoom = 12.5;

List<Map> EventLocations =  [
  {"latlng": const LatLng(52.5400, 13.4050),
    "title": "Location 1", "description": "Yay for 1"},

  {"latlng": const LatLng(52.5000, 13.4050),
    "title": "Location 2", "description": "Yay for 1"},

  {"latlng": const LatLng(52.5300, 13.4250),
    "title": "Location 3", "description": "Yay for 1"},
];

List<Map> MetroLocations = [
  {"latlng": const LatLng(52.52151, 13.41127),
    "title": "Alexanderplatz Station",
    "description": "For Conference Hotel"},

  {"latlng": const LatLng(52.5712685,13.3814606),
    "title": "Schönholz Station",
    "description": "For Berlin Glas and Monopol"},

  {"latlng": const LatLng(52.5813932,13.3603597),
    "title": "Wilhelmsruh Station",
    "description": "For Wilhelm Hallen"},

];

List<Map> GASLocations = [
  {"latlng": const LatLng(52.5795127, 13.3632827),
    "title": "Wilhelm Hallen", "description": "Conference Center",
  "address": "Kopenhagener Str. 60-72, 13407 Berlin, Germany",
  "website": "https://wilhelm-hallen.de/"},

  {"latlng": const LatLng(52.5680135,13.3766501),
    "title": "Monopol", "description": "Industrial Conference Cite",
  "address": "Provinzstraße 40-44, 13409 Berlin, Germany",
  "website": "https://monopol-berlin.com/en"},

  {"latlng": const LatLng(52.5200, 13.3850),
    "title": "Berlin Glas", "description": "Conference Studio",
    "address": "Provinzstraße 42a, 13409 Berlin, Germany",
    "website": "https://berlinglassworks.com/"},
];

List<Map> HotelLocations = [
  {"latlng": const LatLng(52.523125,13.4127656),
    "title": "Park Inn by Radisson", "description": "Conference Hotel",
    "address": "Alexanderpl. 7, 10178 Berlin, Germany",
    "website": "https://www.radissonhotels.com/en-us/hotels/park-inn-berlin-alexanderplatz"},

  {"latlng": const LatLng(52.5624676,13.3752243),
    "title": "Nena Hostel Berlin", "description": "Conference Hotel",
    "address": "Provinzstraße 16 Berlin, Germany",
    "website": "https://www.nena-apartments.de/en/locations/berlin/nena-hostel-berlin-mitte/"},

];

List<Map> Contacts = [
  {"title": "Emergency services", "description": "",
  "address": "",
  "phone": "112",
  "website": ""},

  {"title": "Police", "description": "",
  "address": "",
  "phone": "110",
  "website": ""},

  {"title": "Park Inn by Radisson", "description": "Conference Hotel",
  "address": "Alexanderpl. 7, 10178 Berlin, Germany",
  "phone": "+49 3023890",
  "website": ""},

  {"title": "Nena Hostel Berlin", "description": "Conference Hotel",
  "address": "Provinzstraße 16 Berlin, Germany",
  "phone": "+49 30 9940560",
  "website": ""},

];

/* ================ SPONSOR PHOTOS ===================== */
final List<PhotoItem> items = [
  PhotoItem(
      "images/Sponsors/MadVerre-logo-sqare-300x300.webp",
      "MAD Verre & Equipments Logo",
      "https://mve-france.fr/en/shop/"),
  PhotoItem(
    "images/Sponsors/big_logo_berlinglas-768x768.webp",
    "Berlin Glas e.V Logo",
    "https://berlinglas.org/home/"
  ),
  PhotoItem(
      "images/Sponsors/Bocci-Logotype-digital-black-e1701795014484.webp",
      "Bocci Glass Logo",
      "https://bocci.com/"
  ),
  PhotoItem(
      "images/Sponsors/OCR-Circle-Logo-298x300.webp",
      "Olympic Color Rods Logo",
      "https://glasscolor.com/"
  ),
  PhotoItem(
      "images/Sponsors/Warm-Glass-UK-logo-300x300.webp",
      "Warm Glass UK Logo",
      "https://warm-glass.co.uk/"
  ),
  PhotoItem(
      "images/Sponsors/Glass-Furnace-768x157.jpg",
      "The Glass Furnace Logo",
      "https://glassfurnace.org/"
  ),
  PhotoItem(
      "images/Sponsors/TGK-Logo_1000_1000-300x300.webp",
      "TGK Logo",
      "https://www.tgk.de/en/"
  ),
  PhotoItem(
      "images/Sponsors/Reichenbach-Logo-mit-MZ--150x150.jpg",
      "Reichenbach Glass Logo",
      "https://glasscolor.com/glass-products/blowing-colors/reichenbach-colors"
  ),
];

//List<String> rowdetail = [];

/* ================================ */
