import '../../entities/renter.dart';
import '../../repositories/renter_repository.dart';

class GetRenterUseCase {
  final RenterRepository repository;

  GetRenterUseCase(this.repository);

  Future<Renter?> call(String id) {
    return repository.getRenter(id);
  }
}
