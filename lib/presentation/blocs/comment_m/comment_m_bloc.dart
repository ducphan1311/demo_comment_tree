import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tips_and_tricks_flutter/domain/models/request_update_model.dart';
import 'package:tips_and_tricks_flutter/presentation/blocs/comment_m/comment_m_state.dart';

class CommentMBloc<ItemType> extends Cubit<CommentMState<ItemType>> {
  CommentMBloc(this.initialItem)
      : super(CommentMStateData(RequestUpdateModel(
            status: UpdateStatus.NONE,
            updateParentId: null,
            comment: initialItem)));

  final ItemType? initialItem;

  void update(RequestUpdateModel<ItemType> requestUpdateModel) {
    emit(CommentMStateData(requestUpdateModel));
  }
}
