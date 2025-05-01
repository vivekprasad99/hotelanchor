import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import '../../domain/repositories/auth_repository.dart';
import '../../domain/models/user_model.dart';

// Events
abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object?> get props => [];
}

class AuthCheckRequested extends AuthEvent {}

class AuthSendOTPRequested extends AuthEvent {
  final String phoneNumber;
  const AuthSendOTPRequested(this.phoneNumber);

  @override
  List<Object?> get props => [phoneNumber];
}

class AuthVerifyOTPRequested extends AuthEvent {
  final String phoneNumber;
  final String otp;
  final String name;
  const AuthVerifyOTPRequested({
    required this.phoneNumber,
    required this.otp,
    required this.name,
  });

  @override
  List<Object?> get props => [phoneNumber, otp, name];
}

class AuthSkipRequested extends AuthEvent {}

class AuthSignOutRequested extends AuthEvent {}

// States
abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object?> get props => [];
}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthOTPSent extends AuthState {}

class AuthAuthenticated extends AuthState {
  final UserModel user;
  const AuthAuthenticated(this.user);

  @override
  List<Object?> get props => [user];
}

class AuthUnauthenticated extends AuthState {}

class AuthSkipped extends AuthState {}

class AuthFailure extends AuthState {
  final String message;
  const AuthFailure(this.message);

  @override
  List<Object?> get props => [message];
}

// Bloc
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository _authRepository;

  AuthBloc({required AuthRepository authRepository})
    : _authRepository = authRepository,
      super(AuthInitial()) {
    on<AuthCheckRequested>(_onAuthCheckRequested);
    on<AuthSignOutRequested>(_onAuthSignOutRequested);
    on<AuthSkipRequested>(_onAuthSkipRequested);
    on<AuthSendOTPRequested>(_onAuthSendOTPRequested);
    on<AuthVerifyOTPRequested>(_onAuthVerifyOTPRequested);
  }

  Future<void> _onAuthCheckRequested(
    AuthCheckRequested event,
    Emitter<AuthState> emit,
  ) async {
    try {
      final user = await _authRepository.getCurrentUser();
      if (user != null) {
        emit(AuthAuthenticated(user));
      } else {
        emit(AuthUnauthenticated());
      }
    } catch (e) {
      emit(AuthFailure(e.toString()));
    }
  }

  Future<void> _onAuthSignOutRequested(
    AuthSignOutRequested event,
    Emitter<AuthState> emit,
  ) async {
    try {
      await _authRepository.signOut();
      emit(AuthUnauthenticated());
    } catch (e) {
      emit(AuthFailure(e.toString()));
    }
  }

  void _onAuthSkipRequested(AuthSkipRequested event, Emitter<AuthState> emit) {
    emit(AuthSkipped());
  }

  Future<void> _onAuthSendOTPRequested(
    AuthSendOTPRequested event,
    Emitter<AuthState> emit,
  ) async {
    try {
      emit(AuthLoading());
      await _authRepository.sendOTP(event.phoneNumber);
      emit(AuthOTPSent());
    } catch (e) {
      emit(AuthFailure(e.toString()));
    }
  }

  Future<void> _onAuthVerifyOTPRequested(
    AuthVerifyOTPRequested event,
    Emitter<AuthState> emit,
  ) async {
    try {
      emit(AuthLoading());
      final user = await _authRepository.verifyOTP(
        phoneNumber: event.phoneNumber,
        otp: event.otp,
        name: event.name,
      );
      emit(AuthAuthenticated(user));
    } catch (e) {
      emit(AuthFailure(e.toString()));
    }
  }
}
