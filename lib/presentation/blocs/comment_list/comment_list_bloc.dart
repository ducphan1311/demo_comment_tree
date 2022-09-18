import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tips_and_tricks_flutter/data/repositories/comment/comment_mock_repository.dart';
import 'package:tips_and_tricks_flutter/domain/models/comment_list_model.dart';
import 'package:tips_and_tricks_flutter/domain/models/comment_model.dart';
import 'package:tips_and_tricks_flutter/presentation/blocs/comment_list/comment_list_state.dart';
import 'package:tips_and_tricks_flutter/utils/cache.dart';

class CommentListBloc extends Cubit<CommentListState> {
  CommentListBloc(this.commentMockRepository)
      : super(CommentListState.loading());

  final CommentMockRepository commentMockRepository;

  void init() {
    final commentLists = commentMockRepository.getCommentList();
    emit(CommentListStateData(commentLists));
  }

  void reply(
      {required CommentListModel parentCommentList,
      required CommentModel parentComment,
      required String content}) {
    var user = Cache.userModel;
    var comment = CommentModel(
        id: DateTime.now().hashCode,
        userId: user.id,
        avatar: user.avatar,
        userName: user.name,
        content: content,
        isRoot: false,
        createdAt: DateTime.now().millisecondsSinceEpoch,
        comments: [],
        expanded: false);
    CommentListModel newChildCommentList;
    state.mapOrNull((value) {
      var newCommentLists = [...value.commentLists];
      var childCommentList = value.commentLists.firstWhereOrNull((element) =>
          element.parentIds
              .equals(<int>[...parentCommentList.parentIds, parentComment.id]));
      if (childCommentList != null) {
        var indexOfChildCommentList =
            value.commentLists.indexOf(childCommentList);
        newChildCommentList = CommentListModel(childCommentList.parentIds,
            [...childCommentList.comments, comment]);
        newCommentLists[indexOfChildCommentList] = newChildCommentList;
      } else {
        newChildCommentList = CommentListModel([...parentCommentList.parentIds, parentComment.id], [comment]);
        newCommentLists.add(newChildCommentList);
      }
      emit(CommentListStateData(newCommentLists));
    });
  }

  // void updateExpanded({}) {
  //   state.mapOrNull((value) {
  //
  //   });
  // }
}
