import 'package:flutter/material.dart';
import 'package:nikestore/Models/ShoseModel.dart';
import 'package:nikestore/views/HomeView/widgets/CustomCard.dart';
import 'package:nikestore/views/HomeView/widgets/HomeBanner.dart';
import 'package:nikestore/views/ProductView/widgets/CustomAppbar.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              pinned: true,
              expandedHeight: 250,
              flexibleSpace: FlexibleSpaceBar(
                background:Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 8),
                  child: Column(
                    children:  [
                      CustomAppbar(
                        icon: const Icon(
                          Icons.menu,
                          size: 24,
                        ),
                        IsCenter: false,
                        showIcon: true,
                        child: const Padding(
                          padding: EdgeInsets.only(left: 9),
                          child: Image(
                            image: AssetImage('assets/Logo.png'),
                            width: 50,
                            height: 50,
                          ),
                        ),
                      ),
                      const HomeBanner(),
                    ],
                  ),
                ),
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.all(10),
              sliver: SliverGrid(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: .75,
                ),
                delegate: SliverChildBuilderDelegate(
                      (BuildContext context, int index) {
                    return CustomCard( index: index,);
                  },
                  childCount: Shoeses.length,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
