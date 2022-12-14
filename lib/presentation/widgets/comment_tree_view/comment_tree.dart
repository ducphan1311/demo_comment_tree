import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tips_and_tricks_flutter/data/data_sources/comment_datasource.dart';
import 'package:tips_and_tricks_flutter/data/repositories/comment/comment_mock_repository.dart';
import 'package:tips_and_tricks_flutter/domain/models/comment_model.dart';
import 'package:flutter/widgets.dart' as widgets;
import 'package:tips_and_tricks_flutter/presentation/blocs/comment_m/comment_m_bloc.dart';
import 'package:tips_and_tricks_flutter/presentation/blocs/comment_m/comment_m_state.dart';

import '../../../domain/models/request_update_model.dart';
import '../../../gen/assets.gen.dart';
import '../../../paging/fl_stream_paging.dart';
import '../form/comment_text_form_field.dart';

typedef CommentItemBuilder = Widget Function(
  BuildContext context,
  CommentModel comment,
  int index,
  Function() onShowDetail,
  Function()? onLongPress,
  Tween<double> turnsTween,
  AnimationController rotationController,
  Function(CommentModel comment) onUpdate,
  Function() onDelete,
);

class CommentTree<R extends CommentMockRepository> extends StatefulWidget {
  const CommentTree({
    Key? key,
    required this.data,
    required this.offsetLeft,
    this.onExpand,
    this.onCollapse,
    required this.onUpdate,
    required this.onDelete,
    required this.commentItemBuilder,
    this.isEnablePullToRefresh = true,
    this.padding = EdgeInsets.zero,
    this.separatorBuilder,
    this.scrollDirection = Axis.vertical,
    this.reverse = false,
    this.controller,
    this.primary,
    this.physics,
    this.shrinkWrap = false,
    this.addRepaintBoundaries = true,
    this.addAutomaticKeepAlives = true,
    this.addSemanticIndexes = true,
    this.cacheExtent,
    this.dragStartBehavior = DragStartBehavior.start,
    this.keyboardDismissBehavior = ScrollViewKeyboardDismissBehavior.manual,
    this.semanticIndexCallback,
    this.itemExtent,
    this.invisibleItemsThreshold = 3,
    this.newPageErrorIndicatorBuilder,
    this.newPageCompletedIndicatorBuilder,
    this.newPageProgressIndicatorBuilder,
    this.emptyBuilder,
    this.loadingBuilder,
    this.errorBuilder,
    this.refreshBuilder,
    required this.commentMockRepository,
    required this.currentIndex,
  }) : super(key: key);
  final CommentModel data;
  final double offsetLeft;
  final void Function(CommentModel node)? onExpand;
  final void Function(CommentModel node)? onCollapse;
  final Function(CommentModel node) onUpdate;
  final Function() onDelete;
  final CommentItemBuilder commentItemBuilder;

  final widgets.EdgeInsets padding;
  final IndexedWidgetBuilder? separatorBuilder;
  final Axis scrollDirection;
  final bool reverse;
  final bool isEnablePullToRefresh;
  final ScrollController? controller;
  final bool? primary;

  ///In Android pull to refresh only work
  /// if total height height  < height of screen => physics = [AlwaysScrollableScrollPhysics]
  /// if total height of item > height of screen => physics = [BouncingScrollPhysics] || [AlwaysScrollableScrollPhysics]
  /// default physics = [AlwaysScrollableScrollPhysics]
  final ScrollPhysics? physics;

  final bool shrinkWrap;
  final bool addAutomaticKeepAlives;
  final bool addRepaintBoundaries;
  final bool addSemanticIndexes;
  final double? cacheExtent;
  final DragStartBehavior dragStartBehavior;
  final ScrollViewKeyboardDismissBehavior keyboardDismissBehavior;
  final SemanticIndexCallback? semanticIndexCallback;
  final double? itemExtent;
  final int invisibleItemsThreshold;
  final WidgetBuilder? newPageErrorIndicatorBuilder;
  final WidgetBuilder? newPageCompletedIndicatorBuilder;
  final NewPageWidgetBuilder? newPageProgressIndicatorBuilder;
  final WidgetBuilder? emptyBuilder;
  final WidgetBuilder? loadingBuilder;
  final ErrorBuilder? errorBuilder;
  final WidgetBuilder? refreshBuilder;
  final R commentMockRepository;
  final int currentIndex;

