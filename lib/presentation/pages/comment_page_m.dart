import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tips_and_tricks_flutter/data/data_sources/comment_datasource.dart';
import 'package:tips_and_tricks_flutter/data/data_sources/mock/comment_mock_data_source.dart';
import 'package:tips_and_tricks_flutter/domain/models/comment_model.dart';
import 'package:tips_and_tricks_flutter/gen/assets.gen.dart';
import 'package:tips_and_tricks_flutter/presentation/pages/comment_view.dart';
import 'package:tips_and_tricks_flutter/presentation/widgets/comment_overlay.dart';

class CommentPageM extends StatefulWidget {
  static const path = '/comment_page_m';
  const CommentPageM({Key? key}) : super(key: key);

  @override
  State<CommentPageM> createState() => _CommentPageMState();
}

class _CommentPageMState extends State<CommentPageM> {
  bool _showOverLay = false;
  var _offset = Offset(0, 0);
  late CommentModel _comment;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff000512),
      appBar: AppBar(
        title: Text('CommentPageM'),
      ),
      body: SafeArea(
          child: Stack(
        children: [
          CommentView(
            shrinkWrap: true,
            commentItemBuilder: (_, comment, onShowDetail, onLongPress,
                turnsTween, rotationController, onUpdate, onDelete) {
              final _key = GlobalKey();
              return GestureDetector(
                key: _key,
                onLongPress: () {},
                onTap: () {
                  var renderBoxWidth =
                  _key.currentContext?.findRenderObject() as RenderBox;
                  setState(() {
                    _showOverLay = true;
                    _offset = Offset(renderBoxWidth.localToGlobal(Offset.zero).dx, renderBoxWidth.localToGlobal(Offset.zero).dy - 103);
                    _comment = comment;
                  });
                },
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16),
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
                                          comment.userName ?? '',
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
                                      comment.content ?? '',
                                      style: Theme.of(context).textTheme.bodyText2!.copyWith(fontSize: 12),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 16,
                                ),
                                Row(
                                  children: [
                                    InkWell(
                                      child: SvgPicture.asset(comment.favourite
                                          ? Assets.images.heartSelected
                                          : Assets.images.heart),
                                      onTap: () {
                                        var newComment = comment.copyWith(
                                            favourite: !comment.favourite);
                                        onUpdate(newComment);
                                      },
                                    ),
                                    const SizedBox(
                                      width: 6,
                                    ),
                                    Text(
                                      '3',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText2!
                                          .copyWith(fontSize: 12),
                                    ),
                                    const SizedBox(
                                      width: 24,
                                    ),
                                    SvgPicture.asset(Assets.images.reply),
                                    const SizedBox(
                                      width: 6,
                                    ),
                                    Text(
                                      'Reply ',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText2!
                                          .copyWith(fontSize: 12),
                                    )
                                  ],
                                ),
                                if (comment.childAmount > 0)
                                  Column(
                                    children: [
                                      const SizedBox(
                                        height: 12,
                                      ),
                                      InkWell(
                                        onTap: onShowDetail,
                                        child: Row(
                                          children: [
                                            RotationTransition(
                                              child: Icon(Icons.arrow_drop_down, color: Colors.white,),
                                              turns:
                                                  turnsTween.animate(rotationController),
                                            ),
                                            const SizedBox(
                                              width: 6,
                                            ),
                                            Text(
                                              'See comment',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyText2!
                                                  .copyWith(fontSize: 12),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                              ],
                            )),
                          ],
                        ),
                      ),
                      Divider(thickness: 1, color: Colors.grey,),
                    ],
                  ),
                ),
              );
            },
            commentMockRepository: CommentMockDataSource(),
            addItemBuilder: (context, onAddItem) {
              return Row(
                children: [
                  Expanded(child: TextFormField()),
                  ElevatedButton(
                      onPressed: () {
                        var id = DateTime.now().hashCode;
                        var newData = CommentModel(
                            id: id,
                            userId: id,
                            avatar: 'avatar',
                            userName: 'duc$id',
                            content: 'abc$id',
                            isRoot: false,
                            createdAt: DateTime.now().millisecondsSinceEpoch,
                            comments: [],
                            expanded: false,
                            childAmount: id % 3 == 0 ? 3 : 0);
                        onAddItem(newData);
                      },
                      child: const Text('add')),
                ],
              );
            },
          ),
          if (_showOverLay) CommentOverlay(offset: _offset, onCloseOverlay: (){
            setState(() {
              _showOverLay = false;
            });
          },comment: _comment,),
        ],
      )),
    );
  }
}
