import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

// Root App
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login & Profile',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const LoginPage(),
    );
  }
}

// ----------------------
// CUSTOM WIDGETS
// ----------------------
class CustomText extends StatelessWidget {
  final String text;
  final double fontSize;
  final FontWeight fontWeight;

  const CustomText(
    this.text, {
    super.key,
    this.fontSize = 16,
    this.fontWeight = FontWeight.normal,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(fontSize: fontSize, fontWeight: fontWeight),
    );
  }
}

class CustomButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;

  const CustomButton({super.key, required this.label, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        backgroundColor: Colors.blueAccent,
      ),
      onPressed: onPressed,
      child: Text(label),
    );
  }
}

// ----------------------
// LOGIN PAGE
// ----------------------
class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController usernameController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();

    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: Container(
        color: Colors.greenAccent, // ✅ Background hijau
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const CustomText('Username', fontWeight: FontWeight.bold),
            TextField(controller: usernameController),
            const SizedBox(height: 16),
            const CustomText('Password', fontWeight: FontWeight.bold),
            TextField(controller: passwordController, obscureText: true),
            const SizedBox(height: 24),
            CustomButton(
              label: 'Login',
              onPressed: () {
                String username = usernameController.text.trim();
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProfilePage(username: username),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

// ----------------------
// PROFILE PAGE
// ----------------------
class ProfilePage extends StatelessWidget {
  final String username;

  const ProfilePage({super.key, required this.username});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Profile')),
      body: Container(
        color: Colors.yellowAccent, // ✅ Background kuning
        alignment: Alignment.center,
        child: CustomText(
          'Welcome, $username!',
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
