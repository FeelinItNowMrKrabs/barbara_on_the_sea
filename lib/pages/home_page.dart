import 'package:barbara_on_the_sea/widgets/video_tile.dart';
import 'package:flutter/material.dart';
import 'package:tiktoklikescroller/tiktoklikescroller.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final List<String> _urls = [
    'https://media.lucyinthesky.com/data/Sep21_1/36_SEP_9TH.MP4',
    'https://d3eygssgbalwgq.cloudfront.net/out/v1/0758ce6493cb41389f812e4a86087fc6/e8649871d04846509d0b5126cd598e32/4d2511c79deb4d1f8d2dd34f948404d5/index.m3u8',
    'https://media.lucyinthesky.com/data/Sep21_1/34_SEP_9TH.MP4',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TikTokStyleFullPageScroller(
          contentSize: _urls.length,
          swipePositionThreshold: 0.2,
          swipeVelocityThreshold: 2000,
          onScrollEvent: _handleCallbackEvent,
          animationDuration: const Duration(milliseconds: 300),
          builder: (BuildContext context, int index) {
            return Container(
              child: VideoTile(_urls[index]),
            );
          }),
    );
  }

  void _handleCallbackEvent(ScrollEventType type, {int? currentIndex}) {
    print(
        "Scroll callback received with data: {type: $type, and index: ${currentIndex ?? 'not given'}}");
  }
}
