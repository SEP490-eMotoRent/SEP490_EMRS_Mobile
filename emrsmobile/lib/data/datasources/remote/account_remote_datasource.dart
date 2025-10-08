import '../../models/account_model.dart';

abstract class AccountRemoteDataSource {
  /// Return account model or null if not found
  Future<AccountModel?> getAccount(String id);

  Future<void> createAccount(AccountModel account);

  Future<void> updateAccount(AccountModel account);
}

/// Simple in-memory mock implementation (replace with API calls later)
class AccountRemoteDataSourceImpl implements AccountRemoteDataSource {
  final List<AccountModel> _store;

  AccountRemoteDataSourceImpl([List<AccountModel>? initial]) : _store = initial ?? [];

  @override
  Future<AccountModel?> getAccount(String id) async {
    // simulate latency
    await Future.delayed(const Duration(milliseconds: 150));
    final found = _store.where((a) => a.id == id).toList();
    if (found.isEmpty) return null;
    return found.first;
  }

  @override
  Future<void> createAccount(AccountModel account) async {
    // simulate latency
    await Future.delayed(const Duration(milliseconds: 150));
    // if id exists, replace
    final idx = _store.indexWhere((a) => a.id == account.id);
    if (idx == -1) {
      _store.add(account);
    } else {
      _store[idx] = account;
    }
  }

  @override
  Future<void> updateAccount(AccountModel account) async {
    await Future.delayed(const Duration(milliseconds: 150));
    final idx = _store.indexWhere((a) => a.id == account.id);
    if (idx != -1) {
      _store[idx] = account;
    } else {
      // not found — treat as create
      _store.add(account);
    }
  }
}
