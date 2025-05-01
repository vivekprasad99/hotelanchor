enum Environment { development, staging, production }

class AppConfig {
  final Environment environment;
  final String apiBaseUrl;
  final bool enableLogging;
  final String supabaseUrl;
  final String supabaseAnonKey;

  const AppConfig({
    required this.environment,
    required this.apiBaseUrl,
    required this.enableLogging,
    required this.supabaseUrl,
    required this.supabaseAnonKey,
  });

  bool get isDevelopment => environment == Environment.development;
  bool get isStaging => environment == Environment.staging;
  bool get isProduction => environment == Environment.production;

  factory AppConfig.development() {
    return const AppConfig(
      environment: Environment.development,
      apiBaseUrl: 'https://dev-api.hotelanchor.com',
      enableLogging: true,
      supabaseUrl: String.fromEnvironment(
        'SUPABASE_URL',
        defaultValue: 'YOUR_SUPABASE_PROJECT_URL',
      ),
      supabaseAnonKey: String.fromEnvironment(
        'SUPABASE_ANON_KEY',
        defaultValue: 'YOUR_SUPABASE_ANON_KEY',
      ),
    );
  }

  factory AppConfig.staging() {
    return const AppConfig(
      environment: Environment.staging,
      apiBaseUrl: 'https://staging-api.hotelanchor.com',
      enableLogging: true,
      supabaseUrl: 'YOUR_SUPABASE_URL',
      supabaseAnonKey: 'YOUR_SUPABASE_ANON_KEY',
    );
  }

  factory AppConfig.production() {
    return const AppConfig(
      environment: Environment.production,
      apiBaseUrl: 'https://api.hotelanchor.com',
      enableLogging: false,
      supabaseUrl: 'YOUR_SUPABASE_URL',
      supabaseAnonKey: 'YOUR_SUPABASE_ANON_KEY',
    );
  }
}
