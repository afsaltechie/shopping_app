import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';


class PaymentTypeCubit extends Cubit<String> {
  PaymentTypeCubit() : super("Select payment method");

  void changePaymethod(String value){
    final newState = value;
    emit(newState);


  }


}
