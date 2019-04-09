class User{
  final String _username;
  final String _password;

  User(this._username, this._password);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is User &&
              runtimeType == other.runtimeType &&
              _username == other._username &&
              _password == other._password;

  @override
  int get hashCode =>
      _username.hashCode ^
      _password.hashCode;

}