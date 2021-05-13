class User{
  int key;
  String _name;
  String _password;
  String _email;
  String _photo;


  User(this._name, this._password){
    this._photo = "https://thispersondoesnotexist.com/";
  }

  @override
  String toString() {
    return _name;
  }

  String get email => _email;

  String get name => _name;

  String get password => _password;

  String get photo => _photo;

  set name(String value) {
    _name = value;
  }

  set email(String value) {
    _email = value;
  }

  set password(String value) {
    _password = value;
  }

  set photo(String value) {
    _photo = value;
  }
}