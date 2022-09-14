import 'package:tips_and_tricks_flutter/data/repositories/comment/comment_mock_repository.dart';
import 'package:tips_and_tricks_flutter/domain/models/comment_list_model.dart';
import 'package:tips_and_tricks_flutter/domain/models/comment_model.dart';

class CommentMockDataSource extends CommentMockRepository {
  @override
  List<CommentModel> getComment() {
    return <CommentModel>[
      CommentModel(
          id: 0,
          userId: 1,
          avatar: '',
          userName: 'duc1',
          content: 'abc',
          isRoot: true,
          activeTime: DateTime(2020, 1, 1, 0, 1).millisecond,
          comments: <CommentModel>[
            CommentModel(
                id: 01,
                userId: 2,
                avatar: '',
                userName: 'duc2',
                content: 'abc',
                isRoot: false,
                activeTime: DateTime(2020, 1, 1, 0, 2).millisecond,
                comments: <CommentModel>[
                  CommentModel(
                      id: 011,
                      userId: 3,
                      avatar: '',
                      userName: 'duc3',
                      content: 'abc',
                      isRoot: false,
                      activeTime: DateTime(2020, 1, 1, 0, 4).millisecond,
                      comments: <CommentModel>[],
                      expanded: false,
                      parentPositions: [0, 0]),
                  CommentModel(
                      id: 012,
                      userId: 1,
                      avatar: '',
                      userName: 'duc1',
                      content: 'abc',
                      isRoot: false,
                      activeTime: DateTime(2020, 1, 1, 0, 3).millisecond,
                      comments: <CommentModel>[],
                      expanded: false,
                      parentPositions: [0, 0]),
                ],
                expanded: false,
                parentPositions: [0]),
            CommentModel(
                id: 02,
                userId: 3,
                avatar: '',
                userName: 'duc3',
                content: 'abc',
                isRoot: false,
                activeTime: DateTime(2020, 1, 1, 0, 4).millisecond,
                comments: <CommentModel>[],
                expanded: false,
                parentPositions: [0]),
            CommentModel(
                id: 03,
                userId: 1,
                avatar: '',
                userName: 'duc1',
                content: 'abc',
                isRoot: false,
                activeTime: DateTime(2020, 1, 1, 0, 3).millisecond,
                comments: <CommentModel>[],
                expanded: false,
                parentPositions: [0]),
          ],
          expanded: false),
      CommentModel(
          id: 1,
          userId: 2,
          avatar: '',
          userName: 'duc2',
          content: 'abc',
          isRoot: true,
          activeTime: DateTime(2020, 1, 1, 0, 2).millisecond,
          comments: <CommentModel>[],
          expanded: false),
      CommentModel(
          id: 2,
          userId: 1,
          avatar: '',
          userName: 'duc1',
          content: 'abc',
          isRoot: true,
          activeTime: DateTime(2020, 1, 1, 0, 3).millisecond,
          comments: <CommentModel>[],
          expanded: false),
      CommentModel(
          id: 3,
          userId: 3,
          avatar: '',
          userName: 'duc3',
          content: 'abc',
          isRoot: true,
          activeTime: DateTime(2020, 1, 1, 0, 4).millisecond,
          comments: <CommentModel>[],
          expanded: false),
    ];
  }

  @override
  List<CommentListModel> getCommentList() {
    return <CommentListModel>[
      CommentListModel( [], [
        CommentModel(
            id: 0,
            userId: 1,
            avatar: '',
            userName: 'duc1',
            content: 'abc',
            isRoot: true,
            activeTime: DateTime(2020, 1, 1, 0, 1).millisecond,
            comments: <CommentModel>[],
            expanded: false),
        CommentModel(
            id: 1,
            userId: 2,
            avatar: '',
            userName: 'duc2',
            content: 'abc',
            isRoot: true,
            activeTime: DateTime(2020, 1, 1, 0, 2).millisecond,
            comments: <CommentModel>[],
            expanded: false),
        CommentModel(
            id: 2,
            userId: 1,
            avatar: '',
            userName: 'duc1',
            content: 'abc',
            isRoot: true,
            activeTime: DateTime(2020, 1, 1, 0, 3).millisecond,
            comments: <CommentModel>[],
            expanded: false),
        CommentModel(
            id: 3,
            userId: 3,
            avatar: '',
            userName: 'duc3',
            content: 'abc',
            isRoot: true,
            activeTime: DateTime(2020, 1, 1, 0, 4).millisecond,
            comments: <CommentModel>[],
            expanded: false),
      ]),
      CommentListModel([
        0
      ], <CommentModel>[
        CommentModel(
            id: 01,
            userId: 2,
            avatar: '',
            userName: 'duc2',
            content: 'abc',
            isRoot: false,
            activeTime: DateTime(2020, 1, 1, 0, 2).millisecond,
            comments: <CommentModel>[],
            expanded: false,
            parentPositions: [0]),
        CommentModel(
            id: 02,
            userId: 3,
            avatar: '',
            userName: 'duc3',
            content: 'abc',
            isRoot: false,
            activeTime: DateTime(2020, 1, 1, 0, 4).millisecond,
            comments: <CommentModel>[],
            expanded: false,
            parentPositions: [0]),
        CommentModel(
            id: 03,
            userId: 1,
            avatar: '',
            userName: 'duc1',
            content: 'abc',
            isRoot: false,
            activeTime: DateTime(2020, 1, 1, 0, 3).millisecond,
            comments: <CommentModel>[],
            expanded: false,
            parentPositions: [0]),
      ]),
      CommentListModel( [
        0,
        01
      ], [
        CommentModel(
            id: 011,
            userId: 3,
            avatar: '',
            userName: 'duc3',
            content: 'abc',
            isRoot: false,
            activeTime: DateTime(2020, 1, 1, 0, 4).millisecond,
            comments: <CommentModel>[],
            expanded: false,
            parentPositions: [0, 0]),
        CommentModel(
            id: 012,
            userId: 1,
            avatar: '',
            userName: 'duc1',
            content: 'abc',
            isRoot: false,
            activeTime: DateTime(2020, 1, 1, 0, 3).millisecond,
            comments: <CommentModel>[],
            expanded: false,
            parentPositions: [0, 0]),
      ])
    ];
  }
}
