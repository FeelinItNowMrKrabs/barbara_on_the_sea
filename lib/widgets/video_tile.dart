import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoTile extends StatefulWidget {
  const VideoTile(this.url);

  final String url;

  @override
  _VideoTileState createState() => _VideoTileState();
}

class _VideoTileState extends State<VideoTile> {
  late final videoPlayerController = VideoPlayerController.network(widget.url);
  late ChewieController chewieController;

  bool isPaused = false;

  @override
  void initState() {
    super.initState();
    chewieController = ChewieController(
      videoPlayerController: videoPlayerController,
      aspectRatio: 9 / 16,
      autoPlay: true,
      looping: true,
      autoInitialize: true,
      showControls: false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: GestureDetector(
      onTap: () {
        if (isPaused) {
          chewieController.videoPlayerController.play();
          isPaused = false;
          setState(() {});
        } else {
          chewieController.videoPlayerController.pause();
          isPaused = true;
          setState(() {});
        }
      },
      child: Stack(children: [
        Container(
          child: Chewie(controller: chewieController),
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
      ]),
    ));
  }

  @override
  void dispose() {
    videoPlayerController.dispose();
    chewieController.dispose();
    super.dispose();
  }
}
