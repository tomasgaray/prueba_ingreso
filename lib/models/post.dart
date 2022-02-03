class Post {
  int? id;
  int? userId;
  String? title;
  String? body;

  Post({
        this.id,
        this.userId,
        this.title,
        this.body
      });

  factory Post.deserialize(Map<String, dynamic> json) {
    return Post(
      id: json["id"],
      userId: json["userId"],
      title: json['title'],
      body: json['body']
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id ?? 0,
        'userId': userId??0,
        'title': title??"",
        'body': body??"",
      };
}
