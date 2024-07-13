part of 'home_bloc.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState({
 @Default(RequestStatus.init)RequestStatus getProductsStatus,
   @Default(0) int currentIndex,
   @Default(0) int cartItems,
    ProductsModel? productsModel,
    Failures? productsFailure,
}) = _HomeState;
}
