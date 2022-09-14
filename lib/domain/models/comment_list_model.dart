import 'package:tips_and_tricks_flutter/domain/models/comment_model.dart';

class CommentListModel {
  List<int> parentIds;
  List<CommentModel> comments;

  CommentListModel(this.parentIds, this.comments);
}