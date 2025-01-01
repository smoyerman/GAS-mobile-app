import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:map_launcher/map_launcher.dart';
import 'package:url_launcher/url_launcher.dart';
import './main.dart';

/* ========== LOCATION MAP VARIABLES ============ */
LatLng center = const LatLng(32.7480372, -97.1000684);
var zoom = 12.0;

List<Map> PartyLocations = [
  {
    "latlng": const LatLng(32.7552354, -97.0819481),
    "title": "Arlington Museum of Art",
    "description": "Closing Night Party",
    "coords": Coords(32.7552354, -97.0819481)
  },
];

List<Map> MetroLocations = [
  {
    "latlng": const LatLng(52.52151, 13.41127),
    "title": "Alexanderplatz Station",
    "description": "For Conference Hotel",
    "coords": Coords(52.52151, 13.41127)
  },
  {
    "latlng": const LatLng(52.5712685, 13.3814606),
    "title": "Schönholz Station",
    "description": "For Berlin Glas + Provinzstraße Hub",
    "coords": Coords(52.5712685, 13.3814606)
  },
  {
    "latlng": const LatLng(52.5813932, 13.3603597),
    "title": "Wilhelmsruh Station",
    "description": "For Wilhelm Hallen",
    "coords": Coords(52.5813932, 13.3603597)
  },
];

List<Map> GASVenues = [
  {
    "latlng": const LatLng(32.7288676, -97.1274937),
    "title": "Studio Arts Center",
    "description": "Conference Center",
    "address": "800-880 S Davis Dr, Arlington, TX 76013",
    "website":
        "https://www.uta.edu/academics/schools-colleges/liberal-arts/departments/art/department-info/facilities-maps",
    "coords": Coords(32.7288676, -97.1274937),
    "activities": [
      "Conference Kick Off Demo",
      "Hot Demos",
      "Neon Demos",
      "Kiln Lecmos",
      "Cold Demos"
    ],
    "logo": "images/Venues/UTA_logo.jpg",
  },
  {
    "latlng": const LatLng(32.7327592, -97.1196281),
    "title": "University Commons",
    "description": "Conference Center",
    "address": "440 S Nedderman Dr, Arlington, TX 76013",
    "website": "https://www.uta.edu/campus-ops/student-centers/the-commons",
    "coords": Coords(32.7327592, -97.1196281),
    "activities": [
      "Registration",
      "GAS Office",
      "GAS Market",
      "Lectures",
      "Panels",
      "Midday Interactive Programming",
      "Portfolio Review",
      "More TBD"
    ],
    "logo": "images/Venues/UTA_logo.jpg",
  },
  {
    "latlng": const LatLng(32.7305006, -97.1177137),
    "title": "Fine Arts Building",
    "description": "Conference Center",
    "address": "700 Greek Row Dr, Arlington, TX 76013",
    "website":
        "https://www.uta.edu/academics/schools-colleges/liberal-arts/departments/art/department-info/facilities-maps",
    "coords": Coords(32.7305006, -97.1177137),
    "activities": [
      "Film Festival",
      "Exhibitions",
      "Goblet Grab",
      "Jewelry Trunk Show"
    ],
    "logo": "images/Venues/UTA_logo.jpg",
  },
  {
    "latlng": const LatLng(32.7296875, -97.1154709),
    "title": "Central Library",
    "description": "Conference Center",
    "address": "702 Planetarium Pl, Arlington, TX 76019",
    "website": "https://libraries.uta.edu/locations/cen",
    "coords": Coords(32.7296875, -97.1154709),
    "activities": ["Lecmos", "Recharge Station"],
    "logo": "images/Venues/UTA_logo.jpg",
  },
  {
    "latlng": const LatLng(32.7297044, -97.1182826),
    "title": "Texas Hall",
    "description": "Conference Center",
    "address": "701 W Nedderman Dr, Arlington, TX 76010",
    "website": "https://www.uta.edu/texashall/",
    "coords": Coords(32.7297044, -97.1182826),
    "activities": ["Conference Kick Off"],
    "logo": "images/Venues/UTA_logo.jpg",
  },
  {
    "latlng": const LatLng(32.7385012, -97.1536396),
    "title": "Grey Area Studio",
    "description": "Conference Center",
    "address": "401 N Bowen Rd, Arlington, TX 76012",
    "website": "https://www.uta.edu/texashall/",
    "coords": Coords(32.7385012, -97.1536396),
    "activities": ["Flame Demos", "Flame Performance"],
    "logo": "images/Venues/grayarea_logo.png",
  },
];

