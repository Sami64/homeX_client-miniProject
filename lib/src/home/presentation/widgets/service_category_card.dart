import 'package:flutter/material.dart';

class ServiceCategoryCard extends StatelessWidget {
  const ServiceCategoryCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).pushNamed('/services'),
      child: Card(
        child: Container(
            width: MediaQuery.of(context).size.width * 0.3,
            height: MediaQuery.of(context).size.height * 0.2,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(child: Icon(Icons.clean_hands)),
                Expanded(child: Text('Plumbing'))
              ],
            )),
      ),
    );
  }
}
