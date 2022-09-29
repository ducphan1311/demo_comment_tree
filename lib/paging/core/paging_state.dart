import 'package:freezed_annotation/freezed_annotation.dart';

import '../model/paging_status.dart';
part 'paging_state.freezed.dart';

@freezed
abstract class PagingState<PageKeyType, ItemType>
    with _$PagingState<PageKeyType, ItemType> {
  const factory PagingState(
          List<ItemType> items, PagingStatus status, bool hasRequestNextPage) =
      PagingStateData;
  const factory PagingState.loading() = PagingStateLoading;
  const factory PagingState.error(dynamic error) = PagingStateError;
}
