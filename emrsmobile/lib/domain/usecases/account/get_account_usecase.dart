import '../../entities/account.dart';
import '../../repositories/account_repository.dart';

class GetAccountUseCase {
  final AccountRepository repository;

  GetAccountUseCase(this.repository);

  Future<Account?> call(String id) {
    return repository.getAccount(id);
  }
}
