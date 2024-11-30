import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:map_launcher/map_launcher.dart';
import './main.dart';

const String APP_TITLE = "2025 GAS Conference";
const String LOGO_IMAGE = "images/GAS Texas Splash - logo.png";
const String CONF_DATES = "Wednesday, May 14 – Saturday, May 17, 2025";
const String CONF_LOC = "Arlington and Fort Worth, Texas";

/* ========== LOCATION MAP VARIABLES ============ */
LatLng center = const LatLng(52.5500, 13.3900);
var zoom = 12.5;

List<Map> PartyLocations = [
  {
    "latlng": const LatLng(52.5161321, 13.4090756),
    "title": "Alte Münze",
    "description": "Closing Party",
    "coords": Coords(52.5161321, 13.4090756)
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

List<Map> GASLocations = [
  {
    "latlng": const LatLng(52.5795127, 13.3632827),
    "title": "Wilhelm Hallen",
    "description": "Conference Center",
    "address": "Kopenhagener Str. 60-72, 13407 Berlin, Germany",
    "website": "https://wilhelm-hallen.de/",
    "coords": Coords(52.5795127, 13.3632827)
  },

  /*{"latlng": const LatLng(52.5680135,13.3766501),
    "title": "Monopol", "description": "Industrial Conference Cite",
  "address": "Provinzstraße 40-44, 13409 Berlin, Germany",
  "website": "https://monopol-berlin.com/en"},*/

  {
    "latlng": const LatLng(52.567906, 13.380952),
    "title": "Berlin Glas and Provinzstraße Hub",
    "description": "Conference Studio",
    "address": "Provinzstraße 42a, 13409 Berlin, Germany",
    "website": "https://berlinglassworks.com/",
    "coords": Coords(52.567906, 13.380952)
  },
];

List<Map> HotelLocations = [
  {
    "latlng": const LatLng(52.523125, 13.4127656),
    "title": "Park Inn by Radisson",
    "description": "Conference Hotel",
    "address": "Alexanderpl. 7, 10178 Berlin, Germany",
    "website":
        "https://www.radissonhotels.com/en-us/hotels/park-inn-berlin-alexanderplatz",
    "coords": Coords(52.523125, 13.4127656)
  },
  {
    "latlng": const LatLng(52.5624676, 13.3752243),
    "title": "Nena Hostel Berlin",
    "description": "Conference Hotel",
    "address": "Provinzstraße 16 Berlin, Germany",
    "website":
        "https://www.nena-apartments.de/en/locations/berlin/nena-hostel-berlin-mitte/",
    "coords": Coords(52.5624676, 13.3752243)
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
