class Video{

  final String name;
  final String src;
  final String thumbnail;

  const Video({
    required this.name,
    required this.src,
    required this.thumbnail,
  });
}

const videos = [
  Video(name: 'Vokal', src: 'assets/video/vokal.mp4', thumbnail: 'assets/vokal.png'),
  Video(name: 'Konsonan', src: 'assets/video/konsonan.mp4', thumbnail: 'assets/konsonan.png')
];