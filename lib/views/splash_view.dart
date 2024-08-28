import 'package:flutter/material.dart';
import 'package:news_app/views/home_view.dart';

class SplashView extends StatefulWidget {
  static const String routName = "SplashView";
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();

    Future.delayed(
      Duration(seconds: 4),
      () => Navigator.pushReplacementNamed(context, HomPage.routName),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage("assets/images/background.png"),
            ),
          ),
          child: Center(child: Image.asset("assets/images/splash.png"))),
    );
  }
}
