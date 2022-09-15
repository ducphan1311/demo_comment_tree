import 'dart:developer' as developer;

import 'package:chewie/chewie.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:video_player/video_player.dart';

class VideoWidget extends StatefulWidget {
  static const ROUTE_NAME = 'VideoWidget';
  final int videoId;
  final int recordId;

  VideoWidget({required this.videoId, required this.recordId});

  @override
  VideoWidgetState createState() => VideoWidgetState();
}

class VideoWidgetState extends State<VideoWidget> {
  static const TAG = 'VideoWidget';

  late bool isPlay;
  VideoPlayerController? videoPlayerController;
  ChewieController? chewieController;
  @override
  void initState() {
    super.initState();
    isPlay = false;
    chewieController = ChewieController(
        videoPlayerController: VideoPlayerController.contentUri(Uri.parse('http://videocdn.bodybuilding.com/video/mp4/62000/62792m.mp4')));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 256,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          color: Colors.grey),
      child: chewieController != null
          ? Stack(
        children: [
          Positioned.fill(
              child: Chewie(
                controller: chewieController!,
              )),
        ],
      )
          : Center(
        child: CupertinoActivityIndicator(),
      ),
      // child: isPlay
      //     ? Chewie(
      //         controller: chewieController!,
      //       )
      //     : Center(
      //         child: Container(
      //           width: 74,
      //           height: 74,
      //           decoration: BoxDecoration(
      //               borderRadius: BorderRadius.circular(48),
      //               color: Colors.white),
      //           child: Material(
      //             type: MaterialType.transparency,
      //             child: InkWell(
      //               borderRadius: BorderRadius.circular(48),
      //               onTap: () async {
      //                 // await EasyLoading.show(
      //                 //     status: 'Xin vui lòng chờ...',
      //                 //     // dismissOnTap: true,
      //                 //     maskType: EasyLoadingMaskType.black);
      //                 try {
      //                   File file = await recordRepository.getVideo(
      //                       videoId: widget.videoId, recordId: widget.recordId);
      //
      //                   // final decodedBytes =
      //                   //     base64Decode(violationVideo);
      //                   // final directory =
      //                   //     await getApplicationDocumentsDirectory();
      //                   // File file =
      //                   //     Io.File("${directory.path}/duc.mp4");
      //                   // file.writeAsBytesSync(List.from(decodedBytes));
      //
      //                   if (!isPlay) {
      //                     videoPlayerController =
      //                         VideoPlayerController.file(file);
      //                     chewieController = ChewieController(
      //                       videoPlayerController: videoPlayerController!,
      //                       autoPlay: false,
      //                       looping: true,
      //                     );
      //                     await videoPlayerController!
      //                         .initialize()
      //                         .then((value) async {
      //                       await videoPlayerController!.play();
      //                       // await EasyLoading.dismiss();
      //                       setState(() {
      //                         isPlay = true;
      //                       });
      //                     }).onError((error, stackTrace) async {
      //                       // await EasyLoading.dismiss();
      //                       showDialog(
      //                           context: context,
      //                           builder: (contextDialog) {
      //                             return FailDialog(
      //                               title: 'Thất bại',
      //                               content: '$error',
      //                             );
      //                           });
      //                     });
      //                   }
      //                 } catch (e) {
      //                   // await EasyLoading.dismiss();
      //                   showDialog(
      //                       context: context,
      //                       builder: (contextDialog) {
      //                         return FailDialog(
      //                           title: 'Thất bại',
      //                           content: '$e',
      //                         );
      //                       });
      //                 }
      //               },
      //               child: isPlay == true
      //                   ? const CircularProgressIndicator(
      //                       color: ColorConstants.primaryColor,
      //                     )
      //                   : const Icon(
      //                       Icons.play_arrow,
      //                       color: ColorConstants.thirdGrayColor,
      //                       size: 48,
      //                     ),
      //             ),
      //           ),
      //         ),
      //       ),
    );
  }
}
