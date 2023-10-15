import 'package:flutter/material.dart';
class HomeBanner extends StatelessWidget {
  const HomeBanner({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(top: MediaQuery.of(context).size.height*0.02),
      child: Container(

        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height*0.2,
        decoration: BoxDecoration(
          border: Border.all(
            width: 0.5,
            color: Colors.black.withOpacity(0.2)
          ),
          borderRadius: BorderRadius.circular(24),
          color: Colors.white,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('20% Discount', style: TextStyle(
                      color: Colors.black,
                      fontSize: 25,
                    fontWeight: FontWeight.w500,
                      )),
                  const Text('on your first purchase',style: TextStyle(fontSize: 12),),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Container(
                      width: 96,
                      height: 26,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.black,
                      ),
                      child: const Center(
                        child: Text(
                          'Shope Now',style: TextStyle(color: Colors.white,fontSize: 10,fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                    image: DecorationImage(image: AssetImage('assets/Shose2.png'))
                ),
              ),
            )

          ],
        ),
      ),
    );
  }
}
