
import 'package:injectable/injectable.dart';
import 'package:task_page/core/api/api_manager.dart';
import 'package:task_page/core/api/end_points.dart';
import 'package:task_page/home/data/data_sources/home_ds.dart';
import 'package:task_page/home/data/models/ProductsModel.dart';

@Injectable(as: HomeDs)
class HomeDSImpl implements HomeDs {
  ApiManager apiManager;

  HomeDSImpl(this.apiManager);


  @override
  Future<ProductsModel> getProducts() async {
    var response = await apiManager.getData(EndPoint.products);

    ProductsModel productsModel = ProductsModel.fromJson(response.data);
    return productsModel;
  }
}
