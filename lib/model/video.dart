class Video {
  final int id;
  final String image;
  final String name;
  final String regularVideo;
  final String regularVideoPoster;
  final String? regularVideoMovie;
  final int regularVideoSound;
  final int useRegularVideo;
  final String wideImage;
  final String? wideImageSize;
  final String wideVideoDesktop;
  final String? wideVideoMovie;
  final int wideVideoSound;
  final String special;
  final String href;
  final String? sizes;

  Video({
    required this.id,
    required this.image,
    required this.name,
    required this.regularVideo,
    required this.regularVideoPoster,
    this.regularVideoMovie,
    required this.regularVideoSound,
    required this.useRegularVideo,
    required this.wideImage,
    this.wideImageSize,
    required this.wideVideoDesktop,
    this.wideVideoMovie,
    required this.wideVideoSound,
    required this.special,
    required this.href,
    this.sizes,
  });

  factory Video.fromJson(Map<String, dynamic> _json) {
    return Video(
        id: _json['id'],
        image: _json['image'],
        name: _json['name'],
        regularVideo: _json['regularVideo'],
        regularVideoPoster: _json['regularVideoPoster'],
        regularVideoMovie: _json['regularVideoMovie'],
        regularVideoSound: _json['regularVideoSound'],
        useRegularVideo: _json['useRegularVideo'],
        wideImage: _json['wideImage'],
        wideVideoDesktop: _json['wideVideoDesktop'],
        wideVideoMovie: _json['wideVideoMovie'],
        wideVideoSound: _json['wideVideoSound'],
        special: _json['special'],
        href: _json['href'],
        sizes: _json['size']);
  }
}
