import 'package:flutter/material.dart';
class CustomContainer extends StatelessWidget {
  const CustomContainer({Key? key,  this.color, this.icon, required this.isDarkBorder}) : super(key: key);
  final Color? color;
  final IconData? icon;
  final bool isDarkBorder ;
  @override

  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: isDarkBorder ? Colors.black54:Colors.black12)),
          width: 40,
          height: 36,
          child: Center(
            child: Stack(
              children: [
                Center(
                  child: Container(

                    width: 14,
                    height: 14,
                    decoration: BoxDecoration(
                        color: color,
                        borderRadius: BorderRadius.circular(4)
                    ),

                  ),
                ),
                Center(child: Icon(icon))
              ],
            )
          )
      ),
    );
  }
}
