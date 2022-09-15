import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_stream_paging/fl_stream_paging.dart';
import 'package:tips_and_tricks_flutter/data/data_sources/comment_datasource.dart';
import 'package:tips_and_tricks_flutter/data/data_sources/mock/comment_mock_data_source.dart';
import 'package:tips_and_tricks_flutter/data/repositories/comment/comment_mock_repository.dart';
import 'package:tips_and_tricks_flutter/domain/models/comment_model.dart';
import 'package:tips_and_tricks_flutter/presentation/blocs/comment/comment_bloc.dart';
import 'package:tips_and_tricks_flutter/presentation/blocs/comment/comment_state.dart';
import 'package:tips_and_tricks_flutter/presentation/widgets/comment_tree_view/tree_node_3_widget.dart';
import 'package:tips_and_tricks_flutter/presentation/widgets/comment_tree_view/tree_node_widget.dart';

class CommentPage3 extends StatefulWidget {
  static const path = '/comment_page_3';
  const CommentPage3({Key? key}) : super(key: key);

  @override
  State<CommentPage3> createState() => _CommentPage3State();
}

class _CommentPage3State extends State<CommentPage3> {
  late CommentBloc commentBloc;
  final CommentMockRepository commentRepo = CommentMockDataSource();
  late List<CommentModel> comments;
  late CommentDataSource commentDataSource;

  @override
  void initState() {
    super.initState();
    // comments = commentRepo.getMainComment(0);
    commentDataSource = CommentDataSource(commentRepo);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('CommentPage3'),),
      body: SafeArea(child: PagingListView<int, CommentModel>.separated(
        builderDelegate: PagedChildBuilderDelegate<CommentModel>(itemBuilder: (context, data, child) {
          return TreeNode3(
            key: UniqueKey(),
            data: data,
            offsetLeft: 24,
            onTap: (c){},
            onExpand: (c){},
            onCollapse: (c){},
          );
        },),
        pageDataSource: commentDataSource,
        separatorBuilder: (_, index) => const SizedBox(height: 20,),
        errorBuilder: (_, err) => const SizedBox(),
      )
      // Column(
      //   children: List.generate(
      //     comments.length,
      //         (int index) {
      //       return TreeNode3(
      //         key: UniqueKey(),
      //         data: comments[index],
      //         offsetLeft: 24,
      //         onTap: (c){},
      //         onExpand: (c){},
      //         onCollapse: (c){},
      //       );
      //     },
      //   ),
      // ),
    ),
    );
  }
}