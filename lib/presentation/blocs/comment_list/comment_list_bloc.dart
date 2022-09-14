import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tips_and_tricks_flutter/data/repositories/comment/comment_mock_repository.dart';
import 'package:tips_and_tricks_flutter/presentation/blocs/comment_list/comment_list_state.dart';

class CommentListBloc extends Cubit<CommentListState> {
  CommentListBloc(this.commentMockRepository) : super(CommentListState.loading());

  final CommentMockRepository commentMockRepository;

  void init() {
    final commentLists = commentMockRepository.getCommentList();
    emit(CommentListStateData(commentLists));
  }

}