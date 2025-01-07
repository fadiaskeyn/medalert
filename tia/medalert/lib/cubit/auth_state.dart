// lib/cubit/auth_state.dart
import 'package:equatable/equatable.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object?> get props => [];
}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthSuccess extends AuthState {
  final String userId;
  final String? email;
  final String? displayName;

  const AuthSuccess({
    required this.userId,
    this.email,
    this.displayName,
  });

  @override
  List<Object?> get props => [userId, email, displayName];
}

class AuthError extends AuthState {
  final String message;

  const AuthError(this.message);

  @override
  List<Object?> get props => [message];
}
