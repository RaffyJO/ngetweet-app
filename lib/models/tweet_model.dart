class Tweet {
  int id;
  int userId;
  String body;
  String? image;
  int likes;
  int totalComment;
  // String? createdAt;
  // User? userLikes;
  // Comment? comments;

  Tweet({
    required this.id,
    required this.userId,
    required this.body,
    this.image,
    this.likes = 0,
    this.totalComment = 0,
    // this.createdAt,
    // this.userLikes,
    // this.comments,
  });

  factory Tweet.fromJson(Map<String, dynamic> json) => Tweet(
        id: json['id'],
        userId: json['user_id'],
        body: json['body'],
        image: json['image'],
        likes: json['likes'],
        totalComment: json['total_comments'],
        // createdAt: json['data']['created_at'],
        // userLikes: json['data']['user_likes'],
        // comments: json['data']['comments'],
      );

  Map<String, dynamic> toJson() {
    return {
      'body': body,
      'image': image,
    };
  }
}
