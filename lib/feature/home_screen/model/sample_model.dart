class FeedPost {
  final String name;
  final String username;
  final String location;
  final String time;
  final String content;
  final String profileImage;
  final String postImage;
  final int likes;
  final int comments;
  final int reposts;
  final int views;
  final int slides;
  final int currentSlide;

  FeedPost({
    required this.name,
    required this.username,
    required this.location,
    required this.time,
    required this.content,
    required this.profileImage,
    required this.postImage,
    required this.likes,
    required this.comments,
    required this.reposts,
    required this.views,
    required this.slides,
    required this.currentSlide,
  });
}