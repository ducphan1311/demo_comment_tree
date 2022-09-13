import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tips_and_tricks_flutter/domain/models/comment_model.dart';
import 'package:tips_and_tricks_flutter/domain/models/user_model.dart';
part 'comment_state.freezed.dart';

@freezed
abstract class CommentState with _$CommentState {
  const factory CommentState(List<CommentModel> comments) = CommentStateData;
  const factory CommentState.loading() = CommentStateLoading;
  const factory CommentState.error(dynamic error) = CommentStateError;
}
