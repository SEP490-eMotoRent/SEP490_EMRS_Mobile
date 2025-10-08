import '../../models/account_model.dart';

abstract class AccountLocalDataSource {
  Future<void> cacheAccount(AccountModel account);
  Future<AccountModel?> getCachedAccount(String id);
  Future<void> clearCache(String id);
}

/// Simple in-memory cache for now. Replace with SharedPreferences/Hive later.
class AccountLocalDataSourceImpl implements AccountLocalDataSource {
  final Map<String, AccountModel> _cache = {};

  @override
  Future<void> cacheAccount(AccountModel account) async {
    _cache[account.id] = account;
  }

  @override
  Future<AccountModel?> getCachedAccount(String id) async {
    return _cache[id];
  }

  @override
  Future<void> clearCache(String id) async {
    _cache.remove(id);
  }
}
