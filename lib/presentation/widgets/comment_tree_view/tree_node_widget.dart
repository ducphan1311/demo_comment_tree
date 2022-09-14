import 'package:flutter/material.dart';
import 'package:tips_and_tricks_flutter/domain/models/comment_model.dart';

class TreeNode extends StatefulWidget {
  const TreeNode({
    Key? key,
    required this.comments,
    required this.data,
    required this.offsetLeft,
    required this.onTap,
    required this.onExpand,
    required this.onCollapse,
  }) : super(key: key);

  final List<CommentModel> comments;
  final CommentModel data;
  final double offsetLeft;
  final Function(CommentModel node) onTap;
  final void Function(CommentModel node) onExpand;
  final void Function(CommentModel node) onCollapse;

  @override
  _TreeNodeState createState() => _TreeNodeState();
}

class _TreeNodeState extends State<TreeNode>
    with SingleTickerProviderStateMixin {
  bool _isExpanded = false;
  late AnimationController _rotationController;
  final Tween<double> _turnsTween = Tween<double>(begin: -0.25, end: 0.0);

  List<TreeNode> _geneTreeNodes() {
    return _isExpanded
        ? List.generate(
        widget.comments.length,
            (int index) => TreeNode(
          key: UniqueKey(),
          comments: widget.comments[index].comments,
          data: widget.comments[index],
          offsetLeft: widget.offsetLeft,
          onTap: widget.onTap,
          onExpand: widget.onExpand,
          onCollapse: widget.onCollapse,
        ))
        : [];
  }

  @override
  initState() {
    super.initState();
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
            if (widget.data.comments.isNotEmpty) {
              _isExpanded = !_isExpanded;
              if (_isExpanded) {
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
                widget.data.comments.isNotEmpty
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
            child: Column(children: _geneTreeNodes()),
          ),
        ),
      ],
    );
  }
}
