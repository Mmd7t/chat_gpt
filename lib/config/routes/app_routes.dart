import 'package:chat_gpt/features/auth/presentation/pages/auth_page.dart';
import 'package:chat_gpt/features/chat/presentation/pages/home_page.dart';
import 'package:chat_gpt/features/chat/presentation/pages/updates_faq.dart';
import 'package:chat_gpt/features/intro/presentation/pages/onboarding/onboarding_page.dart';
import 'package:chat_gpt/features/intro/presentation/pages/splash_screen.dart';
import 'package:flutter/material.dart';

Map<String, Widget Function(BuildContext)> appRoutes = {
  SplashPage.route: (context) => const SplashPage(),
  OnboardingPage.route: (context) => const OnboardingPage(),
  AuthPage.route: (context) => const AuthPage(),
  HomePage.route: (context) => const HomePage(),
  UpdatesFaqPage.route: (context) => const UpdatesFaqPage(),
};
