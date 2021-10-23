import 'package:barbara_on_the_sea/model/video.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

class VideoService {
  final GetIt getIt = GetIt.instance;

  Future<List<Video>> getUpcomingMovies() async {
    Response? _response = await Dio()
        .get('https://lucy-test1.s3.amazonaws.com/response_1632323783535.json');
    if (_response.statusCode == 200) {
      Map _data = _response.data;
      List<Video> _movies = _data['data'].map<Video>((_videoData) {
        return Video.fromJson(_videoData);
      }).toList();
      return _movies;
    } else {
      throw Exception('Couldnt load idk');
    }
  }
}
