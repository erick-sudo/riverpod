import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpodtutorial/controllers/auth_controller.dart';
import 'package:riverpodtutorial/screens/image_picker_demo_screen.dart';
import 'package:riverpodtutorial/screens/profile_screen.dart';

class HomeScreen extends ConsumerWidget {
  static String name = 'Home';
  static String path = '/';
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Home Screen"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Center(
              child: Column(
                children: [
                  const Text("Welcome to Riverpod!"),
                  SizedBox(
                    height: 24,
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      await ref.read(authControllerProvider.notifier).signOut();
                    },
                    child: const Text("Sign Out"),
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      context.go(ProfileScreen.path);
                    },
                    child: const Text("Go to Profile"),
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      context.go(ImagePickerDemoScreen.path);
                    },
                    child: const Text("Image Picker Lab"),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
