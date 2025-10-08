import '../../entities/account.dart';
import '../../repositories/account_repository.dart';

class UpdateAccountUseCase {
  final AccountRepository repository;

  UpdateAccountUseCase(this.repository);

  Future<void> call(Account account) {
    return repository.updateAccount(account);
  }
}
