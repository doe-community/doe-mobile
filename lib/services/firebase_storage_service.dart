
import 'package:firebase_storage/firebase_storage.dart';

///Farebase storage singleton 
abstract class FirebaseStorageService {
  static FirebaseStorage _instance = FirebaseStorage(storageBucket: 'gs://doei-b018d.appspot.com');

  static FirebaseStorage getInstance(){
    return _instance;
  }
}