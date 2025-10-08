import '../../domain/entities/renter.dart';
import '../../domain/repositories/renter_repository.dart';
import '../datasources/local/renter_local_datasource.dart';
import '../datasources/remote/renter_remote_datasource.dart';
import '../models/renter_model.dart';

class RenterRepositoryImpl implements RenterRepository {
  final RenterRemoteDataSource remote;
  final RenterLocalDataSource local;

  RenterRepositoryImpl({
    required this.remote,
    required this.local,
  });

  @override
  Future<Renter?> getRenter(String id) async {
    final cached = await local.getCachedRenter(id);
    if (cached != null) return cached.toEntity();

    final remoteModel = await remote.getRenter(id);
    if (remoteModel != null) {
      await local.cacheRenter(remoteModel);
      return remoteModel.toEntity();
    }
    return null;
  }

  @override
  Future<void> createRenter(Renter renter) async {
    final model = RenterModel.fromEntity(renter);
    await remote.createRenter(model);
    await local.cacheRenter(model);
  }

  @override
  Future<void> updateRenter(Renter renter) async {
    final model = RenterModel.fromEntity(renter);
    await remote.updateRenter(model);
    await local.cacheRenter(model);
  }
}
