import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nikestore/Models/ShoseModel.dart';

class ProductViewCubit extends Cubit<Shoes> {

  ProductViewCubit() : super(Shoes(
  name: '',
  price: 0,
  image: '',
  ));

  void setShoes(Shoes shoes) {
    emit(shoes);
  }

}
