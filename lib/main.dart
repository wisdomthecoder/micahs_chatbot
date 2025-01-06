import 'dart:async';

import 'package:daudamicah/apikey.dart';
import 'package:flutter/material.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:flutter_ai_toolkit/flutter_ai_toolkit.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData(
      colorScheme: ColorScheme.fromSeed(
        seedColor: Colors.teal,
      ),
      appBarTheme: AppBarTheme(
        color: Colors.teal,
      ),
      useMaterial3: true,
    ),
    home: Splash(),
  ));
}

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text(
        "Micah's AI Bot",
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      )),
      body: LlmChatView(
        style: LlmChatViewStyle(
          llmMessageStyle: LlmMessageStyle(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.blueGrey.shade50)),
        ),
        welcomeMessage: """Good Day, Mr. Dauda Micah! 🌞\n
This app was proudly created by your amazing son, Wisdom Dauda. Explore your modern AI app and feel free to ask anything—it’s all here to make your day easier and more fun! 😊""",
        provider: GeminiProvider(
          history: [],
          model: GenerativeModel(
            model: 'gemini-1.5-flash',
            apiKey: APIKEY,
          ),
        ),
      ),
    );
  }
}

class Splash extends StatelessWidget {
  const Splash({super.key});

  @override
  Widget build(BuildContext context) {
    Timer(Duration(seconds: 4), () {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => ChatPage(),
      ));
    });
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 5,
          children: [
            Text(
              "Dedicated to:",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.asset(
                'Micah Dauda.jpg',
                width: MediaQuery.of(context).size.width * .6,
              ),
            ),
            CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}
