import 'package:barbara_on_the_sea/model/video.dart';
import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class VideoTile extends ConsumerStatefulWidget {
  const VideoTile({
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
  bool hasVideo = true;

  @override
  void initState() {
    super.initState();

    if (widget.video.regularVideo != '') {
      videoPlayerController =
          VideoPlayerController.network(widget.video.regularVideo)
            ..initialize().then(
              (_) {
                videoPlayerController.play();
                videoPlayerController.setLooping(true);
                setState(() {});
              },
            );
    } else {
      hasVideo = false;
    }
    //videoPlayerController.initialize().then((_) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        body: SizedBox(
          height: widget.height,
          width: widget.width,
          child: GestureDetector(
            onTap: () {
              if (hasVideo) {
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
              }
            },
            child: Stack(
              children: [
                hasVideo
                    ? videoPlayerController.value.isInitialized
                        ? SizedBox(
                            height: widget.height,
                            width: widget.width,
                            child: AspectRatio(
                              aspectRatio:
                                  videoPlayerController.value.aspectRatio,
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

                if (!hasVideo)
                  Center(
                    child: Stack(
                      children: [
                        Container(
                          height: widget.height,
                          width: widget.width,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                            fit: BoxFit.fill,
                            image: NetworkImage(widget.video.image),
                          )),
                        ),
                        Container(
                          alignment: Alignment.topCenter,
                          padding: const EdgeInsets.only(top: 40.0),
                          child: const Text('Photo only'),
                        ),
                      ],
                    ),
                  ),

                if (isPaused) _pauseButtonWidget(),

                _productInfoWidget(),
                _sideButtonsWidget(),
                // Center(
                //   child: RaisedButton(onPressed: () {
                //     setState(() {});
                //   }),
                // )
              ],
            ),
          ),
        ));
  }

  Widget _productInfoWidget() {
    return Container(
      padding: const EdgeInsets.fromLTRB(18.0, 0, 0, 106.0),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.only(top: 10.0),
            child: Text(
              widget.video.name,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 15,
              ),
            ),
          ),
          Row(
            children: [
              Container(
                child: Text(
                  widget.video.price,
                  style: const TextStyle(
                    decoration: TextDecoration.lineThrough,
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(left: 5.0),
                child: Text(
                  widget.video.special,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _sideButtonsWidget() {
    return Container(
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: const [
              Padding(
                padding: EdgeInsets.only(top: 350),
              ),
              Icon(
                Icons.exit_to_app,
                color: Colors.white,
                size: 30,
              ),
              Icon(
                Icons.favorite,
                color: Colors.white,
                size: 30,
              ),
              Icon(
                Icons.shop,
                color: Colors.white,
                size: 30,
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 150),
              ),
            ],
          ),
          const Padding(
            padding: EdgeInsets.only(right: 35),
          )
        ],
      ),
    );
  }

  Widget _pauseButtonWidget() {
    return const Align(
      alignment: Alignment.center,
      child: Icon(
        Icons.play_arrow,
        size: 120.0,
        color: Colors.white70,
      ),
    );
  }

  @override
  void dispose() {
    if (hasVideo) {
      videoPlayerController.dispose();
    }
    super.dispose();
  }
}
