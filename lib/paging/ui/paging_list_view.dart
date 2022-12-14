import 'dart:math';

import 'package:async/async.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/widgets.dart' as widgets;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tips_and_tricks_flutter/domain/models/comment_model.dart';
import 'package:tips_and_tricks_flutter/domain/models/request_update_model.dart';
import 'package:tips_and_tricks_flutter/presentation/blocs/comment_m/comment_m_bloc.dart';
import 'package:tips_and_tricks_flutter/presentation/blocs/comment_m/comment_m_state.dart';

import 'base_widget.dart';
import '../../../paging/fl_stream_paging.dart';

typedef NewPageWidgetBuilder = Widget Function(
  BuildContext context,
  Function()? onLoadMore,
);

typedef AddItemWidgetBuilder<ItemType> = Widget Function(
  BuildContext context,
  Function(ItemType newItem, int index) onUpdate,
);

class PagingListView<PageKeyType, ItemType>
    extends BaseWidget<PageKeyType, ItemType> {
  const PagingListView({
    Key? key,
    this.isEnablePullToRefresh = true,
    this.padding = EdgeInsets.zero,
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
    this.addItemBuilder,
    this.parentId,
    required PagedChildBuilderDelegate<ItemType> builderDelegate,
    required DataSource<PageKeyType, ItemType> pageDataSource,
    WidgetBuilder? emptyBuilder,
    WidgetBuilder? loadingBuilder,
    ErrorBuilder? errorBuilder,
    WidgetBuilder? refreshBuilder,
  })  : _separatorBuilder = null,
        super(
          builderDelegate: builderDelegate,
          emptyBuilder: emptyBuilder,
          loadingBuilder: loadingBuilder,
          errorBuilder: errorBuilder,
          pageDataSource: pageDataSource,
          refreshBuilder: refreshBuilder,
          key: key,
        );

  const PagingListView.separated({
    Key? key,
    this.isEnablePullToRefresh = true,
    this.padding = EdgeInsets.zero,
    required IndexedWidgetBuilder separatorBuilder,
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
    this.addItemBuilder,
    this.parentId,
    required PagedChildBuilderDelegate<ItemType> builderDelegate,
    required DataSource<PageKeyType, ItemType> pageDataSource,
    WidgetBuilder? emptyBuilder,
    WidgetBuilder? loadingBuilder,
    ErrorBuilder? errorBuilder,
    WidgetBuilder? refreshBuilder,
  })  : _separatorBuilder = separatorBuilder,
        super(
          builderDelegate: builderDelegate,
          emptyBuilder: emptyBuilder,
          loadingBuilder: loadingBuilder,
          errorBuilder: errorBuilder,
          pageDataSource: pageDataSource,
          refreshBuilder: refreshBuilder,
          key: key,
        );

  final widgets.EdgeInsets padding;
  final IndexedWidgetBuilder? _separatorBuilder;
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
  final AddItemWidgetBuilder<ItemType>? addItemBuilder;
  final int? parentId;

  @override
  PagingListViewState<PageKeyType, ItemType> createState() =>
      PagingListViewState<PageKeyType, ItemType>();
}

