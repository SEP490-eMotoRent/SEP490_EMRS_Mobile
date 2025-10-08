import '../../entities/account.dart';
import '../../repositories/account_repository.dart';

class CreateAccountUseCase {
  final AccountRepository repository;

  CreateAccountUseCase(this.repository);

  Future<void> call(Account account) {
    return repository.createAccount(account);
  }
}
