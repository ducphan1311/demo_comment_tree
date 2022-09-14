import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tips_and_tricks_flutter/data/repositories/comment/comment_mock_repository.dart';
import 'package:tips_and_tricks_flutter/domain/models/comment_model.dart';
import 'package:tips_and_tricks_flutter/presentation/blocs/comment/comment_state.dart';
import 'package:tips_and_tricks_flutter/utils/cache.dart';

class CommentBloc extends Cubit<CommentState> {
  CommentBloc(this.commentMockRepository) : super(CommentState.loading());
  final CommentMockRepository commentMockRepository;

  void init() {
    var comments = commentMockRepository.getComment();
    emit(CommentStateData(comments));
  }

  void reply(
      CommentModel? currentComment, String content) {
    // var user = Cache.userModel;
    // state.maybeMap((value) {
    //   CommentModel newComment;
    //   if (currentComment!=null) {
    //     if (currentComment.isRoot) {
    //       newComment = CommentModel(
    //         userId: currentComment.userId,
    //         avatar: currentComment.avatar,
    //         userName: currentComment.avatar,
    //         content: content,
    //         isRoot: false,
    //         activeTime: DateTime.now().millisecond,
    //         comments: [],
    //         expanded: false,
    //       );
    //     } else {
    //       newComment = CommentModel(
    //         userId: currentComment.userId,
    //         avatar: currentComment.avatar,
    //         userName: currentComment.avatar,
    //         content: content,
    //         isRoot: false,
    //         activeTime: DateTime.now().millisecond,
    //         comments: [],
    //         expanded: false,
    //       );
    //     }
    //     if (currentComment.userId == user.id) {
    //       newComment = CommentModel(
    //         userId: user.id,
    //         avatar: user.avatar,
    //         userName: user.avatar,
    //         content: content,
    //         isRoot: false,
    //         activeTime: DateTime.now().millisecond,
    //         comments: [],
    //         expanded: false,
    //       );
    //     } else {
    //       newComment = CommentModel(
    //         userId: user.id,
    //         avatar: user.avatar,
    //         userName: user.avatar,
    //         content: content,
    //         isRoot: false,
    //         activeTime: DateTime.now().millisecond,
    //         comments: [],
    //         expanded: false,
    //       );
    //     }
    //   } else {
    //     newComment = CommentModel(
    //       userId: user.id,
    //       avatar: user.avatar,
    //       userName: user.avatar,
    //       content: content,
    //       isRoot: true,
    //       activeTime: DateTime.now().millisecond,
    //       comments: [],
    //       expanded: false,
    //     );
    //   }
    //   emit(CommentStateData([...value.comments, newComment]));
    // }, orElse: () => null);
  }
}
