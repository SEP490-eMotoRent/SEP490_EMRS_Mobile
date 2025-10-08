import 'package:equatable/equatable.dart';
import '../../domain/entities/account.dart';

class AccountModel extends Equatable {
  final String id;
  final String username;
  final String passwordHash;
  final UserRole role;
  final String fullName;
  final bool isActive;
  final DateTime createdAt;
  final DateTime? lastLogin;

  const AccountModel({
    required this.id,
    required this.username,
    required this.passwordHash,
    required this.role,
    required this.fullName,
    required this.isActive,
    required this.createdAt,
    this.lastLogin,
  });

  factory AccountModel.fromJson(Map<String, dynamic> json) {
    return AccountModel(
      id: json['account_id'] as String? ?? '',
      username: json['username'] as String? ?? '',
      passwordHash: json['password_hash'] as String? ?? '',
      role: _roleFromString(json['role'] as String?),
      fullName: json['full_name'] as String? ?? '',
      isActive: json['is_active'] as bool? ?? false,
      createdAt: DateTime.tryParse(json['created_at'] as String? ?? '') ?? DateTime.now(),
      lastLogin: json['last_login'] != null
          ? DateTime.tryParse(json['last_login'] as String)
          : null,
    );
  }

  Map<String, dynamic> toJson() => {
    'account_id': id,
    'username': username,
    'password_hash': passwordHash,
    'role': role.name,
    'full_name': fullName,
    'is_active': isActive,
    'created_at': createdAt.toIso8601String(),
    'last_login': lastLogin?.toIso8601String(),
  };

  Account toEntity() => Account(
    id: id,
    username: username,
    passwordHash: passwordHash,
    role: role,
    fullName: fullName,
    isActive: isActive,
    createdAt: createdAt,
    lastLogin: lastLogin,
  );

  factory AccountModel.fromEntity(Account e) => AccountModel(
    id: e.id,
    username: e.username,
    passwordHash: e.passwordHash,
    role: e.role,
    fullName: e.fullName,
    isActive: e.isActive,
    createdAt: e.createdAt,
    lastLogin: e.lastLogin,
  );

  static UserRole _roleFromString(String? s) {
    if (s == null) return UserRole.customer;
    return UserRole.values.firstWhere(
          (r) => r.name == s || r.toString().split('.').last == s,
      orElse: () => UserRole.customer,
    );
  }

  @override
  List<Object?> get props => [id, username, role, fullName, isActive];
}
