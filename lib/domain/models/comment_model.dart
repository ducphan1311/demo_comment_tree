class CommentModel {
  // ignore: constant_identifier_names
  static const TAG = 'Comment';

  int userId;
  String? avatar;
  String? userName;
  String? content;
  int treeNode;
  int activeTime;
  List<CommentModel> comments;

  CommentModel({
    required this.userId,
    required this.avatar,
    required this.userName,
    required this.content,
    required this.treeNode,
    required this.activeTime,
    required this.comments,
  });
}
