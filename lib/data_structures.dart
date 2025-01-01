class Event {
  Event(
      {required this.year,
      required this.title,
      required this.presenter,
      required this.location,
      required this.type,
      required this.subtype,
      required this.focus,
      required this.description,
      required this.coPresenters,
      required this.startTime,
      required this.endTime,
      required this.talkSaved});

  Event.fromJson(Map<String, Object?> json)
      : this(
          year: json['year']! as String,
          title: json['title']! as String,
          presenter: json['presenter']! as Presenter,
          location: json['location']! as String,
          type: json['type']! as String,
          subtype: json['subtype']! as String,
          focus: json['focus']! as String,
          description: json['description']! as String,
          coPresenters: json['coPresenters']! as String,
          startTime: json['startTime'] as DateTime,
          endTime: json['endTime'] as DateTime,
          talkSaved: json['talkSaved'] as bool,
        );

  final String year;
  final String title;
  final Presenter presenter;
  final String location;
  final String type;
  final String subtype;
  final String focus;
  final String description;
  final String coPresenters;
  final DateTime startTime;
  final DateTime endTime;
  bool talkSaved;

  Map<String, Object?> toJson() {
    return {
      'year': year,
      'title': title,
      'presenter': presenter,
      'location': location,
      'type': type,
      'subtype': subtype,
      'focus': focus,
      'description': description,
      'coPresenters': coPresenters,
      'startTime': startTime,
      'endTime': endTime,
      'talkSaved': talkSaved,
    };
  }
}

/************* CLASS CONSTRUCTION FROM FIREBASE ***************/
class Presenter {
  Presenter(
      {required this.fname,
      required this.lname,
      required this.pronoun,
      required this.email,
      required this.website,
      required this.handle});

  Presenter.fromJson(Map<String, Object?> json)
      : this(
          fname: json['fname']! as String,
          lname: json['lname']! as String,
          pronoun: json['pronoun']! as String,
          email: json['email']! as String,
          website: json['website']! as String,
          handle: json['handle']! as String,
        );

  final String fname;
  final String lname;
  final String pronoun;
  final String email;
  final String website;
  final String handle;

  Map<String, Object?> toJson() {
    return {
      'fname': fname,
      'lname': lname,
      'pronoun': pronoun,
      'email': email,
      'website': website,
      'handle': handle,
    };
  }
}
