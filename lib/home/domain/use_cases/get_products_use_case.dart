import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:task_page/core/errors/failuers.dart';
import 'package:task_page/home/data/models/ProductsModel.dart';
import 'package:task_page/home/domain/repositories/home_repo.dart';


@injectable
class GetProductsUseCase {
  HomeRepo repo;

  GetProductsUseCase(this.repo);

  Future<Either<Failures, ProductsModel>> call() => repo.getProducts();
}
