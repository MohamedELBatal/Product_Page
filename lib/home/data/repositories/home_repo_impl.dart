import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:task_page/core/errors/failuers.dart';
import 'package:task_page/home/data/data_sources/home_ds.dart';
import 'package:task_page/home/data/models/ProductsModel.dart';
import 'package:task_page/home/domain/repositories/home_repo.dart';

@Injectable(as: HomeRepo)
class HomeRepoImpl implements HomeRepo {
  HomeDs homeDs;

  HomeRepoImpl(this.homeDs);

  @override
  Future<Either<Failures, ProductsModel>> getProducts() async {
    try {
      var result = await homeDs.getProducts();
      return Right(result);
    } catch (e) {
      return Left(RemoteFailures(e.toString()));
    }
  }
}