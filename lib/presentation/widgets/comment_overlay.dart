import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tips_and_tricks_flutter/domain/models/comment_model.dart';
import 'package:tips_and_tricks_flutter/domain/models/user_model.dart';
import 'package:tips_and_tricks_flutter/gen/assets.gen.dart';
import 'package:tips_and_tricks_flutter/utils/cache.dart';

class CommentOverlay extends StatefulWidget {
  static const path = '/comment_overlay';
  const CommentOverlay(
      {Key? key,
      required this.offset,
      required this.onCloseOverlay,
      required this.comment,
        this.onEdit, this.onCopy, this.onReply, this.onShare, this.onReport, this.onDelete})
      : super(key: key);
  final Offset offset;
  final Function()? onCloseOverlay;
  final CommentModel comment;
  final Function()? onEdit;
  final Function()? onCopy;
  final Function()? onReply;
  final Function()? onShare;
  final Function()? onReport;
  final Function()? onDelete;

  @override
  State<CommentOverlay> createState() => _CommentOverlayState();
}

class _CommentOverlayState extends State<CommentOverlay> {
  final UserModel _user = Cache.userModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: Stack(
        children: [
          InkWell(
            onTap: widget.onCloseOverlay,
            child: Container(
              width: double.infinity,
              height: double.infinity,
              color: Colors.transparent,
            ),
          ),
          Positioned.fill(
              left: widget.offset.dx,
              top: widget.offset.dy + 8,
              child: Align(
                alignment: Alignment.topLeft,
                child: Column(
                  children: [
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(16.0),
                      margin: const EdgeInsets.symmetric(horizontal: 16),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Color(0xff1e212c),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          CircleAvatar(
                            child: Container(
                              width: 32,
                              height: 32,
                            ),
                            backgroundColor: Colors.white,
                            radius: 20,
                          ),
                          const SizedBox(
                            width: 16,
                          ),
                          Expanded(
                              child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        widget.comment.userName ?? '',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText2,
                                      ),
                                      const SizedBox(
                                        width: 8,
                                      ),
                                      Expanded(
                                          child: Text(
                                        '5 days ago',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText2!
                                            .copyWith(fontSize: 10),
                                      )),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    widget.comment.content ?? '',
                                    style: Theme.of(context).textTheme.bodyText2!.copyWith(fontSize: 12),
                                  ),
                                ],
                              ),
                            ],
                          )),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 16),
                      child: Row(
                        children: [
                          if (_user.id == widget.comment.id)
                            Row(
                              children: [
                                _buttonWidget(Assets.images.edit, widget.onEdit),
                                const SizedBox(
                                  width: 16,
                                ),
                              ],
                            ),
                          _buttonWidget(Assets.images.copy, widget.onCopy),
                          const SizedBox(
                            width: 16,
                          ),
                          _buttonWidget(Assets.images.reply, widget.onReply),
                          const SizedBox(
                            width: 16,
                          ),
                          if (_user.id != widget.comment.id)
                            Row(
                              children: [
                                _buttonWidget(Assets.images.flag, widget.onReport),
                                const SizedBox(
                                  width: 16,
                                ),
                              ],
                            ),
                          if (_user.id == widget.comment.id)
                            _buttonWidget(Assets.images.trash, widget.onDelete),
                        ],
                      ),
                    )
                  ],
                ),
              ))
        ],
      ),
    );
  }

  Widget _buttonWidget(String icon, Function()? onTap) {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
          color: Color(0xff1e212c), borderRadius: BorderRadius.circular(48)),
      child: Material(
        type: MaterialType.transparency,
        child: InkWell(
          borderRadius: BorderRadius.circular(48),
          onTap: onTap,
          child: Center(
            child: SvgPicture.asset(icon),
          ),
        ),
      ),
    );
  }
}
