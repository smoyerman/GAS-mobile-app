import 'package:cloud_firestore/cloud_firestore.dart';
import './../data_structures.dart';

/* ========== Firestore Variables ============ */
const String PRESENTER_COLLECTION_REF = "presenters";
const String EVENT_COLLECTION_REF = "events";
const String PRESENTATIONS_COLLECTION_REF = "presentations_2025";

class DatabaseService {
  final _firestore = FirebaseFirestore.instance;
  late final CollectionReference _presentersRef;
  //late final CollectionReference _presentationsRef;

  DatabaseService() {
    _presentersRef = _firestore
        .collection(PRESENTER_COLLECTION_REF)
        .withConverter<Presenter>(
          fromFirestore: (snapshot, _) => Presenter.fromJson(snapshot.data()!),
          toFirestore: (presenter, _) => presenter.toJson(),
        );
  }

  Stream<QuerySnapshot> getPresenters() {
    return _presentersRef.snapshots();
  }

  // For adding a presenter to the list - likely WILL NOT need this helper
  void addPresenter(Presenter presenter) async {
    _presentersRef.add(presenter);
  }

  // For reference, updating a presenter
  // I likely will not need to do this, but will need some way to store saved / starred talks locally
  // Perhaps a single file with the IDs of all the talks
  void updatePresenter(String presenterId, Presenter presenter) {
    _presentersRef.doc(presenterId).update(presenter.toJson());
  }
}
