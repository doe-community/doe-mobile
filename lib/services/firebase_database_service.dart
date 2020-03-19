import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doe/models/base_entity.dart';

abstract class FirebaseDatabaseService {
  Firestore getInstance();
  Future<void> save(collection, BaseEntity data);
  getDocument(collection, document);
  getDocumentEqualTo(collection, field, value);
  getUserProfile(userId);
  getUserDeviceToken(userId);
}

class FireBaseDatabaseServiceImpl implements FirebaseDatabaseService{

  Firestore _firestore = Firestore.instance;

  getInstance(){
    return _firestore;
  }

  @override
  Future<void> save(collection, BaseEntity data) async{///Data should be in json format
    await _firestore
              .collection(collection)
              .reference()
              .document()
              .setData(data.toJson());
  }

  getDocument(collection, document){
  return _firestore
            .collection(collection)
            .document(document);
  }

  getDocumentEqualTo(collection, field, value){
  return _firestore
            .collection(collection)
            .where(field, isEqualTo: value);
  }

  getUserProfile(userId){
    _firestore.collection('profiles')
              .document(userId);
  }

  getUserDeviceToken(userId){
    return _firestore.collection('profiles')
              .document(userId)
              .collection('tokens');
  }

}