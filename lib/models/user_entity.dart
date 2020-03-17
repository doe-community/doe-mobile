
import 'package:doe/models/base_entity.dart';

///T he user schema on the system
class User implements BaseEntity{
  String name;
  String email;
  String password;
  String urlProfileImage;

  User({ 
    this.name, 
    this.email, 
    this.password, 
    this.urlProfileImage,
  });

  getName(){
    return this.name;
  }

  getPassword(){
    return this.getName();
  }

  getUrlProfileImage(){
    return this.urlProfileImage;
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'name': this.name,
      'email': this.email,
      'password': this.password,
      'url_profile_image': this.urlProfileImage,
    };
  }
}