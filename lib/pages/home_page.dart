import 'package:barbara_on_the_sea/model/video.dart';
import 'package:barbara_on_the_sea/services/video_service.dart';
import 'package:barbara_on_the_sea/widgets/video_tile.dart';
import 'package:flutter/material.dart';
import 'package:tiktoklikescroller/tiktoklikescroller.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PageController controller = PageController(initialPage: 0);

  late double _deviceHeight;
  late double _deviceWidth;

  VideoService videoService = VideoService();

  @override
  Widget build(BuildContext context) {
    _deviceHeight = MediaQuery.of(context).size.height;
    _deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        body: FutureBuilder<List<Video>>(
            future: videoService.getUpcomingMovies.call(),
            builder: (context, snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.waiting:
                  return Center(child: CircularProgressIndicator());
                default:
                  if (snapshot.hasError)
                    return Text('Error: ${snapshot.error}');
                  else {
                    return PageView.builder(
                        controller: controller,
                        scrollDirection: Axis.vertical,
                        itemCount: snapshot.data!.length,
                        itemBuilder: (BuildContext _context, int _count) {
                          return Container(
                            width: _deviceWidth,
                            height: _deviceHeight,
                            child: Center(
                              child: VideoTile(
                                video: snapshot.data![_count],
                                width: _deviceWidth,
                                height: _deviceHeight,
                              ),
                            ),
                          );
                        });
                  }
              }
            }));
  }
}
