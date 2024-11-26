import 'package:flutter/material.dart';
import 'package:spotify_hehe/music_page.dart';
import 'package:spotify_hehe/track_list_screen.dart';
import 'api_service.dart';
import 'modelTrack.dart';

class HomePage extends StatelessWidget {
  final ApiService apiService = ApiService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        leading: Icon(Icons.search, color: Colors.white),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/Spotify.png', height: 30),
          ],
        ),
        actions: [Icon(Icons.more_vert, color: Colors.white)],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Featured Album Section
              Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    SizedBox(width: 16),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('New Album', style: TextStyle(color: Colors.white, fontSize: 14)),
                        Text('Happier Than Ever', style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
                        Text('Billie Eilish', style: TextStyle(color: Colors.white, fontSize: 14)),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              // Tabs Section
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  TextButton(
                    onPressed: () {},
                    child: Column(
                      children: [
                        Text('News', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                        Container(height: 2, width: 30, color: Colors.green),
                      ],
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => TrackListScreen()),
                      );
                    },
                    child: Text('Video', style: TextStyle(color: Colors.grey)),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text('Artists', style: TextStyle(color: Colors.grey)),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text('Podcasts', style: TextStyle(color: Colors.grey)),
                  ),
                ],
              ),
              SizedBox(height: 20),
              // Horizontal Scroll Section for Albums
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => MusicPage(songTitle: "Bad Guy", artistName: "Billie Eilish")),
                        );
                      },
                      child: Column(
                        children: [
                          Image.asset('assets/images/Badgirl.png', height: 100, width: 100),
                          SizedBox(height: 8),
                          Text('Bad Guy', style: TextStyle(color: Colors.white, fontSize: 14)),
                          Text('Billie Eilish', style: TextStyle(color: Colors.grey, fontSize: 12)),
                        ],
                      ),
                    ),
                    SizedBox(width: 16),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => MusicPage(songTitle: "Scorpion", artistName: "Drake")),
                        );
                      },
                      child: Column(
                        children: [
                          Image.asset('assets/images/anhdaden.png', height: 100, width: 100),
                          SizedBox(height: 8),
                          Text('Scorpion', style: TextStyle(color: Colors.white, fontSize: 14)),
                          Text('Drake', style: TextStyle(color: Colors.grey, fontSize: 12)),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              // Playlist Section
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Playlist',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'See More',
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              ),
              SizedBox(height: 10),
              // Playlist Items
              FutureBuilder<List<Track>>(
                future: apiService.fetchTracks(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}', style: TextStyle(color: Colors.red)));
                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return Center(child: Text('No tracks available.', style: TextStyle(color: Colors.white)));
                  } else {
                    final tracks = snapshot.data!;
                    return Column(
                      children: tracks.map((track) {
                        return ListTile(
                          leading: Icon(Icons.play_circle_fill, color: Colors.white),
                          title: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => MusicPage(
                                    songTitle: track.title,
                                    artistName: track.artist,
                                  ),
                                ),
                              );
                            },
                            child: Text(track.title, style: TextStyle(color: Colors.white)),
                          ),
                          subtitle: Text(track.artist, style: TextStyle(color: Colors.grey)),
                          trailing: Text('3:43', style: TextStyle(color: Colors.grey)), // Adjust duration if available
                        );
                      }).toList(),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
      // Bottom Navigation Bar
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black, 
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed, 
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.favorite_border), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: ''),
        ],
      ),
    );
  }
}
