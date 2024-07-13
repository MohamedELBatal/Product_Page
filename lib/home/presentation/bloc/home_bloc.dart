import 'package:bloc/bloc.dart';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:task_page/core/enums/enums.dart';
import 'package:task_page/core/errors/failuers.dart';
import 'package:task_page/home/domain/use_cases/get_products_use_case.dart';

import '../../data/models/ProductsModel.dart';


part 'home_event.dart';

part 'home_state.dart';

part 'home_bloc.freezed.dart';

@injectable
class HomeBloc extends Bloc<HomeEvent, HomeState> {

  GetProductsUseCase getProductsUseCase;


  HomeBloc(
      {required this.getProductsUseCase,})
      : super(const HomeState()) {
    on<GetProductsEvent>((event, emit) async {
      emit(state.copyWith(getProductsStatus: RequestStatus.loading));
      var result = await getProductsUseCase();

      result.fold((l) {
        emit(state.copyWith(
            getProductsStatus: RequestStatus.failure, productsFailure: l));
      }, (r) {
        emit(state.copyWith(
            getProductsStatus: RequestStatus.success, productsModel: r));
      });
    });
    on<ChangeNavBar>((event, emit) {
      emit(state.copyWith(currentIndex: event.index));
    });
  }
}
