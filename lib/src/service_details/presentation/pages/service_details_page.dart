import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:home_x_client/core/data/images_data.dart';
import 'package:home_x_client/src/service_details/presentation/widgets/custom_app_bar.dart';

class ServiceDetailsPage extends StatelessWidget {
  const ServiceDetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final scaffoldKey = GlobalKey<ScaffoldState>();
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Color(0xFFF5F6F9),
      appBar: CustomAppBar(
        rating: 5.0,
      ),
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Expanded(
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.4,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover, image: AssetImage(Images.ps4))),
              ),
            ),
            Expanded(
              child: Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.symmetric(horizontal: 1.0, vertical: 1.0),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(55),
                        topRight: Radius.circular(55))),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.all(
                            MediaQuery.of(context).size.width * 0.04),
                        child: Text(
                          'Title',
                          maxLines: 1,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize:
                                  MediaQuery.of(context).size.width * 0.08),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.all(
                            MediaQuery.of(context).size.width * 0.04),
                        child: Text(
                          'Description',
                          maxLines: 3,
                          style: TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.bold,
                              fontSize:
                                  MediaQuery.of(context).size.width * 0.05),
                        ),
                      ),
                    ),
                    Expanded(
                      child: TextButton(
                          child: Text(
                            'See More >',
                            style: TextStyle(
                                color: Theme.of(context).primaryColor,
                                fontWeight: FontWeight.w900),
                          ),
                          onPressed: () => scaffoldKey.currentState!
                              .showBottomSheet((context) => Container(
                                  height:
                                      MediaQuery.of(context).size.height * 0.8,
                                  width: double.infinity,
                                  decoration:
                                      BoxDecoration(color: Colors.white),
                                  child: Text('Details')))),
                    ),
                    Expanded(
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          padding: EdgeInsets.symmetric(
                              horizontal:
                                  MediaQuery.of(context).size.width * 0.08,
                              vertical:
                                  MediaQuery.of(context).size.height * 0.02),
                          decoration: BoxDecoration(
                              color: Color(0xFFF5F6F9),
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(25),
                                  topRight: Radius.circular(25))),
                          child: ElevatedButton(
                            child: Text('ORDER'),
                            onPressed: () {},
                            style: ButtonStyle(
                                padding: MaterialStateProperty.all(
                                    EdgeInsets.all(12)),
                                textStyle: MaterialStateProperty.all(TextStyle(
                                    fontSize:
                                        MediaQuery.of(context).size.width *
                                            0.07,
                                    fontWeight: FontWeight.bold))),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
