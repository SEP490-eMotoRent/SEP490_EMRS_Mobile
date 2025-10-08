import 'package:equatable/equatable.dart';

class Renter extends Equatable {
  final String id;
  final String email;
  final String phone;
  final String address;
  final DateTime dateOfBirth;
  final String? avatarUrl;

  const Renter({
    required this.id,
    required this.email,
    required this.phone,
    required this.address,
    required this.dateOfBirth,
    this.avatarUrl,
  });

  @override
  List<Object?> get props => [
    id,
    email,
    phone,
    address,
    dateOfBirth,
    avatarUrl,
  ];
}
