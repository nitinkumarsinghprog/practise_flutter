class CommentModel {
  final int id;
  final String body;
  final int likes;
  final UserModel user;

  CommentModel({
    required this.id,
    required this.body,
    required this.likes,
    required this.user,
  });

  factory CommentModel.fromJson(Map<String, dynamic> json) {
    return CommentModel(
      id: json['id'],
      body: json['body'],
      likes: json['likes'],
      user: UserModel.fromJson(json['user']),
    );
  }
}

class UserModel {
  final int id;
  final String fullName;
  final String username;

  UserModel({required this.id, required this.fullName, required this.username});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      fullName: json['fullName'],
      username: json['username'],
    );
  }
}
