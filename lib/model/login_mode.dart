// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class LoginMode {
  String email;
  String password;
  LoginMode({
    required this.email,
    required this.password,
  });

  LoginMode copyWith({
    String? email,
    String? password,
  }) {
    return LoginMode(
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'email': email,
      'password': password,
    };
  }

  factory LoginMode.fromMap(Map<String, dynamic> map) {
    return LoginMode(
      email: map['email'] as String,
      password: map['password'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory LoginMode.fromJson(String source) => LoginMode.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'LoginMode(email: $email, password: $password)';

  @override
  bool operator ==(covariant LoginMode other) {
    if (identical(this, other)) return true;
  
    return 
      other.email == email &&
      other.password == password;
  }

  @override
  int get hashCode => email.hashCode ^ password.hashCode;
}
