import '../../models/renter_model.dart';

abstract class RenterLocalDataSource {
  Future<void> cacheRenter(RenterModel renter);
  Future<RenterModel?> getCachedRenter(String id);
  Future<void> clearCache(String id);
}

class RenterLocalDataSourceImpl implements RenterLocalDataSource {
  final Map<String, RenterModel> _cache = {};

  @override
  Future<void> cacheRenter(RenterModel renter) async {
    _cache[renter.id] = renter;
  }

  @override
  Future<RenterModel?> getCachedRenter(String id) async {
    return _cache[id];
  }

  @override
  Future<void> clearCache(String id) async {
    _cache.remove(id);
  }
}
