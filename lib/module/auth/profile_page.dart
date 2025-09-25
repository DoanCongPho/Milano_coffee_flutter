import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_coffee_app/cores/repositories/city_repository.dart';
import 'package:flutter_coffee_app/model/remote/city.dart';
import 'package:flutter_coffee_app/provider/facebook_sign_in.dart';
import 'package:flutter_coffee_app/provider/google_signIn_provider.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  Stream<List<City>> _loadCity() {
    final repo = CityRepository(FirebaseFirestore.instance);
    return repo.listenMultipleCity();
  }

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () async {
              final user = FirebaseAuth.instance.currentUser;

              if (user != null) {
                for (final info in user.providerData) {
                  if (info.providerId == 'google.com') {
                    final googleProvider = Provider.of<GoogleSigninProvider>(
                      context,
                      listen: false,
                    );
                    await googleProvider.logout();
                  } else if (info.providerId == 'facebook.com') {
                    final facebookProvider =
                        Provider.of<FacebookSignInProvider>(
                          context,
                          listen: false,
                        );
                    await facebookProvider.logout();
                  }
                }
              }

              Navigator.of(context).pushReplacementNamed('/login_page');
            },
          ),
        ],
      ),
      body: user == null
          ? const Center(child: Text("Chưa đăng nhập"))
          : Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: NetworkImage(
                      user.photoURL ??
                          "https://www.pngitem.com/pimgs/m/146-1468479_my-profile-icon-blank-profile-picture-circle-hd.png",
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    user.displayName ?? "No name",
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(user.email ?? "No email"),
                  const SizedBox(height: 20),
                  StreamBuilder<List<City>>(
                    stream: _loadCity(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const CircularProgressIndicator();
                      }
                      if (snapshot.hasError) {
                        return Text("Error: ${snapshot.error}");
                      }

                      final cities = snapshot.data ?? [];
                      if (cities.isEmpty) return const Text("No city found");

                      return Column(
                        children: cities.map((city) {
                          return Text(
                            "City: ${city.name}, Country: ${city.country}",
                          );
                        }).toList(),
                      );
                    },
                  ),
                ],
              ),
            ),
    );
  }
}
