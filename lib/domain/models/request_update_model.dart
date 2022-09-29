import 'comment_model.dart';

class RequestUpdateModel<ItemType> {
  UpdateStatus status;
  int? updateParentId;
  ItemType? comment;

  RequestUpdateModel({required this.status, required this.updateParentId, required this.comment});
}

enum UpdateStatus { NONE, UPDATE }