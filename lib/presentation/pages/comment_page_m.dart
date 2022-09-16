import 'package:flutter/material.dart';
import 'package:tips_and_tricks_flutter/data/data_sources/comment_datasource.dart';
import 'package:tips_and_tricks_flutter/data/data_sources/mock/comment_mock_data_source.dart';
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
              onUpdate: (comment) {},
              commentItemBuilder: (_, comment, onShowDetail, onLongPress,
                  turnsTween, rotationController) {
                return GestureDetector(
                  onLongPress: () {},
                  onTap: onShowDetail,
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
                          backgroundColor: Colors.white,
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
                                Text('Reply'),
                              ],
                            ),
                            const SizedBox(height: 12,),
                            if (comment.childAmount > 0) RotationTransition(child: Container(),
                              turns: turnsTween.animate(rotationController),
                            )
                          ],
                        )),
                        // comment.childAmount > 0
                        //     ? RotationTransition(
                        //         child: Icon(Icons.ac_unit),
                        //         turns: turnsTween.animate(rotationController),
                        //       )
                        //     : const SizedBox(width: 16, height: 16),
                        // Expanded(
                        //   child: Row(
                        //     children: [
                        //       Padding(
                        //         padding: const EdgeInsets.only(left: 8.0),
                        //         child: Text(
                        //             comment.userName ?? 'not found user name'),
                        //       ),
                        //       Expanded(
                        //         child: Padding(
                        //           padding: const EdgeInsets.symmetric(
                        //               horizontal: 6.0),
                        //           child: Text(
                        //             comment.content ?? 'not found content',
                        //             maxLines: 1,
                        //             overflow: TextOverflow.ellipsis,
                        //             style:
                        //                 Theme.of(context).textTheme.subtitle1,
                        //           ),
                        //         ),
                        //       ),
                        //     ],
                        //   ),
                        // ),
                      ],
                    ),
                  ),
                );
              },
              commentMockRepository: CommentMockDataSource())),
    );
  }
}
