class Track {
  final String title;
  final String artist;

  Track({required this.title, required this.artist});

  factory Track.fromJson(Map<String, dynamic> json) {
    return Track(
      title: json['title'] ?? 'Unknown Title',
      artist: json['artist']?['name'] ?? 'Unknown Artist', 
    );
  }
}
