import '../../models/renter_model.dart';

abstract class RenterRemoteDataSource {
  Future<RenterModel?> getRenter(String id);
  Future<void> createRenter(RenterModel renter);
  Future<void> updateRenter(RenterModel renter);
}

class RenterRemoteDataSourceImpl implements RenterRemoteDataSource {
  final List<RenterModel> _store;

  RenterRemoteDataSourceImpl([List<RenterModel>? initial]) : _store = initial ?? [];

  @override
  Future<RenterModel?> getRenter(String id) async {
    await Future.delayed(const Duration(milliseconds: 150));
    final found = _store.where((r) => r.id == id).toList();
    if (found.isEmpty) return null;
    return found.first;
  }

  @override
  Future<void> createRenter(RenterModel renter) async {
    await Future.delayed(const Duration(milliseconds: 150));
    final idx = _store.indexWhere((r) => r.id == renter.id);
    if (idx == -1) _store.add(renter); else _store[idx] = renter;
  }

  @override
  Future<void> updateRenter(RenterModel renter) async {
    await Future.delayed(const Duration(milliseconds: 150));
    final idx = _store.indexWhere((r) => r.id == renter.id);
    if (idx != -1) {
      _store[idx] = renter;
    } else {
      _store.add(renter);
    }
  }
}
