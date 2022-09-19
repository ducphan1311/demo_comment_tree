import 'package:tips_and_tricks_flutter/domain/models/user_model.dart';

class CommentModel {
  // ignore: constant_identifier_names
  static const TAG = 'Comment';

  int id;
  int userId;
  String? avatar;
  String? userName;
  String? content;
  bool isRoot;
  int createdAt;
  int? deletedAt;
  int? updatedAt;
  int? likeCount;
  int? reportCount;
  List<UserModel>? userTag;
  int? parentId;
  int postId;
  bool favourite;

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
    required this.createdAt,
    this.deletedAt,
    this.updatedAt,
    this.likeCount,
    this.reportCount,
    this.userTag,
    this.parentId,
    this.postId = 0,
    required this.comments,
    required this.expanded,
    this.parentPositions = const <int>[],
    this.childAmount = 0,
    this.favourite = false,
  });

  factory CommentModel.fakeId(int id) {
    return CommentModel(
        id: id,
        userId: id,
        avatar: 'avatar',
        userName: 'duc$id',
        content: 'abc$id',
        isRoot: false,
        createdAt: DateTime.now().millisecondsSinceEpoch,
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
    int? deletedAt,
    int? updatedAt,
    int? likeCount,
    int? reportCount,
    List<UserModel>? userTag,
    int? parentId,
    int? postId,
    bool? favourite,
  }) =>
      CommentModel(
          id: id ?? this.id,
          userId: userId ?? this.userId,
          avatar: avatar ?? this.avatar,
          userName: userName ?? this.userName,
          content: content ?? this.content,
          isRoot: isRoot ?? this.isRoot,
          createdAt: activeTime ?? this.createdAt,
          deletedAt: deletedAt ?? this.deletedAt,
          updatedAt: updatedAt ?? this.updatedAt,
          likeCount: likeCount ?? this.likeCount,
          reportCount: reportCount ?? this.reportCount,
          userTag: userTag ?? this.userTag,
          parentId: parentId ?? this.parentId,
          postId: postId ?? this.postId,
          favourite: favourite ?? this.favourite,
          comments: comments ?? this.comments,
          expanded: expanded ?? this.expanded,
          childAmount: childAmount ?? this.childAmount);
}
