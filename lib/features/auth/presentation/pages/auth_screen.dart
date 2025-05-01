import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:timer_count_down/timer_count_down.dart';
import '../bloc/auth_bloc.dart';
import '../../../../core/routes/app_routes.dart';
import '../../../../core/widgets/custom_loading_widget.dart';
import '../../../../core/widgets/phone_input_field.dart';
import '../../../../core/widgets/otp_input_field.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final _phoneController = TextEditingController();
  final _otpController = TextEditingController();
  final _nameController = TextEditingController();
  bool _otpSent = false;
  bool _canResendOTP = false;

  String? _phoneError;
  String? _otpError;
  String? _nameError;

  @override
  void initState() {
    super.initState();
    // Add listeners for real-time validation
    _phoneController.addListener(_validatePhone);
    _nameController.addListener(_validateName);
  }

  void _validatePhone() {
    final phone = _phoneController.text.replaceAll(' ', '');
    if (phone.length == 10) {
      setState(() => _phoneError = null);
    }
  }

  void _validateName() {
    if (_nameController.text.trim().isNotEmpty) {
      setState(() => _nameError = null);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthOTPSent) {
            setState(() {
              _otpSent = true;
              _canResendOTP = false;
            });
          } else if (state is AuthAuthenticated) {
            Navigator.pushReplacementNamed(context, AppRoutes.home);
          } else if (state is AuthFailure) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(state.message)));
          }
        },
        builder: (context, state) {
          return SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(height: 48),
                  Text(
                    'Welcome to Hotel Anchor',
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Sign in to access exclusive features and offers',
                    style: Theme.of(context).textTheme.bodyMedium,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 48),
                  if (!_otpSent) ...[
                    TextField(
                      controller: _nameController,
                      decoration: InputDecoration(
                        labelText: 'Full Name',
                        errorText: _nameError,
                        border: const OutlineInputBorder(),
                        filled: true,
                        fillColor: Theme.of(context).colorScheme.surface,
                      ),
                      enabled: state is! AuthLoading,
                      textCapitalization: TextCapitalization.words,
                    ),
                    const SizedBox(height: 24),
                    PhoneInputField(
                      controller: _phoneController,
                      errorText: _phoneError,
                      enabled: state is! AuthLoading,
                      onChanged: (value) {
                        if (value.length == 10) {
                          setState(() => _phoneError = null);
                        }
                      },
                    ),
                    const SizedBox(height: 24),
                    SizedBox(
                      height: 50,
                      child: ElevatedButton(
                        onPressed:
                            state is AuthLoading
                                ? null
                                : () => _handleSendOTP(),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFB08968),
                          foregroundColor:
                              Theme.of(context).colorScheme.onPrimary,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          elevation: 2,
                        ),
                        child:
                            state is AuthLoading
                                ? const SizedBox(
                                  height: 20,
                                  width: 20,
                                  child: CircularProgressIndicator(
                                    strokeWidth: 2,
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                      Colors.white,
                                    ),
                                  ),
                                )
                                : const Text(
                                  'Send OTP',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                      ),
                    ),
                  ] else ...[
                    OTPInputField(
                      controller: _otpController,
                      errorText: _otpError,
                    ),
                    const SizedBox(height: 16),
                    if (!_canResendOTP) ...[
                      Center(
                        child: Countdown(
                          seconds: 30,
                          build:
                              (_, double time) => Text(
                                'Resend OTP in ${time.toInt()}s',
                                style: Theme.of(context).textTheme.bodySmall,
                              ),
                          onFinished: () {
                            setState(() => _canResendOTP = true);
                          },
                        ),
                      ),
                    ] else
                      TextButton(
                        onPressed:
                            state is AuthLoading
                                ? null
                                : () => _handleSendOTP(),
                        child: const Text('Resend OTP'),
                      ),
                    const SizedBox(height: 24),
                    ElevatedButton(
                      onPressed:
                          state is AuthLoading
                              ? null
                              : () => _handleVerifyOTP(),
                      child:
                          state is AuthLoading
                              ? const SizedBox(
                                height: 20,
                                width: 20,
                                child: CircularProgressIndicator(
                                  strokeWidth: 2,
                                ),
                              )
                              : const Text('Verify & Continue'),
                    ),
                  ],
                  const SizedBox(height: 24),
                  TextButton(
                    onPressed:
                        state is AuthLoading
                            ? null
                            : () {
                              context.read<AuthBloc>().add(AuthSkipRequested());
                              Navigator.pushReplacementNamed(
                                context,
                                AppRoutes.home,
                              );
                            },
                    child: Text(
                      'Skip for now',
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  void _handleSendOTP() {
    print("hello");
    final name = _nameController.text.trim();
    final phone = _phoneController.text.replaceAll(' ', '');

    bool hasError = false;

    if (name.isEmpty) {
      setState(() => _nameError = 'Please enter your name');
      hasError = true;
    }

    if (phone.isEmpty) {
      setState(() => _phoneError = 'Please enter your phone number');
      hasError = true;
    } else if (phone.length != 10) {
      setState(() => _phoneError = 'Please enter a valid phone number');
      hasError = true;
    }

    if (hasError) return;

    setState(() {
      _phoneError = null;
      _nameError = null;
    });

    context.read<AuthBloc>().add(AuthSendOTPRequested(phone));
  }

  void _handleVerifyOTP() {
    final phone = _phoneController.text.trim();
    final otp = _otpController.text.trim();
    final name = _nameController.text.trim();

    bool hasError = false;

    if (name.isEmpty) {
      setState(() => _nameError = 'Please enter your name');
      hasError = true;
    } else {
      setState(() => _nameError = null);
    }

    if (otp.isEmpty || otp.length != 6) {
      setState(() => _otpError = 'Please enter a valid OTP');
      hasError = true;
    } else {
      setState(() => _otpError = null);
    }

    if (hasError) return;

    context.read<AuthBloc>().add(
      AuthVerifyOTPRequested(phoneNumber: phone, otp: otp, name: name),
    );
  }

  @override
  void dispose() {
    _phoneController.removeListener(_validatePhone);
    _nameController.removeListener(_validateName);
    _phoneController.dispose();
    _otpController.dispose();
    _nameController.dispose();
    super.dispose();
  }
}
