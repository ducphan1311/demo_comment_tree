import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tips_and_tricks_flutter/domain/models/comment_list_model.dart';
part 'comment_list_state.freezed.dart';

@freezed
abstract class CommentListState with _$CommentListState {
  const factory CommentListState(List<CommentListModel> commentLists) = CommentListStateData;
  const factory CommentListState.loading() = CommentListStateLoading;
  const factory CommentListState.error(dynamic error) = CommentListStateError;
}
