class User {
  final int? id;
  final String name;
  final String email;
  final String? password; // Nullable karena Laravel tidak return password
  
  User({
    this.id,
    required this.name,
    required this.email,
    this.password,
  });

  factory User.fromJson(Map<String, dynamic> json){
    return User(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      password: json['password'], // Bisa null dari server
    );
  }

  Map<String, dynamic> toJson(){
    return{'id': id, 'name':name, 'email':email, 'password':password};
  }

}
