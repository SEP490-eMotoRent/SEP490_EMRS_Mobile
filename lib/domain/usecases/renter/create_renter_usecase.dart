import '../../entities/renter.dart';
import '../../repositories/renter_repository.dart';

class CreateRenterUseCase {
  final RenterRepository repository;

  CreateRenterUseCase(this.repository);

  Future<void> call(Renter renter) {
    return repository.createRenter(renter);
  }
}
