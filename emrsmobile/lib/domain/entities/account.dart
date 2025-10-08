import 'package:equatable/equatable.dart';

enum UserRole { customer, staff, manager, admin, technician }

class Account extends Equatable {
  final String id;
  final String username;
  final String passwordHash;
  final UserRole role;
  final String fullName;
  final bool isActive;
  final DateTime createdAt;
  final DateTime? lastLogin;

  const Account({
    required this.id,
    required this.username,
    required this.passwordHash,
    required this.role,
    required this.fullName,
    required this.isActive,
    required this.createdAt,
    this.lastLogin,
  });

  @override
  List<Object?> get props => [
    id,
    username,
    role,
    fullName,
    isActive,
    createdAt,
    lastLogin,
  ];
}
