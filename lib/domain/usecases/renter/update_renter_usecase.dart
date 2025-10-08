import '../../entities/renter.dart';
import '../../repositories/renter_repository.dart';

class UpdateRenterUseCase {
  final RenterRepository repository;

  UpdateRenterUseCase(this.repository);

  Future<void> call(Renter renter) {
    return repository.updateRenter(renter);
  }
}
