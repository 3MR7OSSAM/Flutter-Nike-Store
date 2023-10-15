import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:page_route_animator/page_route_animator.dart';
import '../../../Models/CartModel.dart';
import '../../../cubit/CartCubit/AddToCartCubit/Add_to_cart_cubit.dart';
import '../../../methods/btm_alert.dart';
import '../../CartView/CartView.dart';
import '../widgets/CustomContainer.dart';
import '../widgets/PriceWidget.dart';
import '../widgets/SelectableContainer.dart';
import '../widgets/ShoesImage.dart';
import 'ScrollNavigator.dart';

class ProductViewWidget extends StatefulWidget {
  ProductViewWidget({Key? key, required this.id}) : super(key: key);
  final String id;
  int? selectedSize;
  Color selectedColor =Colors.transparent;

  @override
  State<ProductViewWidget> createState() => _ProductViewWidgetState();
}

class _ProductViewWidgetState extends State<ProductViewWidget> {
  int _sizeselectedSize = -1;
  int _colorselectedSize = -1;

  void _handleSizeSelection(int index) {
    setState(() {
      _sizeselectedSize = index;
    });
  }
  @override
  void initState() {
    // Check if selectedSize is null, if so, set it to -1 as the default value
    widget.selectedSize ??= -1;

    // Check if selectedColor is null, if so, set it to Colors.transparent as the default value
    widget.selectedColor ??= Colors.transparent;

    super.initState();
  }

  void _handleColorSelection(int index) {
    setState(() {
      _colorselectedSize = index;
    });
  }

  Widget buildSizeSelectableContainer(int index, String size,Function onSelect) {
    return SelectableContainer(
      isSelected: _sizeselectedSize == index,
      onSelected: (isSelected) {
        if (isSelected) {
          onSelect();
          _handleSizeSelection(index);
        } else {
          _handleSizeSelection(-1);
        }
      },
      child: Text(
        size,
        style: const TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 13,
        ),
      ),
    );
  }

  Widget buildColorSelectableContainer(int index, Color color, Function onSelect) {
    return SelectableContainer(
      width: 40,
      isSelected: _colorselectedSize == index,
      onSelected: (isSelected) {
        if (isSelected) {
            onSelect();
          _handleColorSelection(index);
        } else {
          _handleColorSelection(-1);
        }
      },
      child: Container(
        width: 14,
        height: 14,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(4),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final currentProduct = BlocProvider.of<CartCubit>(context).findByID(widget.id);
    return Column(

      children: [
        Stack(
        children: [
          Align(
            alignment: Alignment.center,
            child: ShoesImage(Image:currentProduct.image,),
          ),
          Padding(
            padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.13),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    const Text(
                      'Size',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    buildSizeSelectableContainer(0, '42',(){
                      widget.selectedSize =42;
                    }),
                    buildSizeSelectableContainer(1, '43',(){
                      widget.selectedSize = 43;
                    }),
                    buildSizeSelectableContainer(2, '44',(){
                      widget.selectedSize = 44;
                    }),
                    buildSizeSelectableContainer(3, '45',(){
                      widget.selectedSize = 45;
                    }),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * .009),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(bottom: 40),
                          child: CustomContainer(
                            isDarkBorder: true,
                            icon: Icons.bookmark_border,
                          ),
                        ),
                        const Text(
                          'Color',
                          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                        ),
                        buildColorSelectableContainer(0, Colors.red,(){
                          widget.selectedColor = Colors.red;
                        }),
                        buildColorSelectableContainer(1, Colors.blueAccent,(){
                          widget.selectedColor =Colors.blueAccent;
                        }),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          PriceWidget(price: currentProduct.price),

        ],
      ),
        FittedBox(
          fit: BoxFit.contain,
          child: Center(
            child: Stack(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.52,
                  height: MediaQuery.of(context).size.height * 0.22,
                  child: const Image(
                    image: AssetImage('assets/NikeBox.png'),
                  ),
                ),
                Padding(
                  padding:  EdgeInsets.only(left:  MediaQuery.of(context).size.height * 0.04,),
                  child: Column(
                    children: [
                      const Text(
                        'Swipe down to add',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SwipeDownButton( onDrugDown: (){
                        if (widget.selectedSize != null &&   widget.selectedColor != Colors.transparent) {
                          BlocProvider.of<CartCubit>(context).addProduct(cartModel(
                              name: currentProduct.name,
                              image: currentProduct.image,
                              price: currentProduct.price,
                              id: currentProduct.id,
                              color: widget.selectedColor,
                              quantity:1,
                              size: widget.selectedSize.toString(),
                          ));
                          Navigator.push(
                            context,
                            PageRouteAnimator(
                              child: const CartView(),
                              routeAnimation: RouteAnimation.fade,
                              settings: const RouteSettings(arguments: 'I am going'),
                              curve: Curves.slowMiddle,
                              duration: const Duration(milliseconds: 300),
                              reverseDuration: const Duration(milliseconds: 100),
                            ),
                          );
                        }else{
                          showBtmAlert(context,'Please select size & color');
                        }
                  },),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],

    );
  }
}
