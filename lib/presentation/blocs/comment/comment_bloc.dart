import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tips_and_tricks_flutter/domain/models/comment_model.dart';
import 'package:tips_and_tricks_flutter/presentation/blocs/comment/comment_state.dart';

class CommentBloc extends Cubit<CommentState> {
  CommentBloc() : super(CommentState.loading());

  void init() {}

  void reply(CommentModel currentComment, CommentModel parentComment, String content) {
    state.maybeMap((value) {
      CommentModel newComment;
      if (currentComment.userId == parentComment.userId) {
        newComment = CommentModel(
            userId: commentModel.userId,
            avatar: commentModel.avatar,
            userName: commentModel.userName,
            content: content,
            treeNode: commentModel.treeNode,
            activeTime: DateTime.now().millisecond,
        comments: []);
      } else {
        newComment = CommentModel(
            userId: commentModel.userId,
            avatar: commentModel.avatar,
            userName: commentModel.userName,
            content: content,
            treeNode: commentModel.treeNode + 1,
            activeTime: DateTime.now().millisecond,
        comments: []);
      }
      emit(CommentStateData([...value.comments, newComment]));
    }, orElse: () => null);
  }
}
