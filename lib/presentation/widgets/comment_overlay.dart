import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tips_and_tricks_flutter/domain/models/comment_model.dart';
import 'package:tips_and_tricks_flutter/gen/assets.gen.dart';

class CommentOverlay extends StatefulWidget {
  static const path = '/comment_overlay';
  const CommentOverlay(
      {Key? key,
      required this.offset,
      required this.onCloseOverlay, required this.comment})
      : super(key: key);
  final Offset offset;
  final Function()? onCloseOverlay;
  final CommentModel comment;

  @override
  State<CommentOverlay> createState() => _CommentOverlayState();
}

class _CommentOverlayState extends State<CommentOverlay> {
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
              color: Colors.black.withOpacity(0.5),
            ),
          ),
          Positioned.fill(
              left: widget.offset.dx,
              top: widget.offset.dy - 8,
              child: Align(
                alignment: Alignment.topLeft,
                child: Column(
                  children: [
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(16.0),
                      margin: const EdgeInsets.symmetric(horizontal: 16),

                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(8),
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
                            backgroundColor: Colors.black,
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
                                            style: Theme.of(context).textTheme.bodyText2,
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
                                        style: Theme.of(context).textTheme.caption,
                                      ),
                                    ],
                                  ),
                                ],
                              )),
                        ],
                      ),
                    ),
                    const SizedBox(height: 8,),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 16),
                      child: Row(
                        children: [
                          Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                              color: Color(0xff1e212c),
                              borderRadius: BorderRadius.circular(48)
                            ),
                            child: Center(child: SvgPicture.asset(Assets.images.copy),),
                          ),
                          const SizedBox(width: 16,),
                          Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                                color: Color(0xff1e212c),
                                borderRadius: BorderRadius.circular(48)
                            ),
                            child: Center(child: SvgPicture.asset(Assets.images.reply),),
                          ),
                          const SizedBox(width: 16,),
                          Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                                color: Color(0xff1e212c),
                                borderRadius: BorderRadius.circular(48)
                            ),
                            child: Center(child: SvgPicture.asset(Assets.images.flag),),
                          ),
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
}
