import 'package:flutter/material.dart';
import 'api_service.dart';
import 'modelTrack.dart';

class TrackListScreen extends StatelessWidget {
  final ApiService apiService = ApiService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Danh Sách Bài Hát')),
      body: FutureBuilder<List<Track>>(
        future: apiService.fetchTracks(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            print('Error occurred: ${snapshot.error}');
            return Center(child: Text('Lỗi: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('Không có bài hát nào.'));
          } else {
            final tracks = snapshot.data!;
            return ListView.builder(
              itemCount: tracks.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(tracks[index].title),
                  subtitle: Text(tracks[index].artist),
                );
              },
            );
          }
        },
      ),
    );
  }
}
