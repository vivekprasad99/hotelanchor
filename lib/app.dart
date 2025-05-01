import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:hotelanchor/core/config/app_config.dart';
import 'package:hotelanchor/core/theme/app_theme.dart';
import 'package:hotelanchor/core/routes/app_routes.dart';
import 'package:hotelanchor/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:hotelanchor/features/auth/data/repositories/auth_repository_impl.dart';

class HotelAnchorApp extends StatelessWidget {
  final AppConfig config;

  const HotelAnchorApp({super.key, required this.config});

  @override
  Widget build(BuildContext context) {
    // Create AuthRepository instance with both Firebase and Supabase
    final authRepository = AuthRepositoryImpl(
      supabase: Supabase.instance.client,
    );

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create:
              (context) =>
                  AuthBloc(authRepository: authRepository)
                    ..add(AuthCheckRequested()),
        ),
      ],
      child: MaterialApp(
        title:
            'Hotel Anchor ${config.isDevelopment
                ? '(Dev)'
                : config.isStaging
                ? '(Staging)'
                : ''}',
        theme: AppTheme.lightTheme,
        debugShowCheckedModeBanner: false,
        initialRoute: AppRoutes.splash,
        onGenerateRoute: AppRoutes.generateRoute,
      ),
    );
  }
}
