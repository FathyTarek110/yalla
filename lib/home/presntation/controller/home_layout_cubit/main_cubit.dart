import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_swiper_view/flutter_swiper_view.dart';
import 'package:meta/meta.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'main_state.dart';

class MainCubit extends Cubit<MainState> {
  MainCubit() : super(MainInitial());
  final flightsSwiperController  = SwiperController();
  final flightsMultipleSwiperController  = SwiperController();

  late ScrollController scrollController;

  static MainCubit get(context)=> BlocProvider.of(context);

  scrollControllerInit(){
    scrollController = ScrollController();
    emit(UserScrollControllerInit());
    print(state);

  }
}
