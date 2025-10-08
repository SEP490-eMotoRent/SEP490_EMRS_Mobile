import '../entities/account.dart';

abstract class AccountRepository {
  Future<Account?> getAccount(String id);
  Future<void> createAccount(Account account);
  Future<void> updateAccount(Account account);
}