class PagingListViewState<PageKeyType, ItemType>
    extends State<PagingListView<PageKeyType, ItemType>> {
  PagingState<PageKeyType, ItemType> _pagingState = const PagingState.loading();
  // CancelableOperation? cancelableOperation;

  void emit(PagingState<PageKeyType, ItemType> state) {
    if (mounted) {
      setState(() {
        _pagingState = state;
      });
    }
  }

  late DataSource<PageKeyType, ItemType> dataSource;

  Future loadPage({PageKeyType? nextPageKey, bool isRefresh = false}) async {
    // if (cancelableOperation != null && !cancelableOperation!.isCompleted) {
    //   cancelableOperation!.cancel();
    // }
    var items =
        _pagingState.maybeMap((value) => value.items, orElse: () => null);
    // cancelableOperation = CancelableOperation.fromFuture(
    //     dataSource.loadPage(isRefresh: isRefresh));
    dataSource.loadPage(isRefresh: isRefresh).then((value) {
      int? itemCount = isRefresh
          ? [...value].length
          : items != null
              ? [...items, ...value].length
              : [...value].length;

      bool hasNextPage = dataSource.currentKey != null && !dataSource.isEndList;

      bool hasItems = itemCount > 0;

      bool isListingUnfinished = hasItems && hasNextPage;

      bool isOngoing = isListingUnfinished;

      bool isCompleted = hasItems && !hasNextPage;

      /// The current pagination status.
      PagingStatus status =
          (isOngoing) ? PagingStatus.ongoing : PagingStatus.completed;

      var pagingItems = isRefresh
          ? [...value]
          : items != null
              ? [...items, ...value]
              : [...value];

      emit(PagingState<PageKeyType, ItemType>(pagingItems, status, false));
    }, onError: (e) {
      if (dataSource.currentKey == null) {
        emit(PagingState<PageKeyType, ItemType>.error(e));
      } else {
        _pagingState.maybeMap(
            (value) => emit(PagingState<PageKeyType, ItemType>(
                value.items, PagingStatus.noItemsFound, true)),
            orElse: () => null);
      }
    });
  }

  void copyWith(ItemType newItem, int index) {
    print('copyWith: ${(newItem as CommentModel).childAmount} -- $index');
    _pagingState.maybeMap((value) {
      var items = [...value.items];
      items[index] = newItem;
      emit(PagingStateData(items, value.status, value.hasRequestNextPage));
    }, orElse: () => null);
  }

  void addItem(ItemType newItem) {
    _pagingState.maybeMap((value) {
      var items = [...value.items, newItem];
      emit(PagingStateData(items, value.status, value.hasRequestNextPage));
    }, orElse: () => null);
  }

  void deleteItem(int index) {
    _pagingState.maybeMap((value) {
      var items = [...value.items];
      items.removeWhere((element) => items.indexOf(element) == index);
      emit(PagingStateData(items, value.status, value.hasRequestNextPage));
    }, orElse: () => null);
  }

  void requestNextPage({bool hasRequestNextPage = true}) {
    _pagingState.maybeMap(
        (value) => emit(PagingState<PageKeyType, ItemType>(
            value.items, value.status, hasRequestNextPage)),
        orElse: () => null);
  }

  @override
  void initState() {
    super.initState();
    dataSource = widget.pageDataSource;
    loadPage();
  }

  @override
  void didUpdateWidget(
      covariant PagingListView<PageKeyType, ItemType> oldWidget) {
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    // cancelableOperation?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print(
        'PagingListView: addItem build: ${context.hashCode}');
    return BlocConsumer<CommentMBloc<ItemType>, CommentMState<ItemType>>(
      builder: (context, state) {
        return _pagingState.when((items, status, hasRequestNextPage) {
          return
              widget.addItemBuilder != null
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Expanded(
                        child: _pagingSilverBuilder(items: items, status: status),
                      ),
                      if (widget.addItemBuilder != null)
                        widget.addItemBuilder!(context, (newItem, index) => copyWith(newItem, index))
                    ],
                  )
                :
              _pagingSilverBuilder(items: items, status: status);
        },
            loading: () => (widget.loadingBuilder != null)
                ? widget.loadingBuilder!(context)
                : PagingDefaultLoading(),
            error: (error) => widget.errorBuilder != null
                ? widget.errorBuilder!(context, error)
                : PagingDefaultErrorWidget(
                    errorMessage: error,
                    onPressed: () async {
                      await loadPage(isRefresh: true);
                    },
                  ));
      },
      listener: (context, state) async {
        if (state.requestUpdate.comment!=null) {
          if (state.requestUpdate.updateParentId == widget.parentId) {
            print('listener: ${state.requestUpdate.updateParentId} -- ${widget.parentId}');
            addItem(state.requestUpdate.comment!);
          }
        }
      },
      listenWhen: (oldState, currState) {
        return
            currState.requestUpdate.status == UpdateStatus.UPDATE
            && (currState.requestUpdate.updateParentId == widget.parentId);
      },
    );
  }

  Widget _buildListItemWidget({
    required BuildContext context,
    required int index,
    required List<ItemType> itemList,
    required int itemCount,
  }) {
    var hasRequestedNextPage = _pagingState
        .maybeMap((value) => value.hasRequestNextPage, orElse: () => false);
    if (!hasRequestedNextPage) {
      final newPageRequestTriggerIndex =
          max(0, itemCount - widget.invisibleItemsThreshold);

      final isBuildingTriggerIndexItem = index == newPageRequestTriggerIndex;

      if (!dataSource.isEndList && isBuildingTriggerIndexItem) {
        // Schedules the request for the end of this frame.
        WidgetsBinding.instance.addPostFrameCallback((_) async {
          requestNextPage();
          await loadPage();
          // _pagingController.notifyPageRequestListeners(_nextKey!);
        });
      }
    }

    final item = itemList[index];
    return widget.builderDelegate.itemBuilder(context, item, index, (newItem) {
      copyWith(newItem, index);
    }, () => deleteItem(index));
  }

  SliverMultiBoxAdaptorWidget _buildSliverList(
    IndexedWidgetBuilder itemBuilder,
    int itemCount, {
    WidgetBuilder? statusIndicatorBuilder,
  }) {
    final delegate = _buildSliverDelegate(
      itemBuilder,
      itemCount,
      statusIndicatorBuilder: statusIndicatorBuilder,
    );

    final itemExtent = widget.itemExtent;

    return (itemExtent == null || widget._separatorBuilder != null)
        ? SliverList(
            delegate: delegate,
          )
        : SliverFixedExtentList(
            delegate: delegate,
            itemExtent: itemExtent,
          );
  }

  SliverChildBuilderDelegate _buildSliverDelegate(
    IndexedWidgetBuilder itemBuilder,
    int itemCount, {
    WidgetBuilder? statusIndicatorBuilder,
  }) {
    final separatorBuilder = widget._separatorBuilder;
    return separatorBuilder == null
        ? AppendedSliverChildBuilderDelegate(
            builder: itemBuilder,
            childCount: itemCount,
            appendixBuilder: statusIndicatorBuilder,
            addAutomaticKeepAlives: widget.addAutomaticKeepAlives,
            addRepaintBoundaries: widget.addRepaintBoundaries,
            addSemanticIndexes: widget.addSemanticIndexes,
            semanticIndexCallback: widget.semanticIndexCallback,
          )
        : AppendedSliverChildBuilderDelegate.separated(
            builder: itemBuilder,
            childCount: itemCount,
            appendixBuilder: statusIndicatorBuilder,
            separatorBuilder: separatorBuilder,
            addAutomaticKeepAlives: widget.addAutomaticKeepAlives,
            addRepaintBoundaries: widget.addRepaintBoundaries,
            addSemanticIndexes: widget.addSemanticIndexes,
          );
  }

  WidgetBuilder _defaultRefreshBuilder(BuildContext context) {
    return (context) => CupertinoSliverRefreshControl(
          refreshTriggerPullDistance: 100.0,
          refreshIndicatorExtent: 60.0,
          onRefresh: () async {
            await loadPage(isRefresh: true);
          },
        );
  }

  Widget _pagingSilverBuilder(
      {required List<ItemType> items, required PagingStatus status}) {
    return PagingSilverBuilder<PageKeyType, ItemType>(
      builderDelegate: widget.builderDelegate,
      padding: widget.padding,
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
      completedListingBuilder: (_) => _buildSliverList(
        (context, index) => _buildListItemWidget(
          context: context,
          index: index,
          itemList: items,
          itemCount: items.length,
        ),
        items.length,
        statusIndicatorBuilder: widget.newPageCompletedIndicatorBuilder,
      ),
      loadingListingBuilder: (_) => _buildSliverList(
        (context, index) => _buildListItemWidget(
          context: context,
          index: index,
          itemList: items,
          itemCount: items.length,
        ),
        items.length,
        statusIndicatorBuilder: (_) =>
            (widget.newPageProgressIndicatorBuilder != null) ?
                // ? widget.addItemBuilder!(context, (newItem) => addItem(newItem))
                widget.newPageProgressIndicatorBuilder!(context, () async {
                        await loadPage();
                      })
                : const NewPageProgressIndicator(),
      ),
      errorListingBuilder: (_) => _buildSliverList(
        (context, index) => _buildListItemWidget(
          context: context,
          index: index,
          itemList: items,
          itemCount: items.length,
        ),
        items.length,
        statusIndicatorBuilder: widget.newPageErrorIndicatorBuilder,
      ),
      status: status,
      refreshBuilder: (_) => widget.isEnablePullToRefresh
          ? ((widget.refreshBuilder ?? _defaultRefreshBuilder(_))(_))
          : const SliverToBoxAdapter(),
    );
  }
}
