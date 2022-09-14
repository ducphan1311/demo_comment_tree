import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tips_and_tricks_flutter/data/data_sources/mock/comment_mock_data_source.dart';
import 'package:tips_and_tricks_flutter/domain/models/comment_list_model.dart';
import 'package:tips_and_tricks_flutter/presentation/blocs/comment_list/comment_list_bloc.dart';
import 'package:tips_and_tricks_flutter/presentation/blocs/comment_list/comment_list_state.dart';
import 'package:tips_and_tricks_flutter/presentation/widgets/comment_tree_view/tree_node_2_widget.dart';

class CommentListPage extends StatefulWidget {
  static const path = '/comment_list_page';
  const CommentListPage({Key? key}) : super(key: key);

  @override
  State<CommentListPage> createState() => _CommentListPageState();
}

class _CommentListPageState extends State<CommentListPage> {
  late CommentListBloc commentListBloc;
  @override
  void initState() {
    super.initState();
    commentListBloc = CommentListBloc(CommentMockDataSource());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('comment page'),),
      body: SafeArea(child:
      BlocProvider.value(value: commentListBloc..init(),
        child: BlocBuilder<CommentListBloc, CommentListState>(builder: (context, state) {
          return state.when((commentLists) {
            return Column(
              children: List.generate(
                commentLists.first.comments.length,
                    (int index) {
                      var commentListData = commentLists.firstWhereOrNull((element) =>
                          element.parentIds.equals(<int>[...commentLists.first.parentIds, commentLists.first.comments[index].id])
                      );
                      if (commentListData!=null) {
                        print('index: ${commentLists.indexOf(commentListData)}');
                      }
                  return TreeNode2(
                    key: UniqueKey(),
                    commentLists: commentLists,
                    comments: commentListData != null ? commentListData.comments : [],
                    // comments: commentLists.first.comments,
                    data: commentLists.first.comments[index],
                    commentListData: commentListData,
                    offsetLeft: 24,
                    onTap: (c){},
                    onExpand: (c){},
                    onCollapse: (c){},
                  );
                },
              ),
            );
          },  loading: () => Center(
            child: CircularProgressIndicator(),
          ),
            error: (e) => Center(
              child: Text(e),
            ),);
        }),)),
    );
  }
}