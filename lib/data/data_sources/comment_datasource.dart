import 'dart:async';

import 'package:flutter_stream_paging/data_source/data_source.dart';
import 'package:tips_and_tricks_flutter/data/repositories/comment/comment_mock_repository.dart';
import 'package:tips_and_tricks_flutter/domain/models/comment_list_model.dart';
import 'package:tips_and_tricks_flutter/domain/models/comment_model.dart';
import 'package:tuple/tuple.dart';

class CommentDataSource extends DataSource<int, CommentModel> {
  CommentMockRepository commentMockRepository;
  int? userId;

  CommentDataSource(this.commentMockRepository, {this.userId});

  @override
  FutureOr<Tuple2<List<CommentModel>, int>> loadInitial(int pageSize) async {
    print('userId: $userId');
    return Tuple2(await commentMockRepository.getMainComment(0), 1);
  }

  @override
  FutureOr<Tuple2<List<CommentModel>, int>> loadPageAfter(
      int params, int pageSize) async {
    print('userId: $userId');
    return Tuple2(
        await commentMockRepository.getMainComment(params), params + 1);
  }
}
