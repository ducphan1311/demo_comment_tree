import 'package:tips_and_tricks_flutter/domain/models/comment_list_model.dart';
import 'package:tips_and_tricks_flutter/domain/models/comment_model.dart';

abstract class CommentMockRepository {
  List<CommentModel> getComment();

  List<CommentListModel> getCommentList();
}