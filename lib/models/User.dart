
/**
 * The user schema on the system
 */
class User {
  String name;
  String email;
  String password;
  String urlProfileImage;

  User({ this.name, this.email, this.password, this.urlProfileImage });

  getName(){
    return this.name;
  }

  getPassword(){
    return this.getName();
  }

  getUrlProfileImage(){
    return this.urlProfileImage;
  }
}