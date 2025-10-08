import '../entities/renter.dart';

abstract class RenterRepository {
  Future<Renter?> getRenter(String id);
  Future<void> createRenter(Renter renter);
  Future<void> updateRenter(Renter renter);
}
