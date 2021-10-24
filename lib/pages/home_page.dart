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
                  return Text('Loading....');
                default:
                  if (snapshot.hasError)
                    return Text('Error: ${snapshot.error}');
                  else {
                    return PageView(
                      controller: controller,
                      scrollDirection: Axis.vertical,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height,
                          color: Colors.blue,
                          child: Center(
                            child: VideoTile(
                              video: snapshot.data![0],
                              width: _deviceWidth,
                              height: _deviceHeight,
                            ),
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height,
                          color: Colors.red,
                          child: Center(
                            child: VideoTile(
                              video: snapshot.data![1],
                              width: _deviceWidth,
                              height: _deviceHeight,
                            ),
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height,
                          color: Colors.yellow,
                          child: Center(
                            child: VideoTile(
                              video: snapshot.data![2],
                              width: _deviceWidth,
                              height: _deviceHeight,
                            ),
                          ),
                        ),
                      ],
                    );
                  }
              }
            }));
  }
}
