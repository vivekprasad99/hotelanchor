import 'package:flutter/material.dart';
import 'package:hotelanchor/app.dart';
import 'package:hotelanchor/core/config/app_config.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  
  final config = AppConfig.staging();
  runApp(HotelAnchorApp(config: config));
}