  @override
  CommentTreeState<R> createState() => CommentTreeState<R>();
  // @override
  // State<TreeNode3<D>> createState() => _TreeNode3State<D>();
  // @override
  // _TreeNode3State<D extends DataSource> createState() => _TreeNode3State<D extends DataSource>();
}

class CommentTreeState<R extends CommentMockRepository>
    extends State<CommentTree<R>>
    with SingleTickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  bool _isExpanded = false;
  late AnimationController _rotationController;
  final Tween<double> _turnsTween = Tween<double>(begin: -0.25, end: 0.0);
  late R commentMockRepository;
  CommentDataSource? commentDataSource;
  TextEditingController controller = TextEditingController();

  Widget _geneTreeNodes() {
    if (commentDataSource != null) {
      return PagingListView<int, CommentModel>.separated(
        builderDelegate: PagedChildBuilderDelegate<CommentModel>(
          itemBuilder: (context, data, index, onUpdate, onDelete) {
            return CommentTree(
              key: ValueKey(data.id),
              data: data,
              currentIndex: index,
              offsetLeft: widget.offsetLeft,
              onExpand: widget.onExpand,
              onCollapse: widget.onCollapse,
              onUpdate: onUpdate,
              onDelete: onDelete,
              commentItemBuilder: widget.commentItemBuilder,
              isEnablePullToRefresh: widget.isEnablePullToRefresh,
              padding: widget.padding,
              separatorBuilder: widget.separatorBuilder,
              scrollDirection: widget.scrollDirection,
              reverse: widget.reverse,
              controller: widget.controller,
              primary: widget.primary,
              physics: widget.physics,
              shrinkWrap: widget.shrinkWrap,
              addRepaintBoundaries: widget.addRepaintBoundaries,
              addAutomaticKeepAlives: widget.addAutomaticKeepAlives,
              addSemanticIndexes: widget.addSemanticIndexes,
              cacheExtent: widget.cacheExtent,
              dragStartBehavior: widget.dragStartBehavior,
              keyboardDismissBehavior: widget.keyboardDismissBehavior,
              semanticIndexCallback: widget.semanticIndexCallback,
              itemExtent: widget.itemExtent,
              invisibleItemsThreshold: widget.invisibleItemsThreshold,
              newPageErrorIndicatorBuilder: widget.newPageErrorIndicatorBuilder,
              newPageCompletedIndicatorBuilder:
                  widget.newPageCompletedIndicatorBuilder,
              newPageProgressIndicatorBuilder:
                  widget.newPageProgressIndicatorBuilder,
              emptyBuilder: widget.emptyBuilder,
              loadingBuilder: widget.loadingBuilder,
              errorBuilder: widget.errorBuilder,
              refreshBuilder: widget.refreshBuilder,
              commentMockRepository: commentMockRepository,
            );
          },
        ),
        pageDataSource: commentDataSource!,
        errorBuilder: widget.errorBuilder,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        invisibleItemsThreshold: 0,
        newPageProgressIndicatorBuilder: (_, onPressed) {
          return ElevatedButton(onPressed: onPressed, child: Text('load more'));
        },
        isEnablePullToRefresh: widget.isEnablePullToRefresh,
        padding: widget.padding,
        separatorBuilder: widget.separatorBuilder ?? (_, i) => SizedBox(),
        scrollDirection: widget.scrollDirection,
        reverse: widget.reverse,
        controller: widget.controller,
        primary: widget.primary,
        addRepaintBoundaries: widget.addRepaintBoundaries,
        addAutomaticKeepAlives: widget.addAutomaticKeepAlives,
        addSemanticIndexes: widget.addSemanticIndexes,
        cacheExtent: widget.cacheExtent,
        dragStartBehavior: widget.dragStartBehavior,
        keyboardDismissBehavior: widget.keyboardDismissBehavior,
        semanticIndexCallback: widget.semanticIndexCallback,
        itemExtent: widget.itemExtent,
        newPageErrorIndicatorBuilder: widget.newPageErrorIndicatorBuilder,
        newPageCompletedIndicatorBuilder:
            widget.newPageCompletedIndicatorBuilder,
        emptyBuilder: widget.emptyBuilder,
        loadingBuilder: widget.loadingBuilder,
        refreshBuilder: widget.refreshBuilder,
        parentId: widget.data.id,
        // addItemBuilder: (context, onAddItem) {
        //   return Padding(
        //     padding: EdgeInsets.symmetric(horizontal: 16),
        //     child: Row(
        //       children: [
        //         Expanded(
        //             child: CommentTextFormField(
        //               textEditingController: controller,
        //               hint: 'Use \$ to mention a stock, @ to mention ',
        //             )),
        //         const SizedBox(
        //           width: 16,
        //         ),
        //         InkResponse(
        //           radius: 24,
        //           onTap: () {
        //             var id = DateTime.now().hashCode;
        //             var newData = CommentModel(
        //                 id: id,
        //                 userId: id,
        //                 avatar: 'avatar',
        //                 userName: 'duc$id',
        //                 content: 'abc$id',
        //                 isRoot: false,
        //                 createdAt: DateTime.now().millisecondsSinceEpoch,
        //                 comments: [],
        //                 expanded: false,
        //                 childAmount: id % 3 == 0 ? 3 : 0);
        //             onAddItem(newData);
        //           },
        //           child: SvgPicture.asset(Assets.images.send),
        //         ),
        //       ],
        //     ),
        //   );
        // },
        //onAddItemToList()
      );
    } else {
      return Container();
    }
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
          if (widget.onExpand != null) {
            widget.onExpand!(widget.data);
          }
        } else if (status == AnimationStatus.reverse) {
          if (widget.onCollapse != null) {
            widget.onCollapse!(widget.data);
          }
        }
      });
    commentMockRepository = widget.commentMockRepository;

    print('check init: ${widget.data.id} -- $_isExpanded');
    if (_isExpanded) {
      if (mounted) {
        commentDataSource =
            CommentDataSource(commentMockRepository, userId: widget.data.id);
      }

      _rotationController.forward();
    }
  }

  @override
  void dispose() {
    _rotationController.dispose();
    commentMockRepository.getMainComment(0).then((value) => null);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return BlocListener<CommentMBloc<CommentModel>,
        CommentMState<CommentModel>>(
      listener: (context, state) {
        if (!_isExpanded) {
          _isExpanded = !_isExpanded;
          var newComment = widget.data.copyWith(expanded: _isExpanded, childAmount: widget.data.childAmount+=1);
          widget.onUpdate(newComment);
          if (_isExpanded) {
            commentDataSource = CommentDataSource(commentMockRepository,
                userId: widget.data.id);
            _rotationController.forward();
          } else {
            _rotationController.reverse();
          }
        }
      },
      listenWhen: (oldState, currState) {
        return oldState != currState &&
            currState.requestUpdate.status == UpdateStatus.UPDATE &&
            currState.requestUpdate.updateParentId == widget.data.id;
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          widget.commentItemBuilder(context, widget.data, widget.currentIndex,
              () {
            if (widget.data.childAmount > 0) {
              _isExpanded = !_isExpanded;
              var newComment = widget.data.copyWith(expanded: _isExpanded);
              widget.onUpdate(newComment);
              if (_isExpanded) {
                commentDataSource = CommentDataSource(commentMockRepository,
                    userId: widget.data.id);
                _rotationController.forward();
              } else {
                _rotationController.reverse();
              }
              setState(() {});
            }
          }, () {}, _turnsTween, _rotationController, widget.onUpdate,
              widget.onDelete),
          SizeTransition(
            sizeFactor: _rotationController,
            child: Padding(
              padding: EdgeInsets.only(left: widget.offsetLeft),
              child:
                  _geneTreeNodes(), //column [expanded[custom scrollview] -> addItemBuilder]
            ),
          ),
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
