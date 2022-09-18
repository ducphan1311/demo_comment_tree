import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tips_and_tricks_flutter/data/data_sources/comment_datasource.dart';
import 'package:tips_and_tricks_flutter/data/data_sources/mock/comment_mock_data_source.dart';
import 'package:tips_and_tricks_flutter/gen/assets.gen.dart';
import 'package:tips_and_tricks_flutter/presentation/pages/comment_view.dart';

class CommentPageM extends StatefulWidget {
  static const path = '/comment_page_m';
  const CommentPageM({Key? key}) : super(key: key);

  @override
  State<CommentPageM> createState() => _CommentPageMState();
}

class _CommentPageMState extends State<CommentPageM> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CommentPageM'),
      ),
      body: SafeArea(
          child: CommentView(
              commentItemBuilder: (_, comment, onShowDetail, onLongPress,
                  turnsTween, rotationController, onUpdate) {
                return GestureDetector(
                  onLongPress: () {},
                  onTap: (){
                    print('onTap');
                  },
                  child: Container(
                    width: double.infinity,
                    margin: const EdgeInsets.all(4.0),
                    padding: const EdgeInsets.only(right: 12.0),
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
                        const SizedBox(width: 16,),
                        Expanded(child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(children: [
                              Text(comment.userName??'', style: Theme.of(context).textTheme.bodyText2,),
                              const SizedBox(width: 8,),
                              Expanded(child: Text('5 days ago', style: Theme.of(context).textTheme.bodyText2!.copyWith(fontSize: 10),)),
                            ],),
                            const SizedBox(height: 10,),
                            Text(comment.content??'',style: Theme.of(context).textTheme.caption,),
                            const SizedBox(height: 16,),
                            Row(
                              children: [
                                InkWell(child: SvgPicture.asset(comment.favourite ? Assets.images.heartSelected : Assets.images.heart),
                                onTap: (){
                                  onUpdate(comment);
                                },),
                                const SizedBox(width: 6,),
                                Text('3', style: Theme.of(context).textTheme.bodyText2!.copyWith(fontSize: 12),),
                                const SizedBox(width: 24,),
                                SvgPicture.asset(Assets.images.reply),
                                const SizedBox(width: 6,),
                                Text('Reply ', style: Theme.of(context).textTheme.bodyText2!.copyWith(fontSize: 12),)
                              ],
                            ),
                            const SizedBox(height: 12,),

                            if (comment.childAmount > 0) InkWell(
                              onTap: onShowDetail,
                              child: Row(
                                children: [
                                  RotationTransition(child: Icon(Icons.arrow_drop_down),
                                    turns: turnsTween.animate(rotationController),
                                  ),
                                  const SizedBox(width: 6,),
                                  Text('See comment', style: Theme.of(context).textTheme.bodyText2!.copyWith(fontSize: 12),),
                                ],
                              ),
                            )
                          ],
                        )),
                      ],
                    ),
                  ),
                );
              },
              commentMockRepository: CommentMockDataSource())),
    );
  }
}
