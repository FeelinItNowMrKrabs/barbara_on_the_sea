import 'package:barbara_on_the_sea/model/video.dart';
import 'package:barbara_on_the_sea/services/video_service.dart';
import 'package:barbara_on_the_sea/widgets/video_tile.dart';
import 'package:flutter/material.dart';
import 'package:tiktoklikescroller/tiktoklikescroller.dart';

final List<String> _urls = [
  'https://media.lucyinthesky.com/data/Sep21_1/36_SEP_9TH.MP4',
  'https://d3eygssgbalwgq.cloudfront.net/out/v1/0758ce6493cb41389f812e4a86087fc6/e8649871d04846509d0b5126cd598e32/4d2511c79deb4d1f8d2dd34f948404d5/index.m3u8',
  'https://media.lucyinthesky.com/data/Sep21_1/34_SEP_9TH.MP4',
];

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PageController controller = PageController(initialPage: 0);

  VideoService videoService = VideoService();

  @override
  Widget build(BuildContext context) {
    var cunt = videoService.getUpcomingMovies.call().then((value) {
      print('this is the id ${value[0].id}');
      return value;
    });

    return Scaffold(
        body: PageView(
      controller: controller,
      scrollDirection: Axis.vertical,
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          color: Colors.blue,
          child: Center(
            child: VideoTile(_urls[0]),
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          color: Colors.red,
          child: Center(
            child: VideoTile(_urls[1]),
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          color: Colors.yellow,
          child: Center(
            child: VideoTile(_urls[2]),
          ),
        ),
      ],
    ));
  }
}
