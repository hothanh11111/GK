import 'package:flutter/material.dart';
import 'package:spotify_hehe/login.dart';
import 'login.dart';
import 'register_screen.dart';
class LogInOut extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/girl1.png'), 
                fit: BoxFit.cover,
              ),
            ),
          ),
          Center( 
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center, 
              children: [
                Image.asset(
                  'assets/images/Spotify.png',
                  height: 80,
                ),
                const SizedBox(height: 20),
                const Text(
                  'Enjoy Listening To Music',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 40.0),
                  child: Text(
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sagittis enim purus sed phasellus.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white54,
                      fontSize: 16,
                    ),
                  ),
                ),
                const SizedBox(height: 40),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center, 
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(context, 
                        MaterialPageRoute(builder: (context) => RegisterPage()));
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      child: const Text(
                        'Register',
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                    ),
                    const SizedBox(width: 20), 
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(context, 
                        MaterialPageRoute(builder: (context) => LoginPage()));
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      child: const Text(
                        'Sign In',
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 60),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
