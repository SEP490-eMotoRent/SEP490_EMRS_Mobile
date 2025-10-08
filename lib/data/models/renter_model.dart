import 'package:equatable/equatable.dart';
import '../../domain/entities/renter.dart';

class RenterModel extends Equatable {
  final String id;
  final String email;
  final String phone;
  final String address;
  final DateTime dateOfBirth;
  final String? avatarUrl;

  const RenterModel({
    required this.id,
    required this.email,
    required this.phone,
    required this.address,
    required this.dateOfBirth,
    this.avatarUrl,
  });

  factory RenterModel.fromJson(Map<String, dynamic> json) {
    return RenterModel(
      id: json['renter_id'] as String? ?? '',
      email: json['email'] as String? ?? '',
      phone: json['phone'] as String? ?? '',
      address: json['address'] as String? ?? '',
      dateOfBirth: DateTime.tryParse(json['date_of_birth'] as String? ?? '') ?? DateTime.now(),
      avatarUrl: json['avatar_url'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
    'renter_id': id,
    'email': email,
    'phone': phone,
    'address': address,
    'date_of_birth': dateOfBirth.toIso8601String(),
    'avatar_url': avatarUrl,
  };

  Renter toEntity() => Renter(
    id: id,
    email: email,
    phone: phone,
    address: address,
    dateOfBirth: dateOfBirth,
    avatarUrl: avatarUrl,
  );

  factory RenterModel.fromEntity(Renter e) => RenterModel(
    id: e.id,
    email: e.email,
    phone: e.phone,
    address: e.address,
    dateOfBirth: e.dateOfBirth,
    avatarUrl: e.avatarUrl,
  );

  @override
  List<Object?> get props => [id, email, phone];
}
