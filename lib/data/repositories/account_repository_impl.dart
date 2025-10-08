import '../../domain/entities/account.dart';
import '../../domain/repositories/account_repository.dart';
import '../datasources/local/account_local_datasource.dart';
import '../datasources/remote/account_remote_datasource.dart';
import '../models/account_model.dart';

class AccountRepositoryImpl implements AccountRepository {
  final AccountRemoteDataSource remote;
  final AccountLocalDataSource local;

  AccountRepositoryImpl({
    required this.remote,
    required this.local,
  });

  @override
  Future<Account?> getAccount(String id) async {
    // Try local first
    final cached = await local.getCachedAccount(id);
    if (cached != null) return cached.toEntity();

    // Fall back to remote
    final remoteModel = await remote.getAccount(id);
    if (remoteModel != null) {
      await local.cacheAccount(remoteModel);
      return remoteModel.toEntity();
    }

    return null;
  }

  @override
  Future<void> createAccount(Account account) async {
    final model = AccountModel.fromEntity(account);
    await remote.createAccount(model);
    await local.cacheAccount(model);
  }

  @override
  Future<void> updateAccount(Account account) async {
    final model = AccountModel.fromEntity(account);
    await remote.updateAccount(model);
    await local.cacheAccount(model);
  }
}
