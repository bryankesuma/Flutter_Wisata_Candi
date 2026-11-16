import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const new({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool _isSignedIn = false;
  String fullName = 'Nathanael Bryan Kesuma';
  String userName = 'BryanK';
  int favoriteCandiCount = 0;
  bool get isSignedIn => _isSignedIn;

  void signIn() {
    setState(() {
      isSignedIn = !isSignedIn;
    });
  }

  void signOut() {
    setState(() {
      isSignedIn = !isSignedIn;
    });
  }

  set isSignedIn(bool value) {
    _isSignedIn = value;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: 200,
            width: double.infinity,
            color: Colors.deepPurple,
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  // Todo 2 Buat ProfileHeader
                  Stack(
                    alignment: Alignment.bottomRight,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.deepPurple,
                            width: 2,
                          ),
                          shape: BoxShape.circle,
                        ),
                        child: const CircleAvatar(
                          radius: 50,
                          backgroundImage: AssetImage(
                            'images/placeholder_image.png',
                          ),
                        ),
                      ),
                      if (isSignedIn)
                        IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.camera_alt,
                            color: Colors.deepPurple[50],
                          ),
                        ),
                    ],
                  ),
                  // Todo 3 Buat ProfileInfo
                  Row(
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: Row(
                          children: [
                            Icon(Icons.lock, color: Colors.amber),
                            SizedBox(height: 8),
                            Text(
                              'Pengguna',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 4),
                            Divider(color: Colors.deepPurple),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Text(
                          ': $userName',
                          style: const TextStyle(fontSize: 18),
                        ),
                      ),
                      if (isSignedIn) const Icon(Icons.edit),
                    ],
                  ),
                  SizedBox(height: 4),
                  Divider(color: Colors.deepPurple),
                  SizedBox(height: 16),
                  // Todo 4 Buat ProfileActions
                  const SizedBox(height: 4),
                  Divider(color: Colors.deepPurple[100]),
                  const SizedBox(height: 20),
                  isSignedIn
                      ? TextButton(
                          onPressed: () {
                            signOut();
                          },
                          child: const Text('Sign Out'),
                        )
                      : TextButton(
                          onPressed: () {
                            signIn();
                          },
                          child: const Text('Sign In'),
                        ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