List<Map> HotelLocations = [
  {
    "latlng": const LatLng(32.7605796, -97.0590384),
    "title": "Crowne Plaza Suites Arlington",
    "description": "Conference Hotel",
    "address": "2700 E Lamar Blvd, Arlington, TX 76011",
    "website":
        "https://www.ihg.com/crowneplaza/hotels/us/en/arlington/dalcp/hoteldetail?fromRedirect=true&qSrt=sBR&qIta=99801505&icdv=99801505&qSlH=DALCP&qGrpCd=GLA&setPMCookies=true&qSHBrC=CP&qDest=2700%20E.%20Lamar%20Boulevard%2C%20Arlington%2C%20TX%2C%20US&srb_u=1",
    "coords": Coords(32.7605796, -97.0590384),
    "logo": "images/Accomodations/crown_plaza_logo.png",
    "blurb":
        """The official conference hotel is the Crowne Plaza Arlington. Book your stay at \$140/night with breakfast included. Every room in our conference hotel is a suite that includes a living room and restrooms within the suites are accessible."""
  },
];

List<Map> Contacts = [
  {
    "title": "Emergency services",
    "description": "",
    "address": "",
    "phone": "112",
    "website": ""
  },
  {
    "title": "Police",
    "description": "",
    "address": "",
    "phone": "110",
    "website": ""
  },
  {
    "title": "Park Inn by Radisson",
    "description": "Conference Hotel",
    "address": "Alexanderpl. 7, 10178 Berlin, Germany",
    "phone": "+49 3023890",
    "website": ""
  },
  {
    "title": "Nena Hostel Berlin",
    "description": "Conference Hotel",
    "address": "Provinzstraße 16 Berlin, Germany",
    "phone": "+49 30 9940560",
    "website": ""
  },
];

/* ================ SPONSOR PHOTOS ===================== */
final List<PhotoItem> items = [
  PhotoItem("images/Sponsors/MadVerre-logo-sqare-300x300.webp",
      "MAD Verre & Equipments Logo", "https://mve-france.fr/en/shop/"),
  PhotoItem("images/Sponsors/big_logo_berlinglas-768x768.webp",
      "Berlin Glas e.V Logo", "https://berlinglas.org/home/"),
  PhotoItem("images/Sponsors/Bocci-Logotype-digital-black-e1701795014484.webp",
      "Bocci Glass Logo", "https://bocci.com/"),
  PhotoItem("images/Sponsors/OCR-Circle-Logo-298x300.webp",
      "Olympic Color Rods Logo", "https://glasscolor.com/"),
  PhotoItem("images/Sponsors/Warm-Glass-UK-logo-300x300.webp",
      "Warm Glass UK Logo", "https://warm-glass.co.uk/"),
  PhotoItem("images/Sponsors/Glass-Furnace-768x157.jpg",
      "The Glass Furnace Logo", "https://glassfurnace.org/"),
  PhotoItem("images/Sponsors/TGK-Logo_1000_1000-300x300.webp", "TGK Logo",
      "https://www.tgk.de/en/"),
  PhotoItem(
      "images/Sponsors/Reichenbach-Logo-mit-MZ--150x150.jpg",
      "Reichenbach Glass Logo",
      "https://glasscolor.com/glass-products/blowing-colors/reichenbach-colors"),
  PhotoItem("images/Sponsors/Monopol logo sq.png", "Monopol Logo",
      "https://monopol-berlin.com/de"),
  PhotoItem("images/Sponsors/Wilhelm Studios.png", "Wilhelm Studios Logo",
      "https://www.wilhelmstudios.de/"),
  PhotoItem("images/Sponsors/Flame Off.png", "Flame Off Logo",
      "https://www.facebook.com/p/Flame-Off-France-100067843531369/"),
  PhotoItem("images/Sponsors/the_LR_logo_24.jpg", "Lathe Riders Logo",
      "https://www.instagram.com/the_latheriders/?hl=es"),
  PhotoItem("images/Sponsors/logo_niesenglass_big.png", "Niesen Glass Logo",
      "https://niesenglass.ch/"),
  PhotoItem(
      "images/Sponsors/bomma_1.png", "Bomma Logo", "https://www.bomma.cz/"),
  PhotoItem("images/Sponsors/Screenshot 2024-04-30 at 4.44.07 PM.png",
      "Thomas Wendler Studios Logo", "https://neonardo.berlin/"),
];

