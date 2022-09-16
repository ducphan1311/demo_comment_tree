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
  int childAmount;

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
    this.childAmount = 0,
  });

  factory CommentModel.fakeId(int id) {
    return CommentModel(
        id: id,
        userId: id,
        avatar: 'avatar',
        userName: 'duc$id',
        content: 'abc$id',
        isRoot: false,
        activeTime: DateTime.now().millisecondsSinceEpoch,
        comments: [],
        expanded: false,
        childAmount: id % 3 == 0 ? 3 : 0);
  }

  CommentModel copyWith({
    int? id,
    int? userId,
    String? avatar,
    String? userName,
    String? content,
    bool? isRoot,
    int? activeTime,
    List<CommentModel>? comments,
    bool? expanded,
    List<int>? parentPositions,
    int? childAmount,
  }) =>
      CommentModel(
          id: id ?? this.id,
          userId: userId ?? this.userId,
          avatar: avatar ?? this.avatar,
          userName: userName ?? this.userName,
          content: content ?? this.content,
          isRoot: isRoot ?? this.isRoot,
          activeTime: activeTime ?? this.activeTime,
          comments: comments ?? this.comments,
          expanded: expanded ?? this.expanded,
      childAmount: childAmount ?? this.childAmount);
}
