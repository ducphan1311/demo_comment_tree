import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stream_paging/fl_stream_paging.dart';
import 'package:tips_and_tricks_flutter/data/data_sources/comment_datasource.dart';
import 'package:tips_and_tricks_flutter/data/repositories/comment/comment_mock_repository.dart';
import 'package:tips_and_tricks_flutter/domain/models/comment_model.dart';
import 'package:tips_and_tricks_flutter/presentation/blocs/comment/comment_bloc.dart';
import 'package:tips_and_tricks_flutter/presentation/widgets/comment_tree_view/comment_tree.dart';
import 'package:flutter/widgets.dart' as widgets;


class CommentView<R extends CommentMockRepository> extends StatefulWidget {
  static const path = '/comment_page_3';
  const CommentView({
    Key? key,
    this.offsetLeft = 24,
    this.onExpand,
    this.onCollapse,
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
    this.addItemBuilder,
  }) : super(key: key);

  final double offsetLeft;
  final void Function(CommentModel node)? onExpand;
  final void Function(CommentModel node)? onCollapse;
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
  final AddItemWidgetBuilder? addItemBuilder;

  @override
  CommentViewState<R> createState() => CommentViewState<R>();
}

class CommentViewState<R extends CommentMockRepository> extends State<CommentView<R>> {
  late CommentBloc commentBloc;
  late CommentDataSource commentDataSource;
  late TextEditingController controller;

  @override
  void initState() {
    super.initState();
    commentDataSource = CommentDataSource(widget.commentMockRepository);
    controller = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return PagingListView<int, CommentModel>.separated(
      builderDelegate: PagedChildBuilderDelegate<CommentModel>(
        itemBuilder: (context, data, child, onUpdate, onDelete) {
          return CommentTree<CommentMockRepository>(
            key: ValueKey(data.id),
            data: data,
            offsetLeft: widget.offsetLeft,
            onExpand: widget.onExpand,
            onCollapse: widget.onCollapse,
            onUpdate: onUpdate,
            onDelete: onDelete,
            commentItemBuilder: widget.commentItemBuilder,
            commentMockRepository: widget.commentMockRepository,
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
          );
        },
      ),
      pageDataSource: commentDataSource,
      separatorBuilder: widget.separatorBuilder ?? (_, i) => SizedBox(),
      errorBuilder: widget.errorBuilder,
      isEnablePullToRefresh: widget.isEnablePullToRefresh,
      padding: widget.padding,
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
      addItemBuilder: widget.addItemBuilder,
    );
  }
}
