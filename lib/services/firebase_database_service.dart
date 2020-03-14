import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doe/models/base_entity.dart';

abstract class FirebaseDatabaseService {
  Future<void> save(collection, BaseEntity data);

}

class FireBaseDatabaseServiceImpl implements FirebaseDatabaseService{

  Firestore _firestore = Firestore.instance;

  @override
  Future<void> save(collection, BaseEntity data) async{///Data should be in json format
    await _firestore
              .collection(collection)
              .document()
              .setData(data.toJson());
  }

}