import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:hotelanchor/firebase_options.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:hotelanchor/app.dart';
import 'package:hotelanchor/core/config/app_config.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final config = AppConfig.development();

  // Temporarily disable Firebase
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  // Initialize Supabase
  await Supabase.initialize(
    url: config.supabaseUrl,
    anonKey: config.supabaseAnonKey,
  );

  runApp(HotelAnchorApp(config: config));
}