/* ================ MARKET PHOTOS AND INFO ===================== */
// MarketItem(this.image, this.name, this.website, this.contact, this.email)
final List<MarketItem> marketItems = [
  MarketItem(
      "images/Sponsors/TGK-Logo_1000_1000-300x300.webp",
      "TGK",
      "https://www.tgk.de/en/",
      "Martina Zerwer",
      "martina.zerwer@tgk.de",
      "tgk.gmbh"),
  MarketItem(
      "images/Market/ocean-logo.png",
      "Oceanside Glass and Tile",
      "https://www.glasstile.com/",
      "Martina Zerwer",
      "pbartholomew@glasstile.com",
      "oceansideglasstile"),
  MarketItem(
      "images/Sponsors/MadVerre-logo-sqare-300x300.webp",
      "MAD Verre & Equipments",
      "https://mve-france.fr/en/shop/",
      "Judith Roux",
      "judith-roux@protonmail.com",
      "mad_verre_et_equipements"),
  MarketItem(
      "images/Market/adam-pyrometrie-logo.jpeg",
      "Adam Pyrometrie",
      "https://www.adampyrometrie.com/",
      "Frederic Demoisson",
      "judith-roux@protonmail.com",
      "adampyrometrie"),
  MarketItem("images/Market/bomma-glass.png", "Bomma", "https://www.bomma.cz/",
      "Aneta Hoffmannova", "a.hoffmannova@bomma.cz", "bomma_cz"),
  MarketItem(
      "images/Sponsors/Glass-Furnace-768x157.jpg",
      "Glass Furnace",
      "https://glassfurnace.org/",
      "Yilmaz Yalcinkaya",
      "elif@glassfurnace.org",
      "camocagi_theglassfurnace"),
  MarketItem(
      "images/Market/hot-glass-color.png",
      "Hot Glass Color",
      "https://hotglasscolor.com/",
      "Cyrena Stefano",
      "cyrena@hotglasscolor.com",
      "hotglasscolorandsupply"),
  MarketItem(
      "images/Market/Logo-nagy-fehér.png",
      "Rozetta Uvegstudio Bt.",
      "http://rozettastudio.hu/",
      "Jozsef Hofecker",
      "info@rozetta.hu",
      "jozsef1142"),
  MarketItem(
      "images/Market/Glasma_Logo_Light.png",
      "Glasma",
      "https://glasma.com/",
      "Martin Andersson",
      "martin.andersson@glasma.com",
      "studioglassbatch"),
  MarketItem(
      "images/Market/berlin-beads.png",
      "Berlin Beads",
      "https://www.berlinbeads.de",
      "Bouchra Oualla",
      "info@berlinbeads.de",
      "berlinbeads"),
  MarketItem(
      "images/Market/Maruko-Tools.jpg",
      "Maruko Tools",
      "https://marukotools.com/index.html",
      "Kotone Ninagawa",
      "kninagawa.edu@gmail.com",
      "marukotools45c"),
  MarketItem(
      "images/Market/cmog-logo.png",
      "Corning Museum of Glass",
      "https://home.cmog.org/",
      "Megan Mathie",
      "seamanhe@cmog.org",
      "corningmuseum"),
  MarketItem(
      "images/Market/canned-heat.webp",
      "Canned Heat",
      "https://www.cannedheatglass.com/",
      "Cheyenne Malcolm",
      "vetrovita@gmail.com",
      "cannedheat1"),
  MarketItem(
      "images/Market/rath-llc.jpeg",
      "Rath LLC",
      "https://www.rath-group.com/en/",
      "Kenneth Domann",
      "kenneth.domann@rath-group.com",
      ""),
  MarketItem(
      "images/Market/Eugeniusz.png",
      "The Eugeniusz Geppert Academy of Art and Design in Wroclaw",
      "www.asp.wroc.pl/en",
      "Marta Płonka",
      "prornauk@asp.wroc.pl",
      "asp_wroclaw"),
  MarketItem("images/Sponsors/Warm-Glass-UK-logo-300x300.webp", "Warm Glass UK",
      "www.warm-glass.co.uk", "", "info@warm-glass.co.uk", "warmglassuk"),
];

/* ================================ */
