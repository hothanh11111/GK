import 'package:flutter/material.dart';
import 'package:spotify_hehe/choose_log_inout.dart';

class ChooseModePage extends StatefulWidget {
  @override
  _ChooseModePageState createState() => _ChooseModePageState();
}

class _ChooseModePageState extends State<ChooseModePage> {
  String selectedMode = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/girl2.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Column(
            children: [
              const SizedBox(height: 60), 
              Image.asset(
                'assets/images/Spotify.png',
                height: 80,
              ),
              Spacer(),
              const Text(
                'Choose Mode',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Dark Mode Column
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedMode = 'Dark';
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.7),
                        shape: BoxShape.circle,
                        border: selectedMode == 'Dark'
                            ? Border.all(color: Colors.green, width: 2) 
                            : null,
                      ),
                      width: 100, 
                      height: 100,
                      alignment: Alignment.center,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.dark_mode, color: Colors.white, size: 40),
                          const SizedBox(height: 10),
                          const Text(
                            'Dark Mode',
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 40),
                  // Light Mode Column
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedMode = 'Light';
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.7),
                        shape: BoxShape.circle,
                        border: selectedMode == 'Light'
                            ? Border.all(color: Colors.green, width: 2) // Viền khi được chọn
                            : null,
                      ),
                      width: 100, // Đường kính hình tròn lớn hơn
                      height: 100,
                      alignment: Alignment.center,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.light_mode, color: Colors.black, size: 40),
                          const SizedBox(height: 10),
                          const Text(
                            'Light Mode',
                            style: TextStyle(color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 40),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(context, 
                  MaterialPageRoute(builder: (context)=> LogInOut()));
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 20),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: const Text(
                  'Continue',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
              const SizedBox(height: 60), 
            ],
          ),
        ],
      ),
    );
  }
}
