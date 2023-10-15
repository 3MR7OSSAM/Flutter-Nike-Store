import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nikestore/cubit/CartCubit/AddToCartCubit/Add_to_cart_state.dart';

import '../../../Models/CartModel.dart';
import '../../../Models/ShoseModel.dart';

final Map<String, cartModel> _cartItems = {};

class CartCubit extends Cubit<CartState> {

  CartCubit() : super(AddProductInitial());

  addProduct(cartModel cartItem) async {
    emit(AddProductLoading());
    try {
      // Check if the cart item already exists
      if (_cartItems.containsKey(cartItem.name)) {
        // Check if the cart item has a different color or size
        if (_cartItems[cartItem.name]!.color != cartItem.color || _cartItems[cartItem.name]!.size != cartItem.size) {
          // Add the new cart item as a new entry with a unique ID
          _cartItems['0000'] = cartModel(
            name: cartItem.name,
            image: cartItem.image,
            price: cartItem.price,
            id: '0000', // Use a new unique ID for the new cart item
            color: cartItem.color,
            quantity: cartItem.quantity,
            size: cartItem.size,
          );
        }
      } else {
        // Add the new cart item with the provided ID
        _cartItems[cartItem.name] = cartModel(
          name: cartItem.name,
          image: cartItem.image,
          price: cartItem.price,
          id: cartItem.id,
          color: cartItem.color,
          quantity: cartItem.quantity,
          size: cartItem.size,
        );
      }
      emit(AddProductSuccess());
    } catch (e) {
      emit(AddProductFailed());
    }
  }
  void deleteItem(String id) {
    if (_cartItems.containsKey(id)) {
      _cartItems.remove(id);
      emit(ItemDeletedSuccess());

      // Add this line to emit a state change after deleting the item
      emit(CartUpdatedSuccess());
    } else {
      emit(ItemDeleteFailed()); // Emit an error state if the item is not found
    }
  }



  Map<String, cartModel> get getCartItems {
    return _cartItems;
  }

  Shoes findByID(String id) {
    return Shoeses.firstWhere((element) => element.id == id);
  }
  void increaseCartItems(String id) {
    _cartItems.values.toList().firstWhere((element) => element.id == id).quantity+=1;
    getTotalPrice();

    emit(CartUpdatedSuccess());
  }
  void decreaseCartItems(String id) {
    if (_cartItems.containsKey(id)) {
      if (_cartItems[id]!.quantity > 1) {
        _cartItems[id]!.quantity -= 1;
        emit(CartUpdatedSuccess());
      } else {
        // If the quantity becomes zero or negative, delete the item
        getTotalPrice();
        deleteItem(id);
     emit(ItemDeletedSuccess());
      }
    } else {
      emit(ItemDeleteFailed()); // Emit an error state if the item is not found
    }
  }
  double getTotalPrice() {
    double totalPrice = 0.0;
    _cartItems.forEach((key, value) {
      totalPrice += (value.price) * (value.quantity);
    });
    return totalPrice;
  }


}
