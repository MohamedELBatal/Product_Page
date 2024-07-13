import 'package:dartz/dartz.dart';
import 'package:task_page/core/errors/failuers.dart';
import 'package:task_page/home/data/models/ProductsModel.dart';


abstract class HomeRepo {

  Future<Either<Failures, ProductsModel>> getProducts();

}
