import 'package:flutter_bloc/flutter_bloc.dart';

class SliderCubit extends Cubit<int> {
  SliderCubit() : super(1);

  void forward() {
    if (state > 1)
      emit(state - 1);
    else
      emit(4);
  }

  void backward() {
    if (state < 4)
      emit(state + 1);
    else
      emit(1);
  }
}
