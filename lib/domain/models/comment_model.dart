class CommentModel {
  // ignore: constant_identifier_names
  static const TAG = 'Comment';

  int id;
  int userId;
  String? avatar;
  String? userName;
  String? content;
  bool isRoot;
  int activeTime;
  List<CommentModel> comments;
  bool expanded;
  List<int> parentPositions;

  CommentModel({
    required this.id,
    required this.userId,
    required this.avatar,
    required this.userName,
    required this.content,
    required this.isRoot,
    required this.activeTime,
    required this.comments,
    required this.expanded,
    this.parentPositions = const <int>[],
  });
}
