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
            content: 'abc0',
            isRoot: true,
            activeTime: DateTime(2020, 1, 1, 0, 1).millisecond,
            comments: <CommentModel>[],
            expanded: false),
        CommentModel(
            id: 1,
            userId: 2,
            avatar: '',
            userName: 'duc2',
            content: 'abc1',
            isRoot: true,
            activeTime: DateTime(2020, 1, 1, 0, 2).millisecond,
            comments: <CommentModel>[],
            expanded: false),
        CommentModel(
            id: 2,
            userId: 1,
            avatar: '',
            userName: 'duc1',
            content: 'abc2',
            isRoot: true,
            activeTime: DateTime(2020, 1, 1, 0, 3).millisecond,
            comments: <CommentModel>[],
            expanded: false),
        CommentModel(
            id: 3,
            userId: 3,
            avatar: '',
            userName: 'duc3',
            content: 'abc3',
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
            content: 'abc0-01',
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
            content: 'abc0-02',
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
            content: 'abc0-03',
            isRoot: false,
            activeTime: DateTime(2020, 1, 1, 0, 3).millisecond,
            comments: <CommentModel>[],
            expanded: false,
            parentPositions: [0]),
      ]),
      CommentListModel([
        0,
        01
      ], [
        CommentModel(
            id: 011,
            userId: 3,
            avatar: '',
            userName: 'duc3',
            content: 'abc0-01-011',
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
            content: 'abc0-01-012',
            isRoot: false,
            activeTime: DateTime(2020, 1, 1, 0, 3).millisecond,
            comments: <CommentModel>[],
            expanded: false,
            parentPositions: [0, 0]),
      ]),
      CommentListModel([
        0,
        03
      ], [
        CommentModel(
            id: 031,
            userId: 3,
            avatar: '',
            userName: 'duc3',
            content: 'abc0-03-031',
            isRoot: false,
            activeTime: DateTime(2020, 1, 1, 0, 4).millisecond,
            comments: <CommentModel>[],
            expanded: false,
            parentPositions: [0, 0]),
        CommentModel(
            id: 032,
            userId: 1,
            avatar: '',
            userName: 'duc1',
            content: 'abc0-03-032',
            isRoot: false,
            activeTime: DateTime(2020, 1, 1, 0, 3).millisecond,
            comments: <CommentModel>[],
            expanded: false,
            parentPositions: [0, 0]),
        CommentModel(
            id: 034,
            userId: 4,
            avatar: '',
            userName: 'duc4',
            content: 'abc0-03-034',
            isRoot: false,
            activeTime: DateTime(2020, 1, 1, 0, 4).millisecond,
            comments: <CommentModel>[],
            expanded: false,
            parentPositions: [0, 0]),
        CommentModel(
            id: 033,
            userId: 3,
            avatar: '',
            userName: 'duc3',
            content: 'abc0-03-033',
            isRoot: false,
            activeTime: DateTime(2020, 1, 1, 0, 3).millisecond,
            comments: <CommentModel>[],
            expanded: false,
            parentPositions: [0, 0]),
      ]),
      CommentListModel([
        0,
        03,
        032
      ], [
        CommentModel(
            id: 0321,
            userId: 3,
            avatar: '',
            userName: 'duc3',
            content: 'abc0-03-032-0321',
            isRoot: false,
            activeTime: DateTime(2020, 1, 1, 0, 4).millisecond,
            comments: <CommentModel>[],
            expanded: false,
            parentPositions: [0, 0]),
        CommentModel(
            id: 0322,
            userId: 4,
            avatar: '',
            userName: 'duc4',
            content: 'abc0-03-032-0322',
            isRoot: false,
            activeTime: DateTime(2020, 1, 1, 0, 4).millisecond,
            comments: <CommentModel>[],
            expanded: false,
            parentPositions: [0, 0]),
      ])
    ];
  }

  @override
  Future<List<CommentModel>> getMainComment(int pageIndex) async {
    List<CommentModel> datas = [];
    for (var i = 0; i < 40 ; i++) {
      datas.add(CommentModel.fakeId(i + 40*pageIndex));
    }
    return Future.delayed(
        const Duration(milliseconds: 500),
            () => datas
    );
  }

  @override
  List<CommentModel> getSubComment(int pageIndex) {
    List<CommentModel> datas = [];
    for (var i = 0; i < 20 ; i++) {
      datas.add(CommentModel.fakeId(i + pageIndex));
    }
    return datas;
  }
}
