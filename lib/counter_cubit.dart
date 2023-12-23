import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> {


  //Intial State
  CounterCubit() : super(CounterState(count: 0));


  void  increment(){

    //emit state ko fekega te builder onu caych kruga te build kruga
    //cubit multimul states ko flow karwata hh
    //bloc me multimle requests krr sakte hh
    emit(CounterState(count: state.count+1));
  }

  void decrement(){
    if(state.count>0){
      emit(CounterState(count: state.count-1));
    }else{
      emit(CounterState(count: state.count));
    }


  }
}
