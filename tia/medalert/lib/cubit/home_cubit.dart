import 'package:bloc/bloc.dart';
import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  void toggleMedicationAlarm(int index) {
    final alarms = state.medicationAlarms;
    alarms[index]['isActive'] = !alarms[index]['isActive'];
    emit(HomeLoaded(List.from(alarms)));
  }
}
