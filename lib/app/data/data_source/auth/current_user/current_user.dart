class User {
  int user_id;
  String username;
  String email;
  String image;

  User({required this.user_id, required this.username, required this.email,required this.image});

  factory User.fromMap(Map<String, dynamic> json) {
    return User(
        user_id: json["user_id"],
        username: json["username"],
        email: json["email"],
        image: json["image"]
      );
  }
}

class UserResponse {
  String message;
  User? data;

  UserResponse({required this.message, required this.data});

  factory UserResponse.fromMap(Map<String, dynamic> json) {
    return UserResponse(
        message: json["message"], data: User.fromMap(json["data"]));
  }
}
