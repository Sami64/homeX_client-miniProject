import 'package:flutter/material.dart';
import 'package:home_x_client/src/home/presentation/widgets/service_category_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: Text(
          'HomeX',
          style: TextStyle(fontWeight: FontWeight.w900),
        ),
      ),
      body: SafeArea(
        child: Container(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(
                child: Text(
              'Find A Service',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25.0),
            )),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ServiceCategoryCard(),
                  ServiceCategoryCard(),
                  ServiceCategoryCard()
                ],
              ),
            ),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ServiceCategoryCard(),
                  ServiceCategoryCard(),
                  ServiceCategoryCard()
                ],
              ),
            )
          ],
        )),
      ),
    );
  }
}
