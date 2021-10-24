import 'package:barbara_on_the_sea/model/video.dart';
import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class VideoTile extends ConsumerStatefulWidget {
  VideoTile({
    required this.video,
    required this.height,
    required this.width,
  });

  final Video video;
  final double height;
  final double width;

  @override
  _VideoTileState createState() => _VideoTileState();
}

class _VideoTileState extends ConsumerState<VideoTile> {
  late VideoPlayerController videoPlayerController;

  bool isPaused = false;

  @override
  void initState() {
    super.initState();

    videoPlayerController =
        VideoPlayerController.network(widget.video.regularVideo)
          ..initialize().then(
            (_) {
              videoPlayerController.play();
              setState(() {});
            },
          );
    //videoPlayerController.initialize().then((_) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.black,
        body: SizedBox(
          height: widget.height,
          width: widget.width,
          child: GestureDetector(
            onTap: () {
              if (isPaused) {
                videoPlayerController.play();
                setState(() {
                  isPaused = false;
                });
              } else {
                videoPlayerController.pause();
                setState(() {
                  isPaused = true;
                });
              }
            },
            child: Stack(children: [
              videoPlayerController.value.isInitialized
                  ? Container(
                      height: widget.height,
                      width: widget.width,
                      child: AspectRatio(
                        aspectRatio: videoPlayerController.value.aspectRatio,
                        child: VideoPlayer(videoPlayerController),
                      ),
                    )
                  : Center(
                      child: Container(
                        height: widget.height,
                        width: widget.width,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                          fit: BoxFit.fill,
                          image: NetworkImage(widget.video.image),
                        )),
                      ),
                    ),
              if (isPaused)
                const Align(
                  alignment: Alignment.center,
                  child: Icon(
                    Icons.play_arrow,
                    size: 120.0,
                    color: Colors.white70,
                  ),
                ),
              // Center(
              //   child: RaisedButton(onPressed: () {
              //     setState(() {});
              //   }),
              // )
            ]),
          ),
        ));
  }

  @override
  void dispose() {
    videoPlayerController.dispose();

    super.dispose();
  }
}
