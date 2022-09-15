import 'package:flutter/material.dart';
import 'package:flutter_stream_paging/fl_stream_paging.dart';
import 'package:tips_and_tricks_flutter/data/data_sources/comment_datasource.dart';
import 'package:tips_and_tricks_flutter/data/data_sources/mock/comment_mock_data_source.dart';
import 'package:tips_and_tricks_flutter/data/repositories/comment/comment_mock_repository.dart';
import 'package:tips_and_tricks_flutter/domain/models/comment_model.dart';

class TreeNode3 extends StatefulWidget {
  const TreeNode3({
    Key? key,
    required this.data,
    required this.offsetLeft,
    required this.onTap,
    required this.onExpand,
    required this.onCollapse,
  }) : super(key: key);
  final CommentModel data;
  final double offsetLeft;
  final Function(CommentModel node) onTap;
  final void Function(CommentModel node) onExpand;
  final void Function(CommentModel node) onCollapse;

  @override
  _TreeNode3State createState() => _TreeNode3State();
}

class _TreeNode3State extends State<TreeNode3>
    with SingleTickerProviderStateMixin {
  bool _isExpanded = false;
  late AnimationController _rotationController;
  final Tween<double> _turnsTween = Tween<double>(begin: -0.25, end: 0.0);
  final CommentMockRepository commentRepo = CommentMockDataSource();
  late List<CommentModel> comments;
  CommentDataSource? commentDataSource;

  //
  List<TreeNode3> _geneTreeNodes() {
    return _isExpanded
        ? List.generate(
        comments.length,
            (int index) => TreeNode3(
          key: UniqueKey(),
          data: comments[index],
          offsetLeft: widget.offsetLeft,
          onTap: widget.onTap,
          onExpand: widget.onExpand,
          onCollapse: widget.onCollapse,
        ))
        : [];
  }

  // Widget _geneTreeNodes() {
  //   if (commentDataSource != null) {
  //     return PagingListView<int, CommentModel>.separated(
  //       builderDelegate: PagedChildBuilderDelegate<CommentModel>(itemBuilder: (context, data, child) {
  //         return TreeNode3(
  //           key: UniqueKey(),
  //           data: data,
  //           offsetLeft: widget.offsetLeft,
  //           onTap: widget.onTap,
  //           onExpand: widget.onExpand,
  //           onCollapse: widget.onCollapse,
  //         );
  //       },),
  //       pageDataSource: commentDataSource!,
  //       separatorBuilder: (_, index) => const SizedBox(height: 20,),
  //       errorBuilder: (_, err) => const SizedBox(),
  //       shrinkWrap: true,
  //       physics: NeverScrollableScrollPhysics(),
  //       invisibleItemsThreshold: 0,
  //     );
  //   } else {
  //     return Container();
  //   }
  // }

  @override
  initState() {
    super.initState();
    comments = [];
    _isExpanded = widget.data.expanded;
    _rotationController = AnimationController(
      duration: const Duration(milliseconds: 100),
      vsync: this,
    )..addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        widget.onExpand(widget.data);
      } else if (status == AnimationStatus.reverse) {
        widget.onCollapse(widget.data);
      }
    });
    if (_isExpanded) {
      _rotationController.forward();
    }
  }

  @override
  void dispose() {
    _rotationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () {
            if (widget.data.childAmount > 0) {
              _isExpanded = !_isExpanded;
              if (_isExpanded) {
                comments = commentRepo.getSubComment(0);
                // commentDataSource = CommentDataSource(commentRepo);
                _rotationController.forward();
              } else {
                _rotationController.reverse();
              }
              setState(() {});
            }
            // widget.onTap(
            //     widget.data.copyWith(expanded: _isExpanded, isSelected: true));
          },
          onDoubleTap: () {
            // if (widget.data.children.isNotEmpty) {
            //   _isExpanded = !_isExpanded;
            //   if (_isExpanded) {
            //     _rotationController.forward();
            //   } else {
            //     _rotationController.reverse();
            //   }
            //   setState(() {});
            // }
            // widget.onTap(
            //     widget.data.copyWith(expanded: _isExpanded, isSelected: true));
            // if (widget.onDoubleTap != null) {
            //   widget.onDoubleTap!(widget.data
            //       .copyWith(expanded: _isExpanded, isSelected: true));
            // }
          },
          child: Container(
            margin: const EdgeInsets.all(4.0),
            padding: const EdgeInsets.only(right: 12.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                widget.data.childAmount > 0
                    ? RotationTransition(
                  child: Icon(Icons.ac_unit),
                  turns: _turnsTween.animate(_rotationController),
                )
                    : const SizedBox(width: 16, height: 16),
                // BlocBuilder<StoreCameraWindowBloc,
                //     StoreCameraWindowState>(builder: (context, state) {
                //   return Container(
                //     width: 3.w,
                //     height: 16.h,
                //     decoration: BoxDecoration(
                //         color: widget.data == state.currentTreeNodeData &&
                //             state.currentTreeNodeData!.isSelected &&
                //             state
                //                 .currentTreeNodeData!.children.isEmpty
                //             ? AppColors.blue[50]
                //             : null,
                //         borderRadius: BorderRadius.circular(3)),
                //   );
                // }),
                Expanded(
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Text(widget.data.userName??'not found user name'),
                      ),
                      Expanded(
                        child: Padding(
                          padding:
                          const EdgeInsets.symmetric(horizontal: 6.0),
                          child: Text(
                            widget.data.content ?? 'not found content',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context).textTheme.subtitle1,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        SizeTransition(
          sizeFactor: _rotationController,
          child: Padding(
            padding: EdgeInsets.only(left: widget.offsetLeft),
            child: Column(
              children: _geneTreeNodes(),
            ),
          ),
        ),
      ],
    );
  }
}
