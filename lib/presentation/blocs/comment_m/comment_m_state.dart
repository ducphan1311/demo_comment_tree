import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tips_and_tricks_flutter/domain/models/comment_m_model.dart';
import 'package:tips_and_tricks_flutter/domain/models/request_update_model.dart';
part 'comment_m_state.freezed.dart';

@freezed
abstract class CommentMState<ItemType> with _$CommentMState<ItemType> {
  const factory CommentMState(RequestUpdateModel<ItemType> requestUpdate) = CommentMStateData;
}
