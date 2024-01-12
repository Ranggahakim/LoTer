class MainDB{
  final int? id;
  final String Name;
  final String UserType;
  final String Email;
  final String Password;
  final String? About;

  const MainDB({required this.Email, this.id, required this.Name, this.About, required this.UserType, required this.Password});

  factory MainDB.fromJson(Map<String, dynamic> json) => MainDB(
    Email: json['Email'], 
    Name: json['Name'], 
    UserType: json['UserType'],
    id: json['id'],
    About: json['About'],
    Password: json['Password']
    );

  Map<String, dynamic> toJson() => {
    'Email': Email,
    'Name': Name,
    'UserType': UserType,
    'id': id,
    'About': About,
    'Password': Password
  };
}