import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tips_and_tricks_flutter/data/data_sources/mock/comment_mock_data_source.dart';
import 'package:tips_and_tricks_flutter/presentation/blocs/comment/comment_bloc.dart';
import 'package:tips_and_tricks_flutter/presentation/blocs/comment/comment_state.dart';
import 'package:tips_and_tricks_flutter/presentation/widgets/comment_tree_view/tree_node_widget.dart';

class CommentPage extends StatefulWidget {
  static const path = '/comment_page';
  const CommentPage({Key? key}) : super(key: key);

  @override
  State<CommentPage> createState() => _CommentPageState();
}

class _CommentPageState extends State<CommentPage> {
  late CommentBloc commentBloc;

  @override
  void initState() {
    super.initState();
    commentBloc = CommentBloc(CommentMockDataSource());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('comment page'),),
      body: SafeArea(child:
      BlocProvider.value(value: commentBloc..init(),
        child: BlocBuilder<CommentBloc, CommentState>(builder: (context, state) {
          return state.when((comments) {
            print('comments: ${comments.length}');
            return Column(
              children: List.generate(
                comments.length,
                    (int index) {
                  return TreeNode(
                    key: UniqueKey(),
                    comments: comments[index].comments,
                    data: comments[index],
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