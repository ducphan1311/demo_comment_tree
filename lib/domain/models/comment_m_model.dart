import 'comment_model.dart';

class CommentMModel {
  int parentId;
  List<CommentModel> comments;

  CommentMModel(this.parentId, this.comments);
}