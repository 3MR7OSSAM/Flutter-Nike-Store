abstract class CartState{}

class AddProductInitial extends CartState{}
class AddProductLoading extends CartState{}
class ItemDeletedSuccess extends CartState{}
class CartUpdatedSuccess extends CartState{}
class AddProductSuccess extends CartState{}
class ItemDeleteFailed extends CartState{}
class AddProductFailed extends CartState{}
class TotalPriceUpdated extends CartState{}