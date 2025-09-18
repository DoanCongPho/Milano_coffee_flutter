import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
import 'package:flutter_coffee_app/provider/google_signIn_provider.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser; // user hiện tại

    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () async {
              // gọi provider logout
              final provider = Provider.of<GoogleSigninProvider>(
                context,
                listen: false,
              );
              await provider.logout();

              // quay về LoginPage
              Navigator.of(context).pushReplacementNamed('/login_page');
            },
          ),
        ],
      ),
      body: Center(
        child: user == null
            ? Text("Chưa đăng nhập")
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: NetworkImage(
                      user.photoURL ??
                          "https://www.pngitem.com/pimgs/m/146-1468479_my-profile-icon-blank-profile-picture-circle-hd.png",
                    ),
                  ),
                  SizedBox(height: 16),
                  Text(
                    user.displayName ?? "No name",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Text(user.email ?? "No email"),
                ],
              ),
      ),
    );
  }
}